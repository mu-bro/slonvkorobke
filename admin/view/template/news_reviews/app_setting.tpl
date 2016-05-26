<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
		<div class="container-fluid">
			<div class="pull-right">
				<a href="<?php echo $clear; ?>" data-toggle="tooltip" title="<?php echo $button_clear_cache; ?>" class="btn btn-warning"><i class="fa fa-eraser"></i></a>
				<a href="<?php echo $backup; ?>" data-toggle="tooltip" title="<?php echo $button_save_backup; ?>" class="btn btn-default"><i class="fa fa-download"></i></a>
				<button type="submit" form="form-setting" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			</div>
			<div class="pull-left">
				<?php foreach ($main_menu as $menu) { ?>
				<a href="<?php echo $menu['action'];?>" data-toggle="tooltip" title="<?php echo $menu['text'];?>" class="btn btn-<?php if($menu['active']){echo 'success';}else{echo 'info';} ?>"><i class="<?php echo $menu['icon'];?>"></i></a>
				<?php } ?>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-puzzle-piece"></i><?php echo $text_news_setting; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="news_reviews_catalog_status"><?php echo $entry_module_status; ?></label>
						<div class="col-sm-9">
							<select name="news_reviews_catalog_status" id="news_reviews_catalog_status" class="form-control select-switcher">
								<?php if ( isset($news_reviews_catalog_status) && $news_reviews_catalog_status == 1 ) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="news_reviews_delete_status"><?php echo $entry_delete_status; ?></label>
						<div class="col-sm-9">
							<select name="news_reviews_delete_status" id="news_reviews_delete_status" class="form-control select-switcher">
								<?php if ( !isset($news_reviews_delete_status) || $news_reviews_delete_status == 1 ) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	jQuery(document).ready(function ($) {
		$(".select-switcher").each(function() {
			f_select_switcher($(this));
		});
		$(".select-switcher").change(function(){f_select_switcher($(this));});
	});
	function f_select_switcher(e) {
		if(e.val() == 0) {
			e.css('background-color', '#F7F7F9');
		} else {
			e.css('background-color', '#fff');
		}
	}
	//--></script>
<script type="text/javascript"><!--
$( document ).ready(function() {
	$('#menu li').removeClass('active open');
	$('#menu ul').removeClass('in');
	$('#menu #news_reviews_menu').addClass('active open');
	$('#menu #news_reviews_menu ul').addClass('in');
	$('#menu #app_setting').addClass('active open');
});
//--></script>
<?php echo $footer; ?>