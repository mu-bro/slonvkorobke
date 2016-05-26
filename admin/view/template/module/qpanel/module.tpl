<style type="text/css">
.qpanel {
	position:fixed;
	width:<?php echo $width; ?>px;
	height:100%;
	z-index:1000;
	background: url(view/image/transparent.png) repeat;
	border-right:2px solid #000;
	margin-left:-<?php echo $width; ?>px;
	padding-right:5px;
}
.qpanel a {
	color:#FFF;
	text-decoration:none;
}
.qpanel_setting {
	border-bottom:1px #FFFFFF dashed;
	margin:10px;
	float:right;
}
</style>
<a class="qpanel_setting" href="index.php?route=module/qpanel&token=<?php echo $this->session->data['token']; ?>">Setting</a>
<table width="100%">
 <tr>
  <?php $td = 0; ?>
  <?php foreach ($qpanel_setting['data'] as $data) { ?>
  <?php if ($data['link']) { ?>
  <td align="center" valign="top" width="<?php echo $td_width; ?>%">
  <a href="index.php?route=<?php echo $data['link']; ?>&token=<?php echo $this->session->data['token']; ?>">
  <?php if ($qpanel_setting['image_status']) { ?>
  <img src="<?php echo $data['thumb']; ?>" /><br />
  <?php } ?>
  <?php if (isset ($data['anchor'][$language_id])) { ?>
  <?php echo $data['anchor'][$language_id]; ?>
  <?php } ?>
  </a></td>
  <?php $td++; ?>
  <?php if ($td % $qpanel_setting['column_count'] == 0) { ?>
  </tr><tr>
  <?php } ?>
  <?php } ?>
  <?php } ?>
 </tr>
</table>
<script type="text/javascript"><!--
$('.qpanel').hover(function() {
	$(".qpanel").animate({left:'<?php echo $width; ?>px'}, 500);}, function() {
	$(".qpanel").animate({left:0}, 500);
});
//--></script>