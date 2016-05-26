<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                            class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                       class="btn btn-default"><i class="fa fa-reply"></i></a></div>
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
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
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured"
                          class="form-horizontal">
                        <table>
                            <tr valign="top">
                                <td>
                                    <table id="settings" class="list" style="width: 400px;">
                                        <tr>
                                            <td><?php echo $text_price_slider ?></td>
                                            <td><input id="price_slider_yes" type="radio" name="filterpro_setting[price_slider]"
                                                       value="1" <?php if (!isset($setting['price_slider']) || $setting['price_slider'] == '1') echo " checked='checked'" ?>>
                                                <label for="price_slider_yes"><?php echo $text_yes ?></label>
                                                <input id="price_slider_no" type="radio" name="filterpro_setting[price_slider]"
                                                       value="0" <?php if (isset($setting['price_slider']) && $setting['price_slider'] == '0') echo " checked='checked'" ?>>
                                                <label for="price_slider_no"><?php echo $text_no ?></label></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $text_manufacturer ?></td>
                                            <td><select name="filterpro_setting[display_manufacturer]">

                                                    <?php foreach ($display_options as $display_option) { ?>
                                                        <option value="<?php echo $display_option['value'] ?>"
                                                            <?php if (isset($setting['display_manufacturer']) && $display_option['value'] == $setting['display_manufacturer']) echo ' selected="selected"'; ?>>
                                                            <?php echo $display_option['name'] ?>
                                                        </option>
                                                    <?php } ?>
                                                </select>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <?php foreach ($options as $option) { ?>
                                            <tr>
                                                <td><?php echo $option['name'] ?></td>
                                                <td><select
                                                        name="filterpro_setting[display_option_<?php echo $option['option_id'] ?>]">
                                                        <?php foreach ($display_options as $display_option) { ?>
                                                            <option value="<?php echo $display_option['value'] ?>"
                                                                <?php if (isset($setting['display_option_' . $option['option_id']]) && $display_option['value'] == $setting['display_option_' . $option['option_id']]) echo '  selected="selected"'; ?>>
                                                                <?php echo $display_option['name'] ?>
                                                            </option>
                                                        <?php } ?>
                                                    </select>
                                            </tr>
                                        <?php } ?>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <?php $attribute_group = false; ?>
                                        <?php foreach ($attributes as $attribute) { ?>
                                            <?php if ($attribute_group != $attribute['attribute_group']) { ?>
                                                <?php $attribute_group = $attribute['attribute_group']; ?>
                                                <tr>
                                                    <td colspan="2"
                                                        style="text-align: center;"><?php echo $attribute['attribute_group'] ?></td>
                                                </tr>
                                            <?php } ?>
                                            <tr>
                                                <td><?php echo $attribute['name'] ?></td>
                                                <td><select
                                                        name="filterpro_setting[display_attribute_<?php echo $attribute['attribute_id'] ?>]">
                                                        <?php foreach ($display_options as $display_option) { ?>
                                                            <option value="<?php echo $display_option['value'] ?>"
                                                                <?php if (isset($setting['display_attribute_' . $attribute['attribute_id']]) && $display_option['value'] == $setting['display_attribute_' . $attribute['attribute_id']]) echo '  selected="selected"'; ?>>
                                                                <?php echo $display_option['name'] ?>
                                                            </option>
                                                        <?php } ?>
                                                    </select>
                                            </tr>
                                        <?php } ?>
                                    </table>
                                </td>
                                <td>
                                    <table class="list" style="width: 400px; float: left">
                                        <tr>
                                            <td><?php echo $text_attr_delimeter ?></td>
                                            <td><input id="attr_delimeter" type="text" name="filterpro_setting[attr_delimeter]"
                                                       size="3"
                                                       value="<?php if (isset($setting['attr_delimeter'])) echo $setting['attr_delimeter']; else echo ':'; ?>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $text_option_mode ?></td>
                                            <td><input id="option_mode_or" type="radio" name="filterpro_setting[option_mode]"
                                                       value="or" <?php if (!isset($setting['option_mode']) || $setting['option_mode'] == 'or') echo " checked='checked'" ?>>
                                                <label for="option_mode_or"><?php echo $text_mode_or ?></label>
                                                <input id="option_mode_and" type="radio" name="filterpro_setting[option_mode]"
                                                       value="and" <?php if (isset($setting['option_mode']) && $setting['option_mode'] == 'and') echo " checked='checked'" ?>>
                                                <label for="option_mode_and"><?php echo $text_mode_and ?></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $text_attribute_mode ?></td>
                                            <td><input id="attribute_mode_or" type="radio"
                                                       name="filterpro_setting[attribute_mode]"
                                                       value="or" <?php if (!isset($setting['attribute_mode']) || $setting['attribute_mode'] == 'or') echo " checked='checked'" ?>>
                                                <label for="attribute_mode_or"><?php echo $text_mode_or ?></label>
                                                <input id="attribute_mode_and" type="radio"
                                                       name="filterpro_setting[attribute_mode]"
                                                       value="and" <?php if (isset($setting['attribute_mode']) && $setting['attribute_mode'] == 'and') echo " checked='checked'" ?>>
                                                <label for="attribute_mode_and"><?php echo $text_mode_and ?></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $text_sku_display ?></td>
                                            <td><input id="sku_display_yes" type="radio" name="filterpro_setting[sku_display]"
                                                       value="1" <?php if (isset($setting['sku_display']) && $setting['sku_display'] == '1') echo " checked='checked'" ?>>
                                                <label for="sku_display_yes"><?php echo $text_yes ?></label>
                                                <input id="sku_display_no" type="radio" name="filterpro_setting[sku_display]"
                                                       value="0" <?php if (!isset($setting['sku_display']) || $setting['sku_display'] == '0') echo " checked='checked'" ?>>
                                                <label for="sku_display_no"><?php echo $text_no ?></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $text_model_display ?></td>
                                            <td><input id="model_display_yes" type="radio" name="filterpro_setting[model_display]"
                                                       value="1" <?php if (isset($setting['model_display']) && $setting['model_display'] == '1') echo " checked='checked'" ?>>
                                                <label for="model_display_yes"><?php echo $text_yes ?></label>
                                                <input id="model_display_no" type="radio" name="filterpro_setting[model_display]"
                                                       value="0" <?php if (!isset($setting['model_display']) || $setting['model_display'] == '0') echo " checked='checked'" ?>>
                                                <label for="model_display_no"><?php echo $text_no ?></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $text_brand_display ?></td>
                                            <td><input id="brand_display_yes" type="radio" name="filterpro_setting[brand_display]"
                                                       value="1" <?php if (isset($setting['brand_display']) && $setting['brand_display'] == '1') echo " checked='checked'" ?>>
                                                <label for="brand_display_yes"><?php echo $text_yes ?></label>
                                                <input id="brand_display_no" type="radio" name="filterpro_setting[brand_display]"
                                                       value="0" <?php if (!isset($setting['brand_display']) || $setting['brand_display'] == '0') echo " checked='checked'" ?>>
                                                <label for="brand_display_no"><?php echo $text_no ?></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $text_location_display ?></td>
                                            <td><input id="location_display_yes" type="radio"
                                                       name="filterpro_setting[location_display]"
                                                       value="1" <?php if (isset($setting['location_display']) && $setting['location_display'] == '1') echo " checked='checked'" ?>>
                                                <label for="location_display_yes"><?php echo $text_yes ?></label>
                                                <input id="location_display_no" type="radio"
                                                       name="filterpro_setting[location_display]"
                                                       value="0" <?php if (!isset($setting['location_display']) || $setting['location_display'] == '0') echo " checked='checked'" ?>>
                                                <label for="location_display_no"><?php echo $text_no ?></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $text_upc_display ?></td>
                                            <td><input id="upc_display_yes" type="radio" name="filterpro_setting[upc_display]"
                                                       value="1" <?php if (isset($setting['upc_display']) && $setting['upc_display'] == '1') echo " checked='checked'" ?>>
                                                <label for="upc_display_yes"><?php echo $text_yes ?></label>
                                                <input id="upc_display_no" type="radio" name="filterpro_setting[upc_display]"
                                                       value="0" <?php if (!isset($setting['upc_display']) || $setting['upc_display'] == '0') echo " checked='checked'" ?>>
                                                <label for="upc_display_no"><?php echo $text_no ?></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $text_stock_display ?></td>
                                            <td><input id="stock_display_yes" type="radio" name="filterpro_setting[stock_display]"
                                                       value="1" <?php if (isset($setting['stock_display']) && $setting['stock_display'] == '1') echo " checked='checked'" ?>>
                                                <label for="stock_display_yes"><?php echo $text_yes ?></label>
                                                <input id="stock_display_no" type="radio" name="filterpro_setting[stock_display]"
                                                       value="0" <?php if (!isset($setting['stock_display']) || $setting['stock_display'] == '0') echo " checked='checked'" ?>>
                                                <label for="stock_display_no"><?php echo $text_no ?></label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
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
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>