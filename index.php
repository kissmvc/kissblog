<?php
/**
 * KISS Framework - Very simple semi MVC framework with fast learning curve
 *
 * @package		KISS Framework
 * @author		Anton Piták, SOFTPAE.com
 * @copyright	Copyright (c) 2016, Anton Piták
 * @link		http://www.softpae.com
 * @since		Version 1.0.0
 * 
 * @requirements:
 * - php5 >= 5.4
 *
 */

//load config
if (is_file('config.php')) {
	require_once('config.php');
}

require_once('system/kiss.php');

$app = new KissApp();

$app->setSubFolder(APP_FOLDER);

//route pre zobrazenie clanku
$app->route('/clanok/[is:slug]', function(&$page, $slug) {
	$page->setRoute('index', 'clanok');
}, 'clanok');

//route pre kategóriu
$app->route('/category/[i:id]', function(&$page, $id) {
	$page->setRoute('index', 'category');
}, 'cat');

$app->run();


?>