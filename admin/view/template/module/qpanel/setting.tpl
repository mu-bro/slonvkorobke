<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
     <div id="tabs" class="htabs">
      <a href="#tab-general"><?php echo $tab_general; ?></a>
      <a href="#tab-optional"><?php echo $tab_optional; ?></a>
     </div>
     <div id="tab-general">
      <table id="qpanel" class="list">
        <thead>
          <tr>
            <td class="left" width="1"><?php echo $entry_image; ?></td>
            <td class="left" width="1"><?php echo $entry_link; ?></td>
            <td class="left"><?php echo $entry_anchor; ?></td>
            <td class="left" width="200"></td>
          </tr>
        </thead>
        <?php $qpanel_row = 0; ?>
        <?php foreach ($qpanel_setting['data'] as $data) { ?>
        <tbody id="qpanel-row<?php echo $qpanel_row; ?>">
          <tr>
            <td class="center">
             <a onclick="image_upload('image<?php echo $qpanel_row; ?>', 'thumb<?php echo $qpanel_row; ?>');"><img src="<?php echo $data['thumb']; ?>" alt="<?php echo $text_browse; ?>" title="<?php echo $text_browse; ?>" id="thumb<?php echo $qpanel_row; ?>" width="40" height="40" /></a><br />
             <input type="hidden" name="qpanel_setting[data][<?php echo $qpanel_row; ?>][image]" value="<?php echo $data['image']; ?>" id="image<?php echo $qpanel_row; ?>" />
             <a onclick="$('#thumb<?php echo $qpanel_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $qpanel_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
            </td>
            <td class="left"><input type="text" name="qpanel_setting[data][<?php echo $qpanel_row; ?>][link]" value="<?php echo $data['link']; ?>" size="50" /></td>
            <td class="left">
             <?php foreach ($languages as $language) { ?>
             <input type="text" name="qpanel_setting[data][<?php echo $qpanel_row; ?>][anchor][<?php echo $language['language_id']; ?>]" value="<?php echo $data['anchor'][$language['language_id']]; ?>" /> <img src="view/image/flags/<?php echo $language['image']; ?>" />&nbsp;&nbsp;&nbsp;
             <?php } ?>
            </td>
            <td class="left"><a onclick="$('#qpanel-row<?php echo $qpanel_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $qpanel_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="3"></td>
            <td class="left"><a onclick="addQpanelRow();" class="button"><?php echo $button_insert; ?></a></td>
          </tr>
        </tfoot>
      </table>
      </div>
     <div id="tab-optional">
      <table class="form">
       <tr>
        <td><?php echo $entry_column_count; ?></td>
        <td><input name="qpanel_setting[column_count]" value="<?php echo $qpanel_setting['column_count']; ?>" /></td>
       </tr>
       <tr>
        <td><?php echo $entry_image_status; ?></td>
        <td>
         <select name="qpanel_setting[image_status]">
          <?php if ($qpanel_setting['image_status']) { ?>
          <option value="0"><?php echo $text_no; ?></option>
          <option value="1" selected="selected"><?php echo $text_yes; ?></option>
          <?php } else { ?>
          <option value="0" selected="selected"><?php echo $text_no; ?></option>
          <option value="1"><?php echo $text_yes; ?></option>
          <?php } ?>
         </select>
        </td>
       </tr>
       <tr>
        <td><?php echo $entry_image_size; ?></td>
        <td><input name="qpanel_setting[image_width]" value="<?php echo $qpanel_setting['image_width']; ?>" size="6" /> x <input name="qpanel_setting[image_height]" value="<?php echo $qpanel_setting['image_height']; ?>" size="6" /></td>
       </tr>
      </table>
     </div>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
var qpanel_row = <?php echo $qpanel_row; ?>;

function addQpanelRow() {
	html  = '<tbody id="qpanel-row' + qpanel_row + '">';
	html += '<tr>';
	html += '<td class="left"><div class="image" style="text-align:center;"><a onclick="image_upload(\'image' + qpanel_row + '\', \'thumb' + qpanel_row + '\');"><img src="<?php echo $no_image; ?>" alt="<?php echo $text_browse; ?>" title="<?php echo $text_browse; ?>" id="thumb' + qpanel_row + '" width="40" height="40" /></a><br /><input type="hidden" name="qpanel_setting[data][' + qpanel_row + '][image]" value="" id="image' + qpanel_row + '" /><a onclick="$(\'#thumb' + qpanel_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + qpanel_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '<td class="left"><input type="text" name="qpanel_setting[data][' + qpanel_row + '][link]" value="" size="50" /></td>';
	html += '<td class="left">';
	<?php foreach ($languages as $language) { ?>
	html += '<input type="text" name="qpanel_setting[data][' + qpanel_row + '][anchor][<?php echo $language["language_id"]; ?>]" value="" />';
	html += ' <img src="view/image/flags/<?php echo $language["image"]; ?>" />&nbsp;&nbsp;&nbsp; ';
	<?php } ?>
	html += '</td>';
	html += '<td class="left"><a onclick="$(\'#qpanel-row' + qpanel_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '</tr>';
	html += '</tbody>';
	
	$('#qpanel tfoot').before(html);
	
	qpanel_row++;
}
//--></script>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" width="40" height="40" />');
					}
				});
			}
		},
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script>
<?php echo $footer; ?>