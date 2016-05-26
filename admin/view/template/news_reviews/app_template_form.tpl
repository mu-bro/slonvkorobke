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
				<button type="submit" form="form-template" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-template" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-category" data-toggle="tab"><?php echo $tab_category; ?></a></li>
						<li><a href="#tab-article" data-toggle="tab"><?php echo $tab_article; ?></a></li>
						<li><a href="#tab-comment" data-toggle="tab"><?php echo $tab_comment; ?></a></li>
						<li><a href="#tab-module" data-toggle="tab"><?php echo $tab_module; ?></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-general">
							<div class="form-group form-group required">
								<label class="col-sm-3 control-label" for="template_name"><?php echo $entry_name; ?></label>
								<div class="col-sm-9">
									<input type="text" id="template_name"  name="template_name" value="<?php echo isset($template_name) ? $template_name : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
									<?php if ( isset($error_name) && !empty($error_name) ) { ?>
									<div class="text-danger"><?php echo $error_name;?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="template_comment"><?php echo $entry_comment; ?></label>
								<div class="col-sm-9">
									<textarea name="template_comment" rows="5" placeholder="<?php echo $entry_comment; ?>" id="template_comment" class="form-control"><?php echo isset($template_comment) ? $template_comment : ''; ?></textarea>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-category">
							<!-- ///////////////////// FOR CATEGORY ///////////////////// -->
							<div class="form-group" style="margin-bottom:0;">
								<label class="col-sm-3 control-label">&nbsp;</label>
								<div class="col-sm-9">
									<span class="form-control-static"><h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_for_category; ?></h3></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="show_category_name"><?php echo $entry_news_category_name; ?></label>
								<div class="col-sm-9">
									<select name="category[name]" id="show_category_name" class="form-control select-switcher">
										<?php if ( !isset($category['name']) || $category['name'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="show_about"><?php echo $entry_news_category_description; ?></label>
								<div class="col-sm-9">
									<select name="category[description]" id="show_about" class="form-control select-switcher">
										<?php if ( !isset($category['description']) || $category['description'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="show_image"><?php echo $entry_news_category_image; ?></label>
								<div class="col-sm-9">
									<select name="category[image]" id="show_image" class="form-control select-switcher">
										<?php if ( !isset($category['image']) || $category['image'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="col_size"><?php echo $entry_image_col_size; ?></label>
								<div class="col-sm-9">
									<select name="category[col_size]" id="col_size" class="form-control">
										<option value="2" <?php if(!isset($category['col_size']) || (isset($category['col_size'])) && $category['col_size'] == '2') echo ' selected="selected"';?>>2/12</option>
										<option value="3" <?php if(isset($category['col_size']) && $category['col_size'] == '3') echo ' selected="selected"';?>>3/12</option>
										<option value="4" <?php if(isset($category['col_size']) && $category['col_size'] == '4') echo ' selected="selected"';?>>4/12</option>
										<option value="5" <?php if(isset($category['col_size']) && $category['col_size'] == '5') echo ' selected="selected"';?>>5/12</option>
										<option value="6" <?php if(isset($category['col_size']) && $category['col_size'] == '6') echo ' selected="selected"';?>>6/12</option>
										<option value="12" <?php if(isset($category['col_size']) && $category['col_size'] == '12') echo ' selected="selected"';?>>12/12</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><?php echo $entry_news_category_image_size; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" name="category[image_width]" value="<?php echo isset($category['image_width']) ? $category['image_width'] : '160'; ?>" placeholder="" class="form-control" />
										</div>
										<div class="col-sm-2">
											<input type="text" name="category[image_height]" value="<?php echo isset($category['image_height']) ? $category['image_height'] : '120'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="category_list"><?php echo $entry_news_category_list; ?></label>
								<div class="col-sm-9">
									<select name="category[list]" id="category_list" class="form-control">
										<option value="no" <?php if(isset($category['list']) && $category['list'] == 'no') echo ' selected="selected"';?>><?php echo $text_not_show;?></option>
										<option value="simple" <?php if( !isset($category['list']) || (isset($category['list']) && $category['list'] == 'simple') ) echo ' selected="selected"';?>><?php echo $text_simple_list;?></option>
										<option value="articles" <?php if(isset($category['list']) && $category['list'] == 'articles') echo ' selected="selected"';?>><?php echo $text_list_articles;?></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="article_list"><?php echo $entry_article_list; ?></label>
								<div class="col-sm-9">
									<select name="category[article_list]" id="article_list" class="form-control select-switcher">
										<?php if ( !isset($category['article_list']) || $category['article_list'] == 1 ) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<!-- ///////////////////// FOR ARTICLE ///////////////////// -->
							<div class="form-group" style="margin-bottom:0;">
								<label class="col-sm-3 control-label">&nbsp;</label>
								<div class="col-sm-9">
									<span class="form-control-static"><h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_for_article; ?></h3></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="article_design"><?php echo $entry_article_design; ?></label>
								<div class="col-sm-9">
									<select name="category[design]" id="article_design" class="form-control">
										<option value="one" <?php if(!isset($category['design']) || $category['design'] == 'one') echo ' selected="selected"';?>><?php echo $text_one_column;?></option>
										<option value="two" <?php if(isset($category['design']) && (isset($category['design']) && $category['design'] == 'two') ) echo ' selected="selected"';?>><?php echo $text_two_column;?></option>
										<option value="simple" <?php if(isset($category['design']) && $category['design'] == 'simple') echo ' selected="selected"';?>><?php echo $text_simple_list;?></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="article_pagination"><?php echo $entry_article_pagination; ?></label>
								<div class="col-sm-9">
									<select name="category[pagination]" id="article_pagination" class="form-control select-switcher">
										<?php if ( !isset($category['pagination']) || $category['pagination'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="article_limit"><?php echo $entry_article_limit; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" name="category[article_limit]" value="<?php echo isset($category['article_limit']) ? $category['article_limit'] : '10'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="article_image"><?php echo $entry_article_image ; ?></label>
								<div class="col-sm-9">
									<select name="category[article_image]" id="article_image" class="form-control select-switcher">
										<?php if ( !isset($category['article_image']) || $category['article_image'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="article_col_size"><?php echo $entry_image_col_size; ?></label>
								<div class="col-sm-9">
									<select name="category[article_col_size]" id="article_col_size" class="form-control">
										<option value="2" <?php if(!isset($category['article_col_size']) || (isset($category['article_col_size'])) && $category['article_col_size'] == '2') echo ' selected="selected"';?>>2/12</option>
										<option value="3" <?php if(isset($category['article_col_size']) && $category['article_col_size'] == '3') echo ' selected="selected"';?>>3/12</option>
										<option value="4" <?php if(isset($category['article_col_size']) && $category['article_col_size'] == '4') echo ' selected="selected"';?>>4/12</option>
										<option value="5" <?php if(isset($category['article_col_size']) && $category['article_col_size'] == '5') echo ' selected="selected"';?>>5/12</option>
										<option value="6" <?php if(isset($category['article_col_size']) && $category['article_col_size'] == '6') echo ' selected="selected"';?>>6/12</option>
										<option value="12" <?php if(isset($category['article_col_size']) && $category['article_col_size'] == '12') echo ' selected="selected"';?>>12/12</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><?php echo $entry_article_image_size; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" name="category[article_image_width]" value="<?php echo isset($category['article_image_width']) ? $category['article_image_width'] : '160'; ?>" placeholder="" class="form-control" />
										</div>
										<div class="col-sm-2">
											<input type="text" name="category[article_image_height]" value="<?php echo isset($category['article_image_height']) ? $category['article_image_height'] : '120'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="article_date"><?php echo $entry_article_date ; ?></label>
								<div class="col-sm-9">
									<select name="category[article_date]" id="article_date" class="form-control select-switcher">
										<?php if ( !isset($category['article_date']) || $category['article_date'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="article_date_format"><?php echo $entry_article_date_format ; ?></label>
								<div class="col-sm-9">
									<select name="category[article_date_format]" id="article_date_format" class="form-control">
										<?php if(!isset($category['article_date_format'])){$category['article_date_format'] = 'd M, Y';} ?>
										<?php foreach($date_options as $key => $value) {?>
										<option value="<?php echo $key;?>" <?php if(isset($category['article_date_format']) && $category['article_date_format'] == $key){echo ' selected="selected"';}?>><?php echo $value;?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="article_short_text"><?php echo $entry_article_short_text ; ?></label>
								<div class="col-sm-9">
									<select name="category[article_short_text]" id="article_short_text" class="form-control select-switcher">
										<?php if ( !isset($category['article_short_text']) || $category['article_short_text'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="article_author"><?php echo $entry_article_author ; ?></label>
								<div class="col-sm-9">
									<select name="category[article_author]" id="article_author" class="form-control select-switcher">
										<?php if ( !isset($category['article_author']) || $category['article_author'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="comment_cnt"><?php echo $entry_article_comment_cnt ; ?></label>
								<div class="col-sm-9">
									<select name="category[comment_cnt]" id="comment_cnt" class="form-control select-switcher">
										<?php if ( isset($category['comment_cnt']) && $category['comment_cnt'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="view_cnt"><?php echo $entry_article_view_cnt ; ?></label>
								<div class="col-sm-9">
									<select name="category[view_cnt]" id="view_cnt" class="form-control select-switcher">
										<?php if ( isset($category['view_cnt']) && $category['view_cnt'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="category_article_sort_order"><?php echo $entry_sort_order ; ?></label>
								<div class="col-sm-9">
									<select name="category[sort_order]" id="category_article_sort_order" class="form-control select-switcher">
										<?php if ( isset($category['sort_order']) && $category['sort_order'] == 'na.sort_order' ) { ?>
										<option value="na.sort_order" selected="selected"><?php echo $text_by_sort_order; ?></option>
										<option value="na.date_start"><?php echo $text_by_date_start; ?></option>
										<?php } else { ?>
										<option value="na.sort_order"><?php echo $text_by_sort_order; ?></option>
										<option value="na.date_start" selected="selected"><?php echo $text_by_date_start; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
						</div><!-- BEGIN TAB CATEGORY -->

						<!-- BEGIN TAB ARTICLE -->
						<div class="tab-pane" id="tab-article">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-article_image"><?php echo $entry_article_image ; ?></label>
								<div class="col-sm-9">
									<select name="article[image]" id="ta-article_image" class="form-control select-switcher">
										<?php if ( !isset($article['image']) || $article['image'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-col_size"><?php echo $entry_image_col_size; ?></label>
								<div class="col-sm-9">
									<select name="article[col_size]" id="ta-col_size" class="form-control select-switcher">
										<option value="1" <?php if(isset($article['col_size']) && $article['col_size'] == '1') echo ' selected="selected"';?>>1/12</option>
										<option value="2" <?php if(isset($article['col_size']) && $article['col_size'] == '2') echo ' selected="selected"';?>>2/12</option>
										<option value="3" <?php if(isset($article['col_size']) && $article['col_size'] == '3') echo ' selected="selected"';?>>3/12</option>
										<option value="4" <?php if(isset($article['col_size']) && $article['col_size'] == '4') echo ' selected="selected"';?>>4/12</option>
										<option value="5" <?php if(isset($article['col_size']) && $article['col_size'] == '5') echo ' selected="selected"';?>>5/12</option>
										<option value="6" <?php if(isset($article['col_size']) && $article['col_size'] == '6') echo ' selected="selected"';?>>6/12</option>
										<option value="12" <?php if(isset($article['col_size']) && $article['col_size'] == '12') echo ' selected="selected"';?>>12/12</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><?php echo $entry_article_image_size; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" name="article[image_width]" value="<?php echo isset($article['image_width']) ? $article['image_width'] : '185'; ?>" placeholder="" class="form-control" />
										</div>
										<div class="col-sm-2">
											<input type="text" name="article[image_height]" value="<?php echo isset($article['image_height']) ? $article['image_height'] : '135'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><?php echo $entry_article_galery_image_size; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" name="article[gallery_image_width]" value="<?php echo isset($article['gallery_image_width']) ? $article['gallery_image_width'] : '160'; ?>" placeholder="" class="form-control" />
										</div>
										<div class="col-sm-2">
											<input type="text" name="article[gallery_image_height]" value="<?php echo isset($article['gallery_image_height']) ? $article['gallery_image_height'] : '120'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-show_article_date"><?php echo $entry_article_date; ?></label>
								<div class="col-sm-9">
									<select name="article[date]" id="ta-show_article_date" class="form-control select-switcher">
										<?php if ( !isset($article['date']) || $article['date'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-article_date_format"><?php echo $entry_article_date_format; ?></label>
								<div class="col-sm-9">
									<select name="article[date_format]" id="ta-article_date_format" class="form-control">
										<?php if(!isset($article['date_format'])){$article['date_format'] = 'd M, Y';}?>
										<?php foreach($date_options as $key => $value) {?>
										<option value="<?php echo $key;?>" <?php if(isset($article['date_format']) && $article['date_format'] == $key){echo ' selected="selected"';}?>><?php echo $value;?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-show_article_author"><?php echo $entry_article_author; ?></label>
								<div class="col-sm-9">
									<select name="article[author]" id="ta-show_article_author" class="form-control select-switcher">
										<?php if ( isset($article['author']) && $article['author'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-article_view_cnt"><?php echo $entry_article_view_cnt; ?></label>
								<div class="col-sm-9">
									<select name="article[view_cnt]" id="ta-article_view_cnt" class="form-control select-switcher">
										<?php if ( !isset($article['view_cnt']) || $article['view_cnt'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-show_short_text"><?php echo $entry_article_short_text; ?></label>
								<div class="col-sm-9">
									<select name="article[short_text]" id="ta-show_short_text" class="form-control select-switcher">
										<?php if ( isset($article['short_text']) && $article['short_text'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-related"><?php echo $entry_article_related; ?></label>
								<div class="col-sm-9">
									<select name="article[related]" id="ta-related" class="form-control select-switcher">
										<?php if ( !isset($article['related']) || $article['related'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-product_related"><?php echo $entry_product_related; ?></label>
								<div class="col-sm-9">
									<select name="article[product_related]" id="ta-product_related" class="form-control select-switcher">
										<?php if ( !isset($article['product_related']) || $article['product_related'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label"><?php echo $entry_product_image_size; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" name="article[product_image_width]" value="<?php echo isset($article['product_image_width']) ? $article['product_image_width'] : '80'; ?>" placeholder="" class="form-control" />
										</div>
										<div class="col-sm-2">
											<input type="text" name="article[product_image_height]" value="<?php echo isset($article['product_image_height']) ? $article['product_image_height'] : '80'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
						</div><!-- END TAB ARTICLE -->

						<!-- BEGIN TAB COMMENT -->
						<div class="tab-pane" id="tab-comment">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-comment_status"><?php echo $entry_comment_status; ?></label>
								<div class="col-sm-9">
									<select name="article[comment_status]" id="ta-comment_status" class="form-control select-switcher">
										<?php if ( isset($article['comment_status']) && $article['comment_status'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-comment_approval"><?php echo $entry_comment_approval; ?></label>
								<div class="col-sm-9">
									<select name="article[comment_approval]" id="ta-comment_approval" class="form-control select-switcher">
										<?php if ( isset($article['comment_approval']) && $article['comment_approval'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-captcha"><?php echo $entry_comment_captcha; ?></label>
								<div class="col-sm-9">
									<select name="article[captcha]" id="ta-captcha" class="form-control select-switcher">
										<?php if ( isset($article['captcha']) && $article['captcha'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="comment_limit"><?php echo $entry_comment_limit; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" name="article[comment_limit]" value="<?php echo isset($article['comment_limit']) ? $article['comment_limit'] : '10'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-reply_limit"><?php echo $entry_reply_limit; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input id="ta-reply_limit" type="text" name="article[reply_limit]" value="<?php echo isset($article['reply_limit']) ? $article['reply_limit'] : '100'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-comment_text_min"><?php echo $entry_comment_text_min; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" id="ta-comment_text_min" name="article[comment_text_min]" value="<?php echo isset($article['comment_text_min']) ? $article['comment_text_min'] : '25'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-comment_text_max"><?php echo $entry_comment_text_max; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" id="ta-comment_text_max" name="article[comment_text_max]" value="<?php echo isset($article['comment_text_max']) ? $article['comment_text_max'] : '1000'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-module-comment_date_format"><?php echo $entry_article_date_format ; ?></label>
								<div class="col-sm-9">
									<select name="article[comment_date_format]" id="ta-module-comment_date_format" class="form-control">
										<?php if(!isset($article['comment_date_format'])){$article['comment_date_format'] = 'd M, Y';} ?>
										<?php foreach($date_options as $key => $value) {?>
										<option value="<?php echo $key;?>" <?php if(isset($article['comment_date_format']) && $article['comment_date_format'] == $key){echo ' selected="selected"';}?>><?php echo $value;?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-comment_sort_order"><?php echo $entry_sort_order; ?></label>
								<div class="col-sm-9">
									<select name="article[sort_order]" id="ta-comment_sort_order" class="form-control select-switcher">
										<?php if ( isset($article['sort_order']) && $article['sort_order'] == "ASC" ) { ?>
										<option value="ASC" selected="selected"><?php echo $text_comment_asc; ?></option>
										<option value="DESC"><?php echo $text_comment_desc; ?></option>
										<?php } else { ?>
										<option value="ASC"><?php echo $text_comment_asc; ?></option>
										<option value="DESC" selected="selected"><?php echo $text_comment_desc; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-email_notify"><?php echo $entry_comment_email_notify; ?></label>
								<div class="col-sm-9">
									<select name="article[email_notify]" id="ta-email_notify" class="form-control select-switcher">
										<?php if ( isset($article['email_notify']) && $article['email_notify'] == 1 ) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
						</div><!-- END TAB COMMENT -->

						<!-- BEGIN TAB MODULE -->
						<div class="tab-pane" id="tab-module">
							<div class="form-group" style="margin-bottom:0;">
								<label class="col-sm-3 control-label">&nbsp;</label>
								<div class="col-sm-9">
									<span class="form-control-static"><h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_for_article; ?></h3></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-module-article_design"><?php echo $entry_article_design; ?></label>
								<div class="col-sm-9">
									<select name="module[design]" id="ta-module-article_design" class="form-control">
										<option value="one" <?php if(!isset($module['design']) || $module['design'] == 'one') echo ' selected="selected"';?>><?php echo $text_one_column;?></option>
										<option value="two" <?php if(isset($module['design']) && (isset($module['design']) && $module['design'] == 'two') ) echo ' selected="selected"';?>><?php echo $text_two_column;?></option>
										<option value="simple" <?php if(isset($module['design']) && $module['design'] == 'simple') echo ' selected="selected"';?>><?php echo $text_simple_list;?></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-module-article_image"><?php echo $entry_article_image ; ?></label>
								<div class="col-sm-9">
									<select name="module[article_image]" id="ta-module-article_image" class="form-control select-switcher">
										<?php if ( !isset($module['article_image']) || $module['article_image'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-module-col_size"><?php echo $entry_image_col_size; ?></label>
								<div class="col-sm-9">
									<select name="module[article_col_size]" id="ta-module-article_col_size" class="form-control">
										<option value="2" <?php if(!isset($module['article_col_size']) || (isset($module['article_col_size'])) && $module['article_col_size'] == '2') echo ' selected="selected"';?>>2/12</option>
										<option value="3" <?php if(isset($module['article_col_size']) && $module['article_col_size'] == '3') echo ' selected="selected"';?>>3/12</option>
										<option value="4" <?php if(isset($module['article_col_size']) && $module['article_col_size'] == '4') echo ' selected="selected"';?>>4/12</option>
										<option value="5" <?php if(isset($module['article_col_size']) && $module['article_col_size'] == '5') echo ' selected="selected"';?>>5/12</option>
										<option value="6" <?php if(isset($module['article_col_size']) && $module['article_col_size'] == '6') echo ' selected="selected"';?>>6/12</option>
										<option value="12" <?php if(isset($module['article_col_size']) && $module['article_col_size'] == '12') echo ' selected="selected"';?>>12/12</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><?php echo $entry_article_image_size; ?></label>
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-2">
											<input type="text" name="module[article_image_width]" value="<?php echo isset($module['article_image_width']) ? $module['article_image_width'] : '160'; ?>" placeholder="" class="form-control" />
										</div>
										<div class="col-sm-2">
											<input type="text" name="module[article_image_height]" value="<?php echo isset($module['article_image_height']) ? $module['article_image_height'] : '120'; ?>" placeholder="" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-module-article_date"><?php echo $entry_article_date ; ?></label>
								<div class="col-sm-9">
									<select name="module[article_date]" id="ta-module-article_date" class="form-control select-switcher">
										<?php if ( !isset($module['article_date']) || $module['article_date'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-module-article_date_format"><?php echo $entry_article_date_format ; ?></label>
								<div class="col-sm-9">
									<select name="module[article_date_format]" id="ta-module-article_date_format" class="form-control">
										<?php if(!isset($module['article_date_format'])){$module['article_date_format'] = 'd M, Y';} ?>
										<?php foreach($date_options as $key => $value) {?>
										<option value="<?php echo $key;?>" <?php if(isset($module['article_date_format']) && $module['article_date_format'] == $key){echo ' selected="selected"';}?>><?php echo $value;?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-module-article_short_text"><?php echo $entry_article_short_text ; ?></label>
								<div class="col-sm-9">
									<select name="module[article_short_text]" id="ta-module-article_short_text" class="form-control select-switcher">
										<?php if ( !isset($module['article_short_text']) || $module['article_short_text'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $help_description_length; ?>"><?php echo $entry_description_length; ?></span></label>
								<div class="col-sm-9">
									<input type="text" name="module[description_length]" value="<?php echo isset($module['description_length']) ? $module['description_length'] : '80'; ?>" placeholder="" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="ta-module-article_author"><?php echo $entry_article_author ; ?></label>
								<div class="col-sm-9">
									<select name="module[article_author]" id="ta-module-article_author" class="form-control select-switcher">
										<?php if ( !isset($module['article_author']) || $module['article_author'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-module-comment_cnt"><?php echo $entry_article_comment_cnt ; ?></label>
								<div class="col-sm-9">
									<select name="module[comment_cnt]" id="ta-module-comment_cnt" class="form-control select-switcher">
										<?php if ( isset($module['comment_cnt']) && $module['comment_cnt'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="ta-module-view_cnt"><?php echo $entry_article_view_cnt ; ?></label>
								<div class="col-sm-9">
									<select name="module[view_cnt]" id="ta-module-view_cnt" class="form-control select-switcher">
										<?php if ( isset($module['view_cnt']) && $module['view_cnt'] == 1 ) { ?>
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
								<label class="col-sm-3 control-label" for="module_article_sort_order"><?php echo $entry_sort_order ; ?></label>
								<div class="col-sm-9">
									<select name="module[sort_order]" id="module_article_sort_order" class="form-control select-switcher">
										<?php if ( isset($module['sort_order']) && $module['sort_order'] == 'na.sort_order' ) { ?>
										<option value="na.sort_order" selected="selected"><?php echo $text_by_sort_order; ?></option>
										<option value="na.date_start"><?php echo $text_by_date_start; ?></option>
										<?php } else { ?>
										<option value="na.sort_order"><?php echo $text_by_sort_order; ?></option>
										<option value="na.date_start" selected="selected"><?php echo $text_by_date_start; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
						</div><!-- END TAB MODULE -->
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	jQuery(document).ready(function ($) {
		f_category_style();
		$("#category_list").change(f_category_style);
		$(".select-switcher").each(function() {
			f_select_switcher($(this));
		});
		$(".select-switcher").change(function(){f_select_switcher($(this));});
	});
	function f_category_style() {
		if($("#category_list").val() == 'articles') {
			$("#article_list").val("0");
		}
	}
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
	$('#menu #app_template').addClass('active open');
});
//--></script>
<?php echo $footer; ?>