<?php
/*
	Zakladny controler/model pre stránku index (hlavnu stranku). Obsahuje funkcie, ktore plnia
	$page->data datami potrebnymi pre sablonu a v zavislosti od akcie.
	
	Prednastavena akcia, pokial nie je definovana v URl, je vzdy show (funkcia show). Najcastejsie 
	sa na nej zobrazuju nejake data, zoznam clankov a pod, editacia byva pod nejakou akciou.
	
	POZOR: Class IndexPage sa pri vytvarani inej stranky vzdy musi premenovat, napr. pre stranku
	clanky(.php) to bude class ClankyPage!!
*/

class IndexPage {

	function show(&$page) {
	
		//naplnit $page->data->premenna datami pre sablonu
		$page->data->nadpis = 'Test CMS - úvodná stránka';
	
	}

	function about(&$page) { //len pre priklad, teraz nepouzivame akciu about
	
		//naplnit $page->data->premenna datami pre sablonu
		$page->data->test = 'This is from About action!';
	
	}

}

?>