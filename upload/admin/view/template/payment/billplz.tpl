<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" onclick="save('save')" form="form-billplz" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-default" data-original-title="Save"><i class="fa fa-check"></i></button>
                <button type="submit" form="form-billplz" data-toggle="tooltip" title="<?php echo $button_saveclose; ?>" class="btn btn-default" data-original-title="Save & Close"><i class="fa fa-save text-success"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb"><?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li><?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid"><?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div><?php } ?>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
        </div>
        <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-billplz" class="form-horizontal">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-api-details" data-toggle="tab"><?php echo $tab_api_details; ?></a></li>
                    <li><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                    <li><a href="#tab-status" data-toggle="tab"><?php echo $tab_order_status; ?></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-api-details">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-is-sandbox"><span data-toggle="tooltip" title="<?php echo $help_is_sandbox; ?>"><?php echo $billplz_is_sandbox; ?></span></label>
                            <div class="col-sm-10">
                                <select name="billplz_is_sandbox_value" id="input-is-sandbox" class="form-control">
                                    <?php if ($billplz_is_sandbox_value) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-api-key"><span data-toggle="tooltip" title="<?php echo $help_api_key; ?>"><?php echo $billplz_api_key; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="billplz_api_key_value" value="<?php echo $billplz_api_key_value; ?>" placeholder="<?php echo $billplz_api_key; ?>" id="input-api-key" class="form-control" /><?php if ($error_api_key) { ?>
                                <div class="text-danger"><?php echo $error_api_key; ?></div><?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-collection-id"><?php echo $billplz_collection_id; ?><span data-toggle="tooltip" title="<?php echo $help_collection_id; ?>"></label>
                            <div class="col-sm-10">
                                <input type="text" name="billplz_collection_id_value" value="<?php echo $billplz_collection_id_value; ?>" placeholder="<?php echo $billplz_collection_id; ?>" id="input-collection-id" class="form-control" /><?php if ($error_collection_id) { ?>
                                <div class="text-danger"><?php echo $error_collection_id; ?></div><?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-x-signature"><span data-toggle="tooltip" title="<?php echo $help_x_signature; ?>"><?php echo $billplz_x_signature; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="billplz_x_signature_value" value="<?php echo $billplz_x_signature_value; ?>" placeholder="<?php echo $billplz_x_signature; ?>" id="input-x-signature" class="form-control" />
                                <?php if ($error_x_signature) { ?>
                                    <div class="text-danger"><?php echo $error_x_signature; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-general">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="billplz_total" value="<?php echo $billplz_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
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
                    </div>
                    <div class="tab-pane" id="tab-status">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_completed_status; ?></label>
                            <div class="col-sm-10">
                                <select name="billplz_completed_status_id" class="form-control">
                                    <?php foreach ($order_statuses as $order_status) {
                                        if ($order_status['order_status_id'] == $billplz_completed_status_id) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option><?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option><?php }} ?>
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
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
function save(type){
    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'button';
    input.value = type;
    form = $("form[id^='form-']").append(input);
    form.submit();
}
//--></script>
<?php echo $footer; ?>
