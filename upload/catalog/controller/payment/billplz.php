<?php
/**
 * Billplz Arastta Plugin
 * 
 * @package Payment Gateway
 * @author Wanzul-Hosting.com <sales@wanzul-hosting.com>
 * @version 1.1
 */
class ControllerPaymentBillplz extends Controller
{
	public function index()
	{
		$data['button_confirm'] = $this->language->get('button_confirm');
		$this->load->model('checkout/order');
		$order_info  = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		$orderid     = $this->session->data['order_id'];
		$bill_mobile = $order_info['telephone'];
		$products    = $this->cart->getProducts();
		foreach ($products as $product) {
			$data['prod_desc'][] = $product['name'] . " x " . $product['quantity'];
		}
		//$data['lang'] = $this->session->data['language'];
		//$data['returnurl'] = $this->url->link('payment/billplz/return_ipn', '', 'SSL');
		$api_key       = $this->config->get('billplz_mid');
		$collection_id = $this->config->get('billplz_vkey');
		$custEmail     = $order_info['email'];
		$custName      = $order_info['payment_firstname'] . ' ' . $order_info['payment_lastname'];
		$amount1       = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false); //bermasalah
		$redirectURL   = $this->url->link('payment/billplz/return_ipn', '', 'SSL');
		$callbackURL   = $this->url->link('payment/billplz/callback_ipn', '', 'SSL');
		// number intelligence
		$custTel2      = substr($bill_mobile, 0, 1);
		if ($custTel2 == '+') {
			$custTel3 = substr($bill_mobile, 1, 1);
			if ($custTel3 != '6')
				$bill_mobile = "+6" . $bill_mobile;
		} else if ($custTel2 == '6') {
		} else {
			$bill_mobile = "+6" . $bill_mobile;
		}
		// number intelligence
		//untuk delivery notice
		$deliverynotice = $this->config->get('billplz_notifycust');
		if ($deliverynotice == 0) {
			$deliver = false;
		} else if ($deliverynotice == 1) {
			$deliver     = true;
			$bill_mobile = '';
		} else if ($deliverynotice == 2) {
			$deliver   = true;
			$custEmail = '';
		} else if ($deliverynotice == 3) {
			$deliver = true;
		}
		// mula sini
		$host    = 'https://www.billplz.com/api/v3/bills/';
		//$host = 'https://billplz-staging.herokuapp.com/api/v3/bills/';
		$data    = array(
			'collection_id' => $collection_id,
			'email' => $custEmail,
			'name' => $custName,
			'mobile' => $bill_mobile,
			'deliver' => $deliver,
			'description' => substr(implode("\n", $data['prod_desc']), 0, 199),
			'amount' => $amount1 * 100, // sbb sen
			'reference_1_label' => "ID",
			'reference_1' => $orderid,
			'callback_url' => $callbackURL,
			'redirect_url' => $redirectURL
		);
		$process = curl_init($host);
		curl_setopt($process, CURLOPT_HEADER, 0);
		curl_setopt($process, CURLOPT_USERPWD, $api_key . ":");
		curl_setopt($process, CURLOPT_TIMEOUT, 30);
		curl_setopt($process, CURLOPT_RETURNTRANSFER, TRUE);
		curl_setopt($process, CURLOPT_POSTFIELDS, http_build_query($data));
		$return = curl_exec($process);
		curl_close($process);
		$arr         = json_decode($return, true);
		$data['url'] = isset($arr['url']) ? $arr['url'] : '#';
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/billplz.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/payment/billplz.tpl', $data);
		} else {
			return $this->load->view('default/template/payment/billplz.tpl', $data);
		}
	}
	public function return_ipn()
	{
		$this->load->model('checkout/order');
		//$order_info = $this->model_checkout_order->getOrder($this->request->post['orderid']); // orderid
		$vkey          = $this->config->get('billplz_vkey');
		$api_key       = $this->config->get('billplz_mid');
		$verification2 = $_GET["billplz"];
		$verification2 = implode($verification2);
		$host          = 'https://www.billplz.com/api/v3/bills/' . "$verification2";
		//$host = 'https://billplz-staging.herokuapp.com/api/v3/bills/'."$verification2"; 
		$process       = curl_init($host);
		curl_setopt($process, CURLOPT_HEADER, 0);
		curl_setopt($process, CURLOPT_USERPWD, $api_key . ":");
		curl_setopt($process, CURLOPT_TIMEOUT, 30);
		curl_setopt($process, CURLOPT_RETURNTRANSFER, TRUE);
		$return = curl_exec($process);
		curl_close($process);
		$arra          = json_decode($return, true);
		$paymentStatus = $arra['paid'];
		$orderid       = $arra['reference_1'];
		if ($paymentStatus) {
			$order_status_id = $this->config->get('billplz_completed_status_id'); //uncomment
			$this->model_checkout_order->addOrderHistory($orderid, $order_status_id); //uncomment
			echo '<html>' . "\n";
			echo '<head>' . "\n";
			echo '  <meta http-equiv="Refresh" content="0; url=' . $this->url->link('checkout/success') . '">' . "\n";
			echo '</head>' . "\n";
			echo '<body>' . "\n";
			echo '  <p>Please follow <a href="' . $this->url->link('checkout/success') . '">link</a>!</p>' . "\n";
			echo '</body>' . "\n";
			echo '</html>' . "\n";
			exit();
		} else if (!$paymentStatus) {
			$order_status_id = $this->config->get('billplz_failed_status_id'); //uncomment
			$this->model_checkout_order->addOrderHistory($orderid, $order_status_id); //uncomment
			echo '<html>' . "\n";
			echo '<head>' . "\n";
			echo '  <meta http-equiv="Refresh" content="0; url=' . $this->url->link('checkout/checkout') . '">' . "\n";
			echo '</head>' . "\n";
			echo '<body>' . "\n";
			echo '  <p>Payment Failed! <a href="' . $this->url->link('checkout/checkout') . '">Click Here</a>!</p>' . "\n";
			echo '</body>' . "\n";
			echo '</html>' . "\n";
			exit();
		}
	}
	/*****************************************************
	 * Callback    ******************************************************/
	public function callback_ipn()
	{
		$this->load->model('checkout/order');
		$vkey            = $this->config->get('billplz_vkey');
		//$order_info = $this->model_checkout_order->getOrder($this->request->post['orderid']); // orderid
		$order_status_id = $this->config->get('config_order_status_id');
		$api_key         = $this->config->get('billplz_mid');
		$host            = 'https://www.billplz.com/api/v3/bills/' . $_POST['id'];
		//$host = 'https://billplz-staging.herokuapp.com/api/v3/bills/' .$_POST['id'];
		$process         = curl_init($host);
		curl_setopt($process, CURLOPT_HEADER, 0);
		curl_setopt($process, CURLOPT_USERPWD, $api_key . ":");
		curl_setopt($process, CURLOPT_TIMEOUT, 30);
		curl_setopt($process, CURLOPT_RETURNTRANSFER, TRUE);
		$return = curl_exec($process);
		curl_close($process);
		$arra           = json_decode($return, true);
		$payment_status = $arra['paid'];
		$orderid        = $arra['reference_1'];
		if ($payment_status) { //tukar true
			$order_status_id = $this->config->get('billplz_completed_status_id');
			$this->model_checkout_order->addOrderHistory($orderid, $order_status_id);
		} else if (!$payment_status) {
			$order_status_id = $this->config->get('billplz_failed_status_id');
			$this->model_checkout_order->addOrderHistory($orderid, $order_status_id);
		} else {
			$order_status_id = $this->config->get('billplz_pending_status_id');
		}
	}
}
