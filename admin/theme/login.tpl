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
    
	<div class="container-fluid">

		<div class="col-sm-12">

			<!-- page start -->
			
			<div class="login">
				<div class="row">

					<div class="col-sm-12">
						<div class="login-box">

							<div class="login-header">
								<h2>Prihlásenie</h2>
							</div>

							<?php if ($page->data->error != '') echo '<p class="alert alert-warning" role="alert">'.$page->data->error.'</p>'; ?>
							
							<form action="<?php echo $page->getUrl('index.php?page=login&action=login'); ?>" method="POST" id="login-form">
							
								<div class="login-content">
									<p>
										<label class="form-label">Meno:</label>
										<input class="form-control" name="username" value="" placeholder="Meno...">
									</p>
									<p>
										<label class="form-label">Heslo:</label>
										<input class="form-control" name="password" value="" placeholder="Heslo..." type="password">
									</p>
									<p>
										<input class="btn btn-block btn-form-login" value=" Prihlásiť " type="submit">
									</p>
								</div>
								
							</form>

						</div>
					</div>

				</div>
			</div>

			<!-- page end -->

		</div>
	</div>
	
</body>
</html>