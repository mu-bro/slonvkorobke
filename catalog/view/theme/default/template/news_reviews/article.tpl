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
		<?php $class = 'col-sm-6'; $cl = 'sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; $cl = 'sm-9';?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; $cl = 'sm-12';?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>" itemscope itemtype="http://schema.org/Article">
			<?php echo $content_top; ?>
			<h1 class="nr__article-heading" itemprop="headline"><?php echo $heading_title; ?></h1>
			<?php if($date_start || $thumb || $author || $viewed || $comment_status || $description) { ?>
			<div class="row nr__article-desc-block">
				<?php if($thumb) { ?>
				<div class="<?php echo $col_size['L']; ?>">
					<p><img alt="<?php echo $heading_title; ?>" class="img-responsive" itemprop="photo" src="<?php echo $thumb; ?>"></p>
				</div>
				<?php } ?>
				<div class="<?php echo empty($thumb) ? 'col-lg-12 col-md-12 col-sm-12 col-xs-12' : $col_size['R']; ?>">
					<p class="nr__article-desc">
						<?php if($date_start) { ?>
						<span class="nr__date-published" itemprop="datePublished"><?php echo $date_start;?></span>
						<?php } ?>
						<?php if($author) { ?>
						<span class="nr__post-by"><span itemprop="author"><?php echo $author; ?></span></span><span class="nr__separator"></span>
						<?php } ?>
						<?php if($viewed) { ?>
						<span class="nr__cnt-viewed" itemprop="interactionCount"><?php echo $text_num_view;?>: <?php echo $viewed;?></span>
						<?php } ?>
						<?php if($comment_status) {?>
						<span class="nr__cnt-comment"><a href="<?php echo $href;?>#cl" itemprop="commentCount"><?php echo $text_comments;?></a></span>
						<?php } ?>
					</p>
					<p itemprop="about" class="nr__article-about">
						<?php echo $description; ?>
					</p>
				</div>
			</div>
			<?php } ?>
			<?php if(!empty($toc_article)) { ?>
			<h3 class="nr__h3-heading"><?php echo $text_toc_article; ?></h3>
			<ul class="nr__article-toc">
				<?php foreach ($toc_article as $article) { ?>
				<?php if($article['href']) { ?>
				<li><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></li>
				<?php } else { ?>
				<li><?php echo $article['name']; ?></li>
				<?php } ?>
				<?php } ?>
			</ul>
			<?php } ?>
			<div class="nr__article-content" itemprop="articleBody"><?php echo $content; ?></div>
			<?php if(!empty($gallery)) { ?>
			<div class="psGallery">
				<div class="nr__article-gallery" itemscope itemtype="http://schema.org/ImageGallery">
					<?php foreach ($gallery as $image) { ?>
					<figure style="max-width:<?php echo $figure_max_width; ?>px" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
						<a href="<?php echo $image['image'];?>" itemprop="contentUrl" data-size="<?php echo ($image['size'])?$image['size']:'800x600';?>">
						<img src="<?php echo $image['thumb'];?>" itemprop="thumbnail" alt="<?php echo $image['text'];?>" />
						</a>
						<figcaption itemprop="caption description"><?php echo $image['text'];?></figcaption>
					</figure>
					<?php } ?>
				</div>
			</div>
			<!-- Root element of PhotoSwipe. Must have class pswp. -->
			<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="pswp__bg"></div>
				<div class="pswp__scroll-wrap">
					<div class="pswp__container">
						<div class="pswp__item"></div>
						<div class="pswp__item"></div>
						<div class="pswp__item"></div>
					</div>
					<div class="pswp__ui pswp__ui-hidden">
						<div class="pswp__top-bar">
							<div class="pswp__counter"></div>
							<button class="pswp__button pswp__button-close" title="Close (Esc)"></button>
							<button class="pswp__button pswp__button-share" title="Share"></button>
							<button class="pswp__button pswp__button-fs" title="Toggle fullscreen"></button>
							<button class="pswp__button pswp__button-zoom" title="Zoom in/out"></button>
							<div class="pswp__preloader">
								<div class="pswp__preloader__icn">
									<div class="pswp__preloader__cut">
										<div class="pswp__preloader__donut"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="pswp__share-modal pswp__share-modal-hidden pswp__single-tap">
							<div class="pswp__share-tooltip"></div>
						</div>
						<button class="pswp__button pswp__button-arrow-left" title="Previous (arrow left)"></button>
						<button class="pswp__button pswp__button-arrow-right" title="Next (arrow right)"></button>
						<div class="pswp__caption">
							<div class="pswp__caption__center"></div>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript"><!--
				$(document).ready(initPhotoSwipeFromDOM('.psGallery'));
				//--></script>
			<?php } ?>
			<div class="nr__article-share">
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
				<!-- AddThis Button END -->
			</div>
			<div class="nr__article-action">
				<div class="nr__article-url">
					<span><?php echo $text_article_url;?>:</span> <a itemprop="url" onclick="prompt('<?php echo $text_article_url;?>:\n<?php echo $heading_title; ?>','<?php echo $href;?>'); return false;" href="<?php echo $href;?>"><?php echo $href;?></a>
				</div>
				<?php if(!empty($categories)) { ?>
				<div class="nr__article-category">
					<span><?php echo $text_category;?>:</span>
					<?php for ($i = 0; $i < count($categories); $i++) { ?>
					<?php if ($i < (count($categories) - 1)) { ?>
					<a itemprop="articleSection" href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['text']; ?></a>,
					<?php } else { ?>
					<a itemprop="articleSection" href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['text']; ?></a>
					<?php } ?>
					<?php } ?>
				</div>
				<?php } ?>
				<?php if ($tags) { ?>
				<div class="nr__article-tag">
					<span><?php echo $text_tags; ?>: </span>
					<?php for ($i = 0; $i < count($tags); $i++) { ?>
					<?php if ($i < (count($tags) - 1)) { ?>
					<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
					<?php } else { ?>
					<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
					<?php } ?>
					<?php } ?>
				</div>
				<?php } ?>
			</div>
			<?php if(!empty($articles)) { ?>
			<h3 class="nr__h3-heading"><?php echo $text_article_related; ?></h3>
			<ul class="nr_article_related">
				<?php foreach ($articles as $article) { ?>
				<li><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></li>
				<?php } ?>
			</ul>
			<?php } ?>
			<!-- ///////////////////////////// BEGIN TEMPLATE PRODUCT RELATED ///////////////////////////// -->
			<?php if ($products) { ?>
			<!-- <h3 class="nr__h3-heading"><?php echo $text_product_related; ?></h3> -->
			<p>&nbsp;</p>
			<div class="row nr__product-related">
				<?php $i = 0; ?>
				<?php foreach ($products as $product) { ?>
				<?php if ($column_left && $column_right) { ?>
				<?php $class = 'col-lg-4 col-md-4 col-sm-12 col-xs-12'; ?>
				<?php } elseif ($column_left || $column_right) { ?>
				<?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
				<?php } else { ?>
				<?php $class = 'col-lg-2 col-md-2 col-sm-4 col-xs-12'; ?>
				<?php } ?>
				<div class="<?php echo $class; ?>">
					<div class="product-thumb transition">
						<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
						<div class="caption" style="min-height: 100px;">
							<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
							<!-- <p><?php echo $product['description']; ?></p> -->
							<?php if ($product['rating']) { ?>
							<div class="rating">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($product['rating'] < $i) { ?>
								<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
								<?php } else { ?>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<?php } ?>
								<?php } ?>
							</div>
							<?php } ?>
							<?php if ($product['price']) { ?>
							<p class="price">
								<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
								<?php } else { ?>
								<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
								<?php } ?>
								<?php if ($product['tax']) { ?>
								<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
								<?php } ?>
							</p>
							<?php } ?>
						</div>
						<!-- <div class="button-group">
							<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
							<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
							<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
							</div> -->
					</div>
				</div>
				<!-- <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
					<div class="clearfix visible-md visible-sm"></div>
					<?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
					<div class="clearfix visible-md"></div>
					<?php } elseif ($i % 4 == 0) { ?>
					<div class="clearfix visible-md"></div>
					<?php } ?> -->
				<?php $i++; ?>
				<?php } ?>
			</div>
			<?php } ?>
			<!-- ///////////////////////////// END TEMPLATE PRODUCT RELATED ///////////////////////////// -->
			<?php if ( $comment_status ) { ?>
			<div class="nr__comments" id="cl">
				<div id="article_comments">
					<h3 class="nr__h3-heading nr__comment-heading"><?php echo $heading_comment; ?></h3>
					<div id="comments"></div>
				</div>
			</div>
			<form id="comment_form">
				<div class="well">
					<fieldset>
						<div class="form-group required">
							<label class="control-label" for="comment_author"><?php echo $entry_name; ?></label>
							<?php if ($customer_id) { ?>
							<input type="text" id="comment_author" name="commentAuthor" value="<?php echo $customer_name; ?>" class="form-control" tabindex="1" disabled="disabled" />
							<?php } else { ?>
							<input type="text" id="comment_author" name="commentAuthor" value="" class="form-control" tabindex="1" />
							<?php } ?>
						</div>
						<div class="form-group required">
							<label class="control-label" for="comment_mail"><?php echo $entry_email; ?></label>
							<?php if ($customer_id) { ?>
							<input type="text" id="comment_mail" name="commentMail" value="<?php echo $customer_email; ?>" class="form-control" tabindex="2" disabled="disabled" />
							<?php } else { ?>
							<input type="text" id="comment_mail" name="commentMail" value="" class="form-control" tabindex="2" />
							<?php } ?>
						</div>
						<div class="form-group required">
							<label class="control-label" for="comment_text"><?php echo $entry_comment; ?></label>
							<textarea name="commentText" rows="10" id="comment_text" class="form-control" tabindex="3"></textarea>
						</div>
						<?php if ($captcha) { ?>
						<div class="form-group required">
							<label class="control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
							<br /><input style="width:150px;display:inline-block;" type="text" name="commentCaptcha" id="input-captcha" class="form-control" />
							<img id="img_code_captcha" src="index.php?route=news_reviews/comment/captcha" alt="" />
						</div>
						<?php } else { ?>
						<input type="hidden" name="commentCaptcha" id="input-captcha" value="0000" />
						<?php } ?>
						<input type="hidden" name="comment_parent_id" id="parent_id" value="0" />
						<div class="buttons">
							<div class="pull-left">
								<input id="btn_submit-comment" class="btn btn-primary" type="button" value="<?php echo $button_submit; ?>" />
								<a id="nr_cancel-comment-reply" href="#comment_form" class="btn btn-default" style="display:none;"><?php echo $text_cancel_reply; ?></a>
							</div>
						</div>
					</fieldset>
				</div>
			</form>
			<?php } ?>
			<!-- CONTENT BOTTOM -->
			<?php echo $content_bottom; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<?php if ( $comment_status ) { ?>
<script type="text/javascript"><!--
	$('#comments').load('index.php?route=news_reviews/comment&post=<?php echo $post_id; ?>',function(){});
	$(document).on('click', '#commentPagination a', function(e){
		$('.alert, .nr__error').remove();
		var m=addComment;
		if(m.I("tmp_comment_form")){
			m.R();
		}
		$('#article_comments').fadeOut(0).after('<div class="alert alert-info"><img src="catalog/view/theme/default/template/news_reviews/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		$('#comments').load(this.href);
		setTimeout(function(){
			$('.alert-info').remove();
			$('#article_comments').fadeIn(2000)
		},2500);
		return false;
	});
	$('#btn_submit-comment').bind('click', function() {
	$.ajax({
	        type: 'POST',
	        url: 'index.php?route=news_reviews/comment/write&post=<?php echo $post_id; ?>',
	        dataType: 'json',
	        data: 'author='+ encodeURIComponent($('input[name=\'commentAuthor\']').val())
	                + '&email=' + encodeURIComponent($('input[name=\'commentMail\']').val())
	                + '&text=' + encodeURIComponent($('textarea[name=\'commentText\']').val())
	                + '&captcha=' + encodeURIComponent($('input[name=\'commentCaptcha\']').val())
	                + '&parent_id=' + encodeURIComponent($('input[name=\'comment_parent_id\']').val()),
	        beforeSend: function() {
	                $('.alert, .nr__error').remove();
	                $('#btn_submit-comment').attr('disabled', true);
	                $('#comment_form').before('<div class="alert alert-info"><img src="catalog/view/theme/default/template/news_reviews/loading.gif" alt="" /><?php echo $text_wait; ?></div>');
	        },
	        complete: function() {
	                $('#btn_submit-comment').attr('disabled', false);
	                $('.alert-info').remove();
	        },
	        success: function(json) {
	                if (json['error']) {
	                        $('#comment_form').before('<div class="alert alert-danger">' + json['error']['common'] + '</div>');
	                        if (json['error']['author']) {
	                                $('#comment_author').after('<span class="nr__error">' + json['error']['author'] + '</span>');
	                        }
	                        if (json['error']['email']) {
	                                $('#comment_mail').after('<span class="nr__error">' + json['error']['email'] + '</span>');
	                        }
	                        if (json['error']['text']) {
	                                $('#comment_text').after('<span class="nr__error">' + json['error']['text'] + '</span>');
	                        }
	                        if (json['error']['captcha']) {
	                                $('#img_code_captcha').after('<span class="nr__error"><br />' + json['error']['captcha'] + '</span>');
	                                d = new Date();
	                                $("#img_code_captcha").attr("src", "<?php echo $captcha_url; ?>/?"+d.getTime());
	                        }
	                }
	                if (json['success']) {
	                        <?php if (!$customer_id) { ?>
	                                $('input[name=\'commentAuthor\']').val('');
	                                $('input[name=\'commentMail\']').val('');
	                        <?php } ?>
	                        $('input[name=\'commentWebsite\']').val('');
	                        $('textarea[name=\'commentText\']').val('');
	                        $('input[name=\'commentCaptcha\']').val('');
	                        $('#comment_form').before('<div class="alert alert-success">' + json['success'] + '</div>');
	                        setTimeout(function(){
	                                $('.alert-success').fadeOut(300).delay(450).remove();
	                                <?php if (!$comment_approval) { ?>
	                                        $('#nr_cancel-comment-reply').trigger('click');
	                                        $('#comments').delay(1000).load('index.php?route=news_reviews/comment&post=<?php echo $post_id; ?>');
	                                <?php } ?>
	                        },2500);
	                        var dd = new Date();
	                        $("#captcha").attr("src", "index.php?route=news_reviews/comment/captcha/?" + dd.getTime());
	                }
	        }
	});
	});
	addComment={
	moveForm:
	function(d,f,i,p){
	        document.getElementById(i).style.display="block";
	        var m=this,
	        a,
	        h=m.I(d),
	        b=m.I(i),
	        l=m.I("nr_cancel-comment-reply"),
	        k=m.I("author-"+f),
	        j=m.I("parent_id");
	        m.R();
	        if(!h||!b||!l||!j){
	                return
	        }
	        m.respondId=i;
	        document.getElementById('comment_text').value=k.value+', ';
	        if(!m.I("tmp_comment_form")){
	                a=document.createElement("div");
	                a.id="tmp_comment_form";
	                a.style.display="none";
	                b.parentNode.insertBefore(a,b)
	        }
	        h.parentNode.insertBefore(b,h.nextSibling);
	        j.value=p;
	        l.style.display="";
	        l.onclick=function(){
	                $('.alert, .nr__error').remove();
	                document.getElementById('comment_text').value="";
	                var n=addComment,e=n.I("tmp_comment_form"),o=n.I(n.respondId);
	                document.getElementById(i).style.display="";
	                if(!e||!o){
	                        return
	                }
	                n.I("parent_id").value="0";
	                e.parentNode.insertBefore(o,e);
	                e.parentNode.removeChild(e);
	                this.style.display="none";
	                this.onclick=null;
	                return false
	        };
	        try{
	                m.I("comment").focus()
	        }
	        catch(g){}
	        return false
	}
	,I:function(a){
	        return document.getElementById(a)
	},R:function(){
	        $('.alert, .nr__error').remove();
	        var m=addComment;
	        if(m.I("tmp_comment_form")){
	                document.getElementById('comment_text').value="";
	                var e=m.I("tmp_comment_form"),i=m.I('comment_form'),o=m.I(m.respondId),a=document.getElementById('nr_cancel-comment-reply');
	                i.style.display="";
	                if(e&&o){
	                        m.I("parent_id").value="0";
	                        e.parentNode.insertBefore(o,e);
	                        e.parentNode.removeChild(e);
	                        a.style.display="none";
	                        a.onclick=null;
	                }
	        }
	}
	};
	//--></script>
<?php } ?>
<?php echo $footer; ?>