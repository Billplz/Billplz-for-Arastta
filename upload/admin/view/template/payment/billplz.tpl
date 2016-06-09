<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-billplz" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-billplz" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-mid"><?php echo $entry_mid; ?></label>
            <div class="col-sm-10">
              <input type="text" name="billplz_mid" value="<?php echo $billplz_mid; ?>" placeholder="<?php echo $entry_mid; ?>" id="input-mid" class="form-control" />
              <?php if ($error_mid) { ?>
              <div class="text-danger"><?php echo $error_mid; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-vkey"><span data-toggle="tooltip" title="<?php echo $help_vkey; ?>"><?php echo $entry_vkey; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="billplz_vkey" value="<?php echo $billplz_vkey; ?>" placeholder="<?php echo $entry_vkey; ?>" id="input-vkey" class="form-control" />
              <?php if ($error_vkey) { ?>
              <div class="text-danger"><?php echo $error_vkey; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-notifycust"><span data-toggle="tooltip" title="<?php echo $help_notifycust; ?>"><?php echo $entry_notifycust; ?></label>
            <div class="col-sm-10">
			                <select name="billplz_notifycust" id="input-notifycust" class="form-control">
                <?php $number11=array("0","1","2","3");$idno=array("0"=>"No Notification","1"=>"Email Notification","2"=>"SMS Notification","3"=>"Email & SMS Notification"); foreach ($number11 as $idno3) { ?>
                <?php if ($idno3 == $billplz_notifycust) { ?>
                <option value="<?php echo $idno3; ?>" selected="selected"><?php echo $idno[$idno3]; ?></option>
                <?php } else { ?>
                <option value="<?php echo $idno3; ?>"><?php echo $idno[$idno3]; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
<div class="form-group">
            <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
            <div class="col-sm-10">
              <select name="billplz_order_status_id" id="input-order-status" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $billplz_order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $entry_completed_status; ?></label>
			<div class="col-sm-10">
			  <select name="billplz_completed_status_id" class="form-control">
				<?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $billplz_completed_status_id) { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
				<?php } ?>
				<?php } ?>
			  </select>
			</div>
		  </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $entry_pending_status; ?></label>
			<div class="col-sm-10">
			  <select name="billplz_pending_status_id" class="form-control">
				<?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $billplz_pending_status_id) { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
				<?php } ?>
				<?php } ?>
			  </select>
			</div>
		  </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $entry_failed_status; ?></label>
			<div class="col-sm-10">
			  <select name="billplz_failed_status_id" class="form-control">
				<?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $billplz_failed_status_id) { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
				<?php } ?>
				<?php } ?>
			  </select>
			</div>
		  </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
            <div class="col-sm-10">
              <select name="billplz_geo_zone_id" id="input-geo-zone" class="form-control">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $billplz_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="billplz_status" id="input-status" class="form-control">
                <?php if ($billplz_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="billplz_sort_order" value="<?php echo $billplz_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
        </form>
		<div>
		  <b style="color:red;">Notes:</b>
		  <ol >
		 <li style="padding:5px"> Login to <b><a href="https://www.billplz.com/" target="_blank" >Billplz</a></b> to get your <b style="color:red;">Api Key and Collection ID</b>. </li>
		  <li style="padding:5px"> Consider a donation to developer: <a href="http://bit.ly/1SigoZM" target="_blank"><b style="color:red;">Donate NOW</b></a></li>

		  <li style="padding:5px"> Please take note the charges for <b style="color:red;">SMS Notification</b> which cost <b style="color:red;">15 cent</b>.
		   </li>
		  </ol>
		</div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>