<?php

class ClankyPage {

	function show(&$page) {
		
		$page->data->clanky = $page->db->select('news'); //same as 'SELECT * FROM news'
	
	}
	
	function add(&$page) {
	
		$page->tpl = 'clanky-edit';
		
		$page->data->news_id = 0;

		$page->data->category = $page->db->select('category');
	
	}
	
	function edit(&$page) {
	
		$page->tpl = 'clanky-edit';
		
		$news_id = (int)$page->from->get('id')->val();

		$page->data->category = $page->db->select('category');
		
		$page->data->clanok = $page->db->select('news', $news_id); //same as 'SELECT * FROM news WHERE id='.$news_id
		
		$page->data->news_id = $news_id;
		
	}

	function save(&$page) {
		
		$news_id = (int)$page->from->post('id')->val();
		
		$query = new QueryHelper($page);
		$query->into('news')->fromPost()->autoAdd()->addField('category_id');

		if ($page->from->files('file1')->fileerror() == 0) {
		
			$page->from->files('file1')->uploadImage('../public/images/');
			$image = $page->from->files('file1')->filename();

			$imgclass = new Image('../public/images/'.$image);
			$imgclass->resize(400, 400)->save('../public/images/'.$image);

			$query->addValue('image', $image);
			
		}

		if ($news_id > 0) {
			$query->update($news_id);
		} else {
			$query->insert();
		}
		
		$page->redirect('?page=clanky');
	
	}

	function delete(&$page) {
		
		$news_id = (int)$page->from->get('id')->val();
		
		$page->db->delete('news', $news_id);
		
		$page->redirect('?page=clanky');

	}

}

?>