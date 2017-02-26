<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="SOFTPAE.com">

	<title><?php echo ($page->data->title != '' ? $page->data->title.' - ' : $page->data->title); ?><?php echo $page->data->sitename; ?></title>

	<!-- Bootstrap Core CSS -->
	<link href="<?php echo $page->assets('theme/css/bootstrap.min.css'); ?>" rel="stylesheet">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="<?php echo $page->assets('theme/css/style.css'); ?>" rel="stylesheet">

	<!-- jQuery -->
	<script src="<?php echo $page->assets('theme/js/jquery.js'); ?>"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<?php echo $page->assets('theme/js/bootstrap.min.js'); ?>"></script>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>

<body id="page">
    
	<div class="container">
	
		<div class="row">
			<div class="col-sm-12 header">
				<h1><a href="<?php echo $page->getRootUrl(); ?>"><?php echo $page->data->sitename; ?></a></h1>
				<h2>Blog o programovaní a webdizajne</h2>
			</div>
		</div>
		
		<div class="row">
		
			<div class="col-sm-3 left">
				
				<ul class="nav">
					<li><a href="<?php echo $page->getRootUrl(); ?>">Úvod</a></li>
					<?php foreach($page->data->category as $category) {?>
						<li><a href="<?php echo $page->getRoute('cat', 'id='.$category->id); ?>"><?php echo $category->name; ?></a></li>
					<?php } ?>
				</ul>
				
			</div>
			
			<div class="col-sm-9 right">
    