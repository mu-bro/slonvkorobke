<?php if ( isset($articles) && !empty($articles) ) { ?>
<?php if ($heading_title) {?>
<h3 class="nr__module-heading"><?php echo $heading_title; ?></h3>
<?php } ?>
<div class="row">
<div class="nr__module-layout col-lg-12 col-md-12 col-sm-12 col-xs-12">

<div class="nr__article-list nr__list-<?php echo $design; ?>">
	<?php $i = 0; ?>
	<?php foreach ($articles as $article) { // BEGIN foreach ($articles as $article) 
		?>
	<?php if($design == 'simple') { ?>
	<div class="nr__article-list-item" itemscope itemtype="http://schema.org/Article">
		<div>
			<?php if($article['date']) { ?>
			<span class="nr__date-published" itemprop="datePublished"><?php echo $article['date'];?></span>
			<?php } ?>
			<a itemprop="url" href="<?php echo $article['href']; ?>"><span itemprop="name"><?php echo $article['name']; ?></span></a>
		</div>
	</div>
	<?php } elseif ($design == 'one') { ?>
	<div class="row nr_article-list-item" itemscope itemtype="http://schema.org/Article">
		<?php if($article['thumb']) { ?>
		<div class="<?php echo $col_size['L']; ?>">
			<p class="nr__article-thumb"><a itemprop="url" href="<?php echo $article['href']; ?>"><img title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" class="img-responsive" itemprop="photo" src="<?php echo $article['thumb']; ?>"></a></p>
		</div>
		<?php } ?>
		<div class="<?php echo $col_size['R']; ?>">
			<h4 class="nr__article-heading">
				<a itemprop="url" href="<?php echo $article['href']; ?>"><span itemprop="name"><?php echo $article['name']; ?></span></a>
			</h4>
			<?php if($article['date'] || $article['description']) { ?>
			<p class="nr__article-desc">
				<?php if($article['date']) { ?>
				<span class="nr__date-published" itemprop="datePublished"><?php echo $article['date'];?></span>
				<?php } ?>
				<?php if($article['description']) { ?>
				<span class="nr_article-about" itemprop="about"><?php echo $article['description'];?></span>
				<?php if($description_length) { ?><span class="nr_article-more"><a href="<?php echo $article['href']; ?>"><?php echo $text_more; ?></a></span><?php } ?>
				<?php } ?>
			</p>
			<?php } ?>
			<?php if($article['viewed'] || $article['comment']) { ?>
			<p class="nr__box-informer">
				<?php if($article['viewed']) { ?>
				<span class="nr__cnt-viewed" itemprop="interactionCount"><?php echo $text_num_view;?>: <?php echo $article['viewed'];?></span>
				<?php } ?>
				<?php if($article['comment']) { ?>
				<span class="nr__cnt-comment"><a itemprop="commentCount" href="<?php echo $article['href']; ?>#cl"><?php echo $text_num_comment;?>: <?php echo $article['comment']; ?></a></span>
				<?php } ?>
			</p>
			<?php } ?>
		</div>
	</div>
	<?php } elseif ($design == 'two') { ?> <!-- BEGIN TWO COLUMN -->
	<?php if( !($i%2) ) { ?>
	<div class="row">
		<?php } ?>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12  nr__article-list-item" itemscope itemtype="http://schema.org/Article">
			<div class="row">
				<?php if($article['thumb']) { ?>
				<div class="<?php echo $col_size['L']; ?>">
					<p class="nr__article-thumb"><a itemprop="url" href="<?php echo $article['href']; ?>"><img title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" class="img-responsive" itemprop="photo" src="<?php echo $article['thumb']; ?>"></a></p>
				</div>
				<?php } ?>
				<div class="<?php echo $col_size['R']; ?>">
					<h4 class="nr__article-heading">
						<a itemprop="url" href="<?php echo $article['href']; ?>"><span itemprop="name"><?php echo $article['name']; ?></span></a>
					</h4>
					<?php if($article['date'] || $article['description']) { ?>
					<p class="nr__article-desc">
						<?php if($article['date']) { ?>
						<span class="nr__date-published" itemprop="datePublished"><?php echo $article['date'];?></span>
						<?php } ?>
						<?php if($article['description']) { ?>
						<span class="nr_article-about" itemprop="about"><?php echo $article['description'];?></span>
						<?php if($description_length) { ?></php?><span class="nr_article-more"><a href="<?php echo $article['href']; ?>"><?php echo $text_more; ?></a></span><?php } ?>
						<?php } ?>
					</p>
					<?php } ?>
					<?php if($article['viewed'] || $article['comment']) { ?>
					<p class="nr__box-informer">
						<?php if($article['viewed']) { ?>
						<span class="nr__cnt-viewed" itemprop="interactionCount"><?php echo $text_num_view;?>: <?php echo $article['viewed'];?></span>
						<?php } ?>
						<?php if($article['comment']) { ?>
						<span class="nr__cnt-comment"><a itemprop="commentCount" href="<?php echo $article['href']; ?>#cl"><?php echo $text_num_comment;?>: <?php echo $article['comment']; ?></a></span>
						<?php } ?>
					</p>
					<?php } ?>
				</div>
			</div>
			<!-- end row -->
		</div>
		<?php if( $i%2 ) {?>
	</div>
	<?php }  $i++; ?>
	<?php } ?><!-- END TWO COLUMN -->
	<?php } // END foreach ($articles as $article)
		?>
</div>

</div>
</div>
<?php } ?>