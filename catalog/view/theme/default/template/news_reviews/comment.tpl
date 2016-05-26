<?php if ($comments) { ?>
<?php $class = 'odd'; ?>
<ul class="nr__comment-list">
	<?php foreach ($comments as $comment) { ?>
	<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
	<li class="<?php echo $class; ?> nr__comment-list-item">
		<div id="comment-<?php echo $comment['comment_id'];?>" itemprop="comment" itemscope itemtype="http://schema.org/UserComments">
			<input type="hidden" id="author-<?php echo $comment['comment_id'];?>" value="<?php echo $comment['author']; ?>" />
			<div class="nr__comment-author"><?php echo $comment['author']; ?></div>
			<div class="nr__comment-date-published">
				<span itemprop="commentTime"><?php echo $comment['date_added']; ?></span>
			</div>
			<p itemprop="commentText"><?php echo $comment['text']; ?></p>
			<div class="nr__buttons">
				<a class="nr_button-comment-reply" onclick='return addComment.moveForm("comment-<?php echo $comment['comment_id']; ?>", "<?php echo $comment['comment_id']; ?>", "comment_form", "<?php echo $comment['comment_id']; ?>")'><?php echo $text_reply; ?></a>
				<span class="nr__reply-comments-count"><?php echo $comment['reply_count'];?></span>
			</div>
		</div>
		<?php if ($comment['reply_comments']) { ?>
		<?php $class2 = 'odd'; ?>
		<ul class="nr__reply-comment-list">
			<?php foreach ($comment['reply_comments'] as $reply_comment) { ?>
			<?php $class2 = ($class2 == 'even' ? 'odd' : 'even'); ?>
			<li class="<?php echo $class2; ?> nr__reply-comment-list-item">
				<div id="comment-<?php echo $reply_comment['comment_id'];?>">
					<input type="hidden" id="author-<?php echo $reply_comment['comment_id'];?>" value="<?php echo $reply_comment['author']; ?>" />
					<div class="nr__comment-author"><?php echo $reply_comment['author']; ?></div>
					<div class="nr__comment-date-published"><?php echo $reply_comment['date_added']; ?></div>
					<p><?php echo $reply_comment['text']; ?></p>
					<div class="nr__buttons">
						<a class="nr_button-comment-reply" onclick='return addComment.moveForm("comment-<?php echo $reply_comment['comment_id']; ?>", "<?php echo $reply_comment['comment_id']; ?>", "comment_form", "<?php echo $comment['comment_id']; ?>")'><?php echo $text_reply; ?></a>
					</div>
				</div>
			</li>
			<?php } ?>
		</ul>
		<?php } ?>
	</li>
	<?php } ?>
</ul>
<?php if($pagination) { ?>
<div class="row" id="commentPagination">
	<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	<div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<?php } ?>
<?php } else { ?>
<div class="nr__comment-empty"><p><?php echo $text_no_comments; ?></p></div>
<?php } ?>