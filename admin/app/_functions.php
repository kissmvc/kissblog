<?php
/*
	Súbor _functions.php pre spoločné funkcie. Tu si môžeme vytvoriť rôzne funkcie,
	ktoré môžeme neskôr použiť v aplikácii, napr. skrátená funkcia pre výpis hodnoty pri
	akcii edit.
*/

// setup common page data

//naša doplnková funkcia, ktorá nám v template zjednoduší výpis hodnoty, ak je akcia edit
function ifedit($true, $false = '') {
	return ($_GET['action'] == 'edit' ? $true : $false);
}

?>