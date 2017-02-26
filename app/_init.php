<?php
/*
	Subor init.php sluzi na inicializaciu dát, ktore su spolocne pre vsetky stranky, 
	aby sme ich nemuseli naplnat v kazdej stranke a akcii zvlast. Preto sa init.php automaticky 
	sam vklada pred kazdu stranku. Tu mozeme napr. z databazy nacitat stranky pre menu či kategórie
	a potom naplnit do premennej, ktoru pouzijeme v sablone header.php na naplnenie menu.
	Alebo tu mozeme overovat prihlasenie uzivatela a dalsie spolocne veci.
*/

// setup common page data

$page->data->title = 'Úvod';
$page->data->description = 'Toto je blog o programovaní v PHP.';
$page->data->sitename = 'Môj Blog';
$page->data->siteemail = '';

$page->data->category = $page->db->select('category');


?>