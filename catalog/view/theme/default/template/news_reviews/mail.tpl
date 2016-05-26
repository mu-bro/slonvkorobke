<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><?php echo $title; ?></title>
	</head>
	<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
		<div style="width: 680px;">
			<div style="margin-bottom: 20px;"><a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a></div>
			<div>
				<p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $comment_greeting; ?></p>
				<p style="margin-top: 0px; margin-bottom: 20px;">
					<?php echo $comment_date; ?><br />
					<?php echo $comment_author; ?><br />
					<?php echo $comment_mail; ?>
				</p>
				<?php if ($comment_text) { ?>
				<p style="margin-top: 20px; margin-bottom: 20px;"><?php echo $comment_title; ?></p>
				<p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $comment_text; ?></p>
				<?php } ?>
				<p style="margin-top: 0px; margin-bottom: 20px;"><a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><?php echo $store_url; ?></a></p>
			</div>
		</div>
	</body>
</html>