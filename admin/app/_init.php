<?php
/*
	Subor init.php sluzi na inicializaciu dát, ktore su spolocne pre vsetky stranky, 
	aby sme ich nemusel naplnat v kazdej stranke zvlast. Preto sa init.php automaticky 
	sam vklada pred kazdu stranku. Tu mozeme napr. z databazy nacitat stranky pre menu
	a potom naplnit do premennej, ktoru pouzijeme v sablone header.php na naplnenie menu.
	Alebo tu mozeme overovat prihlasenie uzivatela a dalsie spolocne veci.
*/

// setup common page data

$page->data->title = 'Test CMS';
$page->data->sitename = 'SOFTPAE.com';
$page->data->siteemail = '';

?>