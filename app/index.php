<?php
/*
	Zakladny controler/model pre stránku clanky. Obsahuje funkcie, ktore plnia
	$page->data datami potrebnymi pre sablonu a v zavislosti od akcie.
	
	Prednastavena akcia, pokial nie je definovana v URL, je vzdy show (funkcia show). Najcastejsie 
	sa na nej zobrazuju nejake data, zoznam clankov a pod, editacia byva pod nejakou akciou.
*/

class IndexPage {

	//zakladna funkcia (akcia), kedze toto je index page, je to funkcia pre zobrazenie (pripravu dat) hlavnej stranky webu
	function show(&$page) {
		
		//pripravime sql prikaz pre databazu na nacitanie vsetkych clankov, prikaz posleme cez $page->db->query 
		//a vysledok - riadky - si ulozime do $page->data->clanky, aby sme to vedeli v template pouzit
		//obmedzime pocet na 10 clankov - mali by sme dorobit riadkovanie cez LIMIT a OFFSET, zatriedime od najnovsieho
		$sql = 'SELECT * FROM news ORDER BY id DESC LIMIT 10';
		$page->data->clanky = $page->db->query($sql);
	
	}
	
	//funkcia (akcia), ktoru zavolame, ked chceme zobrazit len jeden clanok
	function clanok(&$page) {
	
		//zmenime sablonu z index.php na clanok.php (koncovku nedavame)
		$page->tpl = 'clanok';
		
		//nacitaj id z getu, cez (int) upravime, aby to mohlo byt len cislo //ochrana proti hackovaniu
		//$news_id = (int)$page->from->get('id')->val(); //ak nepoužívame router pre krajšie adresy
		//$news_id = (int)$page->from->params('id')->val(); //ak používame router ale dávame len číslo člínku, bez krajšej adresy s titulkom v adrese
		$news_id = (int)$page->from->params('slug')->val(); //!!! (int) tam musí byť, inak "neoddelí" titulok od idčka na začiatku
		
		//pripravit prikaz sql pre nacitanie konkretneho clanku z db a odoslanie prikazu do db
		$query = 'SELECT * FROM news WHERE id='.$news_id;
		$page->data->clanok = $page->db->query($query)->row;
		
		//načítať komentáre pre daný článok
		$query = 'SELECT * FROM comments WHERE news_id='.$news_id;
		$page->data->comments = $page->db->query($query)->rows;
		
		//id si pridame aj do data pre template, napr. by sme ho potrebovali pre identifikaciu clanku, ku ktoremu by patril
		//odosielany komentar, tam by isiel do hidden inputu do formu pre komentar
		$page->data->news_id = $news_id;
		
		//vytvoríme si premennú aj pre URl článku, aby sme ju využili v komentoch na redirect a nemuseli ju skladať neskôr pri ukladaní komentu
		$page->data->url = $page->getRoute('clanok', 'slug='.idslug($page->data->clanok->id, $page->data->clanok->title));
		
		//a nastavíme aj title pre web, aby u článku bol titulkom stránky titulok článku
		$page->data->title = $page->data->clanok->title;
	
	}

	function addcomment(&$page) {
		
		$news_id = (int)$page->from->post('news_id')->val();
		
		//insert môžeme urobiť viac spôsobmi okrem skladania sql dotazu, napr. aj takto:
		$query = new QueryHelper($page);
		$cid = $query->into('comments')
			->fromPost()
			->addValue('news_id', (int)$page->from->post('news_id')->val())
			->addValue('name', $page->from->post('db_name')->val())
			->addValue('comment', $page->from->post('db_comment')->val())
			->insert();
		
		
		//zjednodušiť si to môžeme ešte viac cez QueryHelper a autoAdd
		//$query = new QueryHelper($page);
		//$query->into('comments')->fromPost()->autoAdd()->addValue('news_id', $news_id)->insert();
		
		//redirect naspäť na článok, k url pridáme idčko li-čka (pridali sme v šablóne), aby nás rovno odscrolovalo ku komentáru :)
		$page->redirect($page->from->post('redir')->val().'#comment-'.$cid, false);
	}

	function category(&$page) {
	
		$id = (int)$page->from->params('id')->val();
		
		//použijeme zjednodušujúcu funkciu db->select
		$page->data->clanky = $page->db->select('news', null, 'category_id = '.$id);
		
		//je to rovnaké rovnaké ako napísať:
		//$sql = 'SELECT * FROM news WHERE category_id = '.$id;
		//$page->data->clanky = $page->db->query($sql);
		
		//ja kategórii nastavíme title pre web podľa názvu kategórie
		$page->data->title = $page->db->select('category', $id)->row->name;
		
		
	}

}

?>