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
				<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-template').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
				<div class="well">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
								<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="control-label" for="input-filter-category-id"><?php echo $entry_news_category; ?></label>
								<select name="filter_category_id" id="input-filter-category-id" class="form-control">
									<option value=""><?php echo $text_none;?></option>
									<?php foreach ($article_categories as $category) { ?>
									<option value="<?php echo $category['category_id']; ?>" <?php if($filter_category_id == $category['category_id']){echo ' selected="selected"';}?>><?php echo $category['name'];?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="control-label" for="input-filter-template-id"><?php echo $entry_template; ?></label>
								<select name="filter_template_id" id="input-filter-template-id" class="form-control">
									<option value=""><?php echo $text_none;?></option>
									<?php foreach ($templates as $template) { ?>
									<option value="<?php echo $template['template_id']; ?>" <?php if($filter_template_id == $template['template_id']){echo ' selected="selected"';}?>><?php echo $template['template_name'];?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
								<select name="filter_status" id="input-status" class="form-control">
									<option value="*"><?php echo $text_none;?></option>
									<?php if ($filter_status) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
									<?php if (!$filter_status && !is_null($filter_status)) { ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="pull-right">
								<button type="button" id="button-filter" class="btn btn-primary"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
								<a href="<?php echo $reset;?>" class="btn btn-default"><?php echo $button_reset; ?></a>
							</div>
						</div>
					</div>
				</div>
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-template">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-center">&nbsp;</td>
									<td class="text-left">
									<?php if ($sort == 'nad.name') { ?>
										<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
									<?php } else { ?>
										<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
									<?php } ?>
									</td>
									<td class="text-center">
									<?php if ($sort == 'na.date_start') { ?>
										<a href="<?php echo $sort_date_start; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_start; ?></a>
									<?php } else { ?>
										<a href="<?php echo $sort_date_start; ?>"><?php echo $column_date_start; ?></a>
									<?php } ?>
									</td>
									<td class="text-center">
									<?php if ($sort == 'na.date_end') { ?>
										<a href="<?php echo $sort_date_end; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_end; ?></a>
									<?php } else { ?>
										<a href="<?php echo $sort_date_end; ?>"><?php echo $column_date_end; ?></a>
									<?php } ?>
									</td>
									<td class="text-center">
									<?php if ($sort == 'na.status') { ?>
										<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
									<?php } else { ?>
										<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
									<?php } ?>
									</td>
									<td class="text-center"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($articles) { ?>
								<?php foreach ($articles as $article) { $action = $article['action']; ?>
								<tr>
									<td class="text-center"><?php if (in_array($article['article_id'], $selected)) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $article['article_id']; ?>" checked="checked" />
										<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $article['article_id']; ?>" />
										<?php } ?>
									</td>
									<td class="text-center" style="width: 75px;">
										<?php if ($article['image']) { ?>
										<img src="<?php echo $article['image']; ?>" alt="<?php echo $article['name']; ?>" class="img-thumbnail" />
										<?php } else { ?>
										<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
										<?php } ?>
									</td>
									<td class="text-left">
										<?php echo $article['name']; ?>
										<div style="margin-top: 8px;"><small><u><?php echo $entry_template; ?>: <a href="<?php echo $article['filter_template_url']; ?>"><?php echo $article['template_name']; ?></a></u></small></div>
									</td>
									<td class="text-center text-nowrap"><?php echo $article['date_start']; ?></td>
									<td class="text-center text-nowrap"><?php echo $article['date_end']; ?></td>
									<td class="text-center"><?php echo $article['status']; ?></td>
									<td class="text-center" style="width: 100px;">
										<a href="<?php echo $action['view']['action']; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $action['view']['text']; ?>" class="btn btn-info"><i class="fa fa-link"></i></a>
										<a href="<?php echo $action['edit']['action']; ?>" data-toggle="tooltip" title="<?php echo $action['edit']['text']; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
									</td>
								</tr>
								<?php } ?>
								<?php } else { ?>
								<tr>
									<td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
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
$('#button-filter').on('click', function() {
	var url = 'index.php?route=news_reviews/app_article&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	var filter_category_id = $('select[name=\'filter_category_id\']').val();
	if (filter_category_id) {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	var filter_template_id = $('select[name=\'filter_template_id\']').val();
	if (filter_template_id) {
		url += '&filter_template_id=' + encodeURIComponent(filter_template_id);
	}
	var filter_status = $('select[name=\'filter_status\']').val();
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}

	location = url;
});
//--></script>
  <script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=news_reviews/app_article/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['article_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_name\']').val(item['label']);
	}
});
//--></script>
<script type="text/javascript"><!--
$( document ).ready(function() {
	$('#menu li').removeClass('active open');
	$('#menu ul').removeClass('in');
	$('#menu #news_reviews_menu').addClass('active open');
	$('#menu #news_reviews_menu ul').addClass('in');
	$('#menu #app_article').addClass('active open');
});
//--></script>
<?php echo $footer; ?>