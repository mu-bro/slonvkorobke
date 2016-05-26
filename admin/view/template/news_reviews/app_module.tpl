<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<?php if ( $template == 'getForm' ) { ?>
	<div class="page-header">
		<div class="container-fluid">
			<h1><?php echo $text_module; ?></h1>
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
			<div class="pull-right">
				<button type="submit" form="form-module" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-module" class="form-horizontal">
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
						<div class="col-sm-10">
							<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							<?php if ($error_name) { ?>
							<div class="text-danger"><?php echo $error_name; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-module-type"><?php echo $entry_module_type; ?></label>
						<div class="col-sm-10">
							<select name="module_type" id="input-module-type" class="form-control">
								<option value="category" <?php if( !isset($module_type) || $module_type == 'category' ) echo ' selected="selected"';?>><?php echo $text_news_category; ?></option>
								<option value="article" <?php if( isset($module_type) && $module_type == 'article' ) echo ' selected="selected"';?>><?php echo $text_article; ?></option>
								<option value="comment" <?php if( isset($module_type) && $module_type == 'comment' ) echo ' selected="selected"';?>><?php echo $text_comment; ?></option>
								<option value="tags" <?php if( isset($module_type) && $module_type == 'tags' ) echo ' selected="selected"';?>><?php echo $text_type_tags; ?></option>
							</select>
						</div>
					</div>
					<div class="form-group" id="group-template">
						<label class="col-sm-2 control-label" for="input-template-id"><?php echo $entry_template; ?></label>
						<div class="col-sm-10">
							<select name="template_id" id="input-template-id" class="form-control">
								<?php foreach($templates as $template) { ?>
								<option value="<?php echo $template['template_id'];?>"<?php if(isset($template_id) && $template_id == $template['template_id']){echo ' selected="selected"';}?>><?php echo $template['template_name']; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-caption"><?php echo $entry_caption; ?></label>
						<div class="col-sm-10">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group">
								<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
								<input type="text" name="caption[<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_caption; ?>" class="form-control" value="<?php echo isset($caption[$language['language_id']]) ? $caption[$language['language_id']] : ''; ?>" />
							</div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-show-caption"><?php echo $entry_show_caption; ?></label>
						<div class="col-sm-10">
							<select name="show_caption" id="input-show-caption" class="form-control">
								<?php if ($show_caption) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group" id="group-category">
						<label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_autocomplete; ?>"><?php echo $entry_news_category; ?></span></label>
						<div class="col-sm-10">
							<input type="text" name="category" value="" placeholder="<?php echo $entry_news_category; ?>" id="input-category" class="form-control" />
							<div id="article-category" class="well well-sm" style="height: 150px; overflow: auto;">
								<?php foreach ($categories as $category) { ?>
								<div id="article-category<?php echo $category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
									<input type="hidden" name="categories[]" value="<?php echo $category['category_id']; ?>" />
								</div>
								<?php } ?>
							</div>
						</div>
					</div>
					<div class="form-group" id="group-limit">
						<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
						<div class="col-sm-10">
							<input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
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
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-layout-type"><span data-toggle="tooltip" title="<?php echo $help_autocomplete; ?>"><?php echo $entry_layout; ?></span></label>
						<div class="col-sm-10">
							<select name="layout_type" id="input-layout-type" class="form-control">
								<option value="0"<?php if( isset($layout_type) && $layout_type == 0 ){echo ' selected="selected"';} ?>><?php echo $text_none; ?></option>
								<option value="1"<?php if( isset($layout_type) && $layout_type == 1 ){echo ' selected="selected"';} ?>><?php echo $text_layout_product_category; ?></option>
								<option value="2"<?php if( isset($layout_type) && $layout_type == 2 ){echo ' selected="selected"';} ?>><?php echo $text_layout_product; ?></option>
								<option value="3"<?php if( isset($layout_type) && $layout_type == 3 ){echo ' selected="selected"';} ?>><?php echo $text_layout_manufacturer; ?></option>
								<option value="4"<?php if( isset($layout_type) && $layout_type == 4 ){echo ' selected="selected"';} ?>><?php echo $text_layout_information; ?></option>
								<option value="5"<?php if( isset($layout_type) && $layout_type == 5 ){echo ' selected="selected"';} ?>><?php echo $text_layout_article_category; ?></option>
								<option value="6"<?php if( isset($layout_type) && $layout_type == 6 ){echo ' selected="selected"';} ?>><?php echo $text_layout_article; ?></option>
							</select>
							<input style="margin-top:8px;" type="text" name="layout_name" value="" placeholder="<?php echo $entry_layout ?>" id="input-layout-name" class="form-control" />
							<div id="layout_data" class="well well-sm" style="margin-top:8px;height: 150px; overflow: auto;">
								<?php foreach ($layout_data as $layout_item) { ?>
								<div class="r000" id="layout_data<?php echo $layout_item['id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $layout_item['name']; ?>
									<input type="hidden" name="layout_item[]" value="<?php echo $layout_item['id']; ?>" />
								</div>
								<?php } ?>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript"><!--
	$( document ).ready(function() {
		f_input_module_type();
		$('#input-module-type').change(function(){
			f_input_module_type();
		});
	});
	function f_input_module_type(){
		switch ($('#input-module-type').val()) {
			case 'category':
				$('#group-limit').hide();
				$('#group-template').hide();
				$('#group-category').show();
				break;
			case 'tags':
				$('#group-template').hide();
				$('#group-category').hide();
				break;
			case 'article':
				$('#group-limit').show();
				$('#group-template').show();
				$('#group-category').show();
				break;
			case 'comment':
				$('#group-template').hide();
				$('#group-limit').show();
				$('#group-category').hide();
				break;
			default:
		}
	}
	$('#input-layout-type').change(function(){
		$('.r000').remove();
	});
	// Category
	$('input[name=\'category\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=news_reviews/app_category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['category_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'category\']').val('');
			$('#article-category' + item['value']).remove();
			$('#article-category').append('<div id="article-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="categories[]" value="' + item['value'] + '" /></div>');
		}
	});
	$('#article-category').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});

