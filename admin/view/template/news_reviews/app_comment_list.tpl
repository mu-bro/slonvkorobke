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
				<button type="button" href="<?php echo $on; ?>" data-toggle="tooltip" title="<?php echo $text_on; ?>" class="btn btn-success" onclick="$('#form-comment').attr('action', $(this).attr('href')).submit();"><i class="fa fa-plus-circle"></i></button>
				<button type="button" href="<?php echo $off; ?>" data-toggle="tooltip" title="<?php echo $text_off; ?>" class="btn btn-danger" onclick="$('#form-comment').attr('action', $(this).attr('href')).submit();"><i class="fa fa-minus-circle"></i></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-comment').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-comment">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td style="width: 80px;" class="text-center"><?php echo $column_date; ?></td>
									<th class="text-left"><?php echo $column_text; ?></th>
									<td class="text-center"><?php echo $column_status; ?></td>
									<td style="width: 100px;" class="text-center"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($comments) { ?>
								<?php foreach ($comments as $comment) { $action = $comment['action']; ?>
								<tr>
									<td class="text-center"><?php if (in_array($comment['comment_id'], $selected)) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $comment['comment_id']; ?>" checked="checked" />
										<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $comment['comment_id']; ?>" />
										<?php } ?>
									</td>
									<td class="text-center"><?php echo $comment['date_added']; ?></td>
									<td class="text-left">
										<a href="<?php echo $comment['url']; ?>" target="blank"><?php echo $comment['name']; ?></a>
										<p><?php echo $comment['author']; ?> | <?php echo $comment['email']; ?></p>
										<?php echo $comment['text']; ?>
										</td>
									<td class="text-center"><?php echo $comment['text_status']; ?></td>
									<td class="text-center">
										<?php if($comment['status']) { ?>
										<a href="<?php echo $action['disabled']['action']; ?>" data-toggle="tooltip" title="<?php echo $action['disabled']['text']; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>
										<?php } else { ?>
										<a href="<?php echo $action['enabled']['action']; ?>" data-toggle="tooltip" title="<?php echo $action['enabled']['text']; ?>" class="btn btn-success"><i class="fa fa-plus-circle"></i></a>
										<?php } ?>
										<a href="<?php echo $action['edit']['action']; ?>" data-toggle="tooltip" title="<?php echo $action['edit']['text']; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
									</td>
								</tr>
								<?php } ?>
								<?php } else { ?>
								<tr>
									<td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</form>
				<div class="row">
					<div class="col-sm-6 text-left"><?php echo $pagination ? $pagination :'&nbsp;'; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div>
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