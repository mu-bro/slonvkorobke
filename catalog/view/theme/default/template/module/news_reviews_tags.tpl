<?php if( isset($tags) && !empty($tags) ) { ?>
<?php if ($heading_title) {?>
<h3 class="nr__module-heading"><?php echo $heading_title; ?></h3>
<?php } ?>
<div class="nr__tag-cloud">
	<?php echo $tags; ?>
</div>
<?php } ?>