// Layout
$('input[name=\'layout_name\']').autocomplete({
	'source': function(request, response) {
		var u, v = $('#input-layout-type').val(), id;
		if( v == 0) {
			return;
		}  else if (v == 1) {
			u = 'catalog/category';
			id = 'category_id';
		} else if (v == 2) {
			u = 'catalog/product';
			id = 'product_id';
		} else if (v == 3) {
			u = 'catalog/manufacturer';
			id = 'manufacturer_id';
		} else if (v == 4) {
			u = 'news_reviews/app_information';
			id = 'information_id';
		} else if (v == 5) {
			u = 'news_reviews/app_category';
			id = 'category_id';
		} else if (v == 6) {
			u = 'news_reviews/app_article';
			id = 'article_id';
		} else {
			return;
		}
		$.ajax({
			url: 'index.php?route=' + u + '/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					manufacturer_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item[id]
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#input-layout-name').val('');
		$('#layout_data' + item['value']).remove();
		$('#layout_data').append('<div class="r000" id="layout_data' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="layout_item[]" value="' + item['value'] + '" /></div>');

	}
});
$('#layout_data').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
<?php } else { ?>
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
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-module').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-module">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php echo $column_name; ?></td>
									<td class="text-center"><?php echo $column_type; ?></td>
									<td class="text-center"><?php echo $column_status; ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($modules) { ?>
								<?php foreach ($modules as $module) { ?>
								<tr>
									<td class="text-center"><?php if (in_array($module['module_id'], $selected)) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $module['module_id']; ?>" checked="checked" />
										<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $module['module_id']; ?>" />
										<?php } ?>
									</td>
									<td class="text-left"><?php echo $module['name']; ?></td>
									<td class="text-center"><?php echo $module['type']; ?></td>
									<td class="text-center"><?php echo $module['status']; ?></td>
									<td class="text-right">
										<a href="<?php echo $module['href']; ?>" data-toggle="tooltip" title="<?php echo $module['text']; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
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
			</div>
		</div>
	</div>
<?php } ?>
</div>
<script type="text/javascript"><!--
$( document ).ready(function() {
	$('#menu li').removeClass('active open');
	$('#menu ul').removeClass('in');
	$('#menu #news_reviews_menu').addClass('active open');
	$('#menu #news_reviews_menu ul').addClass('in');
	$('#menu #app_module').addClass('active open');
});
//--></script>
<?php echo $footer; ?>
