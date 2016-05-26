<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php if ( $breadcrumb['href'] ) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } else { ?>
		<li><?php echo $breadcrumb['text']; ?></li>
		<?php } ?>
		<?php } ?>
	</ul>
	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>">
			<?php echo $content_top; ?>
			
			<?php if( $heading_title || (($thumb || $description) && $page == 1) ) { ?>
			<h2 class="nr__category-heading"><?php echo $heading_title; ?></h2>
			<?php if ( ($thumb || $description) && $page == 1 ) { ?>
			<div class="row nr__category-info hidden-xs">
				<?php if($thumb) { ?>
				<div class="<?php echo $col_size['L']; ?>">
					<p><img class="img-responsive" src="<?php echo $thumb; ?>" alt="<?php echo $name; ?>" title="<?php echo $name; ?>" /></p>
				</div>
				<?php } ?>
				<?php if ($description) { ?>
				<div class="<?php echo empty($thumb) ? 'col-lg-12 col-md-12 col-sm-12 col-xs-12' : $col_size['R'];?>">
					<?php echo $description; ?>
				</div>
				<?php } ?>
			</div>
			<?php } ?>
			<?php } ?>
			<?php if ( $categories && $category_list == 'simple') { ?>
			<ul class="nr__category-list">
				<?php foreach ($categories as $category) { ?>
				<li class="nr__category-list-item"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
				<?php } ?>
			</ul>
			<?php } elseif ( $categories && $category_list == 'articles') {?>
			<?php foreach ($categories as $category) { ?>
			<h3 class="nr__category-heading"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h3>
			<div class="nr__category-articles">
			<?php if ($category['articles']) {echo $category['articles'];}?>
			</div>
			<?php } ?>

			<?php } ?>
			<!-- ARTICLES LIST -->
			<?php if ($articles) { ?>
			<?php echo $articles; ?>
			<?php if($pagination) { ?>
			<div class="row">
				<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
				<div class="col-sm-6 text-right"><?php echo $results; ?></div>
			</div>
			<?php } ?>
			<?php } ?>
			<!-- CONTENT BOTTOM -->
			<?php echo $content_bottom; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>