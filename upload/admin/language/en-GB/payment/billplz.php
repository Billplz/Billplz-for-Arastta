<?php
/**
 * Billplz OpenCart Plugin
 * 
 * @package Payment Gateway
 * @author Wanzul-Hosting.com <sales@wanzul-hosting.com>
 * @version 2.0
 */
 
 // Versioning
$_['billplz_ptype'] = "OpenCart";
$_['billplz_pversion'] = "2.0";

// Heading
$_['heading_title']					= 'Billplz Malaysia Online Payment Gateway';

// Text
$_['text_payment']					= 'Payment';
$_['text_success']					= 'Success: You have modified Billplz Malaysia Online Payment Gateway account details!';
$_['text_edit']                     = 'Edit Billplz';
$_['text_billplz']	     			= '<a onclick="window.open(\'http://www.billplz.com/\');" style="text-decoration:none;"><img src="view/image/payment/billplz-logo.jpg" alt="Billplz Online Payment Gateway" title="Billplz Malaysia Online Payment Gateway" style="border: 0px solid #EEEEEE;" height=63 width=198/></a>';

// Entry
$_['entry_mid']						= 'Billplz Api Key';
$_['entry_vkey']					= 'Billplz Collection ID';
$_['entry_notifycust']					= 'Notify Customer';
$_['entry_order_status']			= 'Order Status';
$_['entry_completed_status']		= 'Completed Status';
$_['entry_pending_status']			= 'Pending Status';
$_['entry_failed_status']			= 'Failed Status';
$_['entry_geo_zone']				= 'Geo Zone';
$_['entry_status']					= 'Status';
$_['entry_sort_order']				= 'Sort Order';

// Help
$_['help_vkey']						= 'Collection ID.';
$_['help_notifycust']					= 'Default is No Notification';

// Error
$_['error_permission']				= 'Warning: You do not have permission to modify Billplz Malaysia Online Payment Gateway!';
$_['error_mid']						= '<b>Billplz Merchant ID</b> Required!';
$_['error_vkey']					= '<b>Billplz Verify Key</b> Required!';
$_['error_settings']       			= 'Billplz merchant id and verify key mismatch, contact support@billplz.com to assist.';
$_['error_status']          		= 'Unable to connect Billplz API.';