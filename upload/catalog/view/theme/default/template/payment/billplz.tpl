<?php if ($is_sandbox) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_is_sandbox; ?></div>
<?php } ?>
<form action="<?php echo $action; ?>" method="post">
  <div class="buttons">
    <div class="pull-right">
      <input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
    </div>
  </div>
</form>
