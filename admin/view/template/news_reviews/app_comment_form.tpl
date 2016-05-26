

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
				<button type="submit" form="form-category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category" class="form-horizontal">
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-author"><?php echo $entry_author; ?></label>
						<div class="col-sm-10">
							<input type="text" name="author" value="<?php echo isset($author) ? $author : ''; ?>" id="input-author" class="form-control" />
							<?php if ($error_author) { ?>
							<div class="text-danger"><?php echo $error_author; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
						<div class="col-sm-10">
							<input type="text" name="email" value="<?php echo isset($email) ? $email : ''; ?>" id="input-email" class="form-control" />
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-text"><?php echo $entry_comment_text; ?></label>
						<div class="col-sm-10">
							<textarea name="text" rows="10" id="input-text" class="form-control"><?php echo isset($text) ? $text : ''; ?></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="status" id="input-status" class="form-control">
								<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
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
$( document ).ready(function() {
	$('#menu li').removeClass('active open');
	$('#menu ul').removeClass('in');
	$('#menu #news_reviews_menu').addClass('active open');
	$('#menu #news_reviews_menu ul').addClass('in');
	$('#menu #app_comment').addClass('active open');
});
//--></script>
<?php echo $footer; ?>