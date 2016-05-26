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
				<h3 class="panel-title"><i class="fa fa-puzzle-piece"></i><?php echo $text_about; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-about" class="form-horizontal">
					<?php if (empty($license_key)) { ?>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-license-key"><?php echo $entry_input_key; ?></label>
						<div class="col-sm-9">
							<div class="input-group">
								<input type="text" name="license_key" value="" id="input-license-key" class="form-control" />
								<span class="input-group-btn">
								<button type="button" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary" onclick="$('#form-about').submit();"><i class="fa fa-save"></i></button>
								</span>
							</div>
							<!-- /input-group -->
						</div>
					</div>
					<?php } ?>
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $entry_key; ?></label>
						<div class="col-sm-9">
							<?php if(empty($license_key)) { ?>
								<p class="form-control-static text-warning"><strong><?php echo $text_empty_key; ?></strong></p>
							<?php } else { ?>
								<p class="form-control-static"><a onclick="prompt('<?php echo $entry_key;?>','<?php echo $license_key;?>'); return false;"><?php echo $text_show;?></a></p>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $entry_module; ?></label>
						<div class="col-sm-9">
							<p class="form-control-static"><?php echo $text_module_name?></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $entry_version; ?></label>
						<div class="col-sm-9">
							<p class="form-control-static"><?php echo $text_module_version?></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $entry_home_page; ?></label>
						<div class="col-sm-9">
							<p class="form-control-static"><a target="blank" href="http://<?php echo $text_module_home_page?>"><?php echo $text_module_home_page?></a></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"><?php echo $entry_support; ?></label>
						<div class="col-sm-9">
							<p class="form-control-static"><?php echo $text_support?></p>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
$( document ).ready(function() {
	$('#menu li').removeClass('active open');
	$('#menu ul').removeClass('in');
	$('#menu #news_reviews_menu').addClass('active open');
	$('#menu #news_reviews_menu ul').addClass('in');
	$('#menu #app_about').addClass('active open');
});
//--></script>
<?php echo $footer; ?>