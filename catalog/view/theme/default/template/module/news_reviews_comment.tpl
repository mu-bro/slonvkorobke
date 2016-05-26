<?php if( isset($comments) && !empty($comments) ) { ?>
<?php if ($heading_title) {?>
<h3 class="nr__module-heading"><?php echo $heading_title; ?></h3>
<?php } ?>
<div class="nr__module-comment-list">
	<?php foreach ($comments as $comment) { ?>
	<div class="nr__module-comment-list-item">
	<p><a href="<?php echo $comment['href']; ?>"><?php echo $comment['name']; ?></a><br /> <?php echo $comment['text']; ?></p>
	</div>
	<?php } ?>
</div>
<?php } ?>