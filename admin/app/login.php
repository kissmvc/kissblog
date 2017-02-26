<?php

class LoginPage {

	function show(&$page) {

		$page->data->formurl = 'index.php?page=login&action=login';
	
	}

	function login(&$page) {
	
		// jednoduche prihlasenie s napevno nastvenym menom a heslom (md5 hash)
		
		if ($page->from->post('username') == 'admin' && md5($page->from->post('password')) == md5('admin')){

			//logon ok, setup session
			$page->session->set('kiss_loged', 1);
			
			$page->redirect('/');
			//header('Location: ');
			//exit();
			
		} else {
			//logon wrong, prepare message for display
			$page->data->error = 'Zlé meno alebo heslo!';
		}
	
		/*
		// vzor prihlásenia cez databazu s tabulkou users
		
		$query = "SELECT * FROM users WHERE username='".$page->r->post['username']."' AND password='".md5($page->r->post['password'])."' LIMIT 1";
		$page->data->onlineuser = $page->db->query($query);

		if ($page->from->post('username')->val() == $page->data->onlineuser->row->username && md5($page->from->post('password')->val()) == $page->data->onlineuser->row->password) {

			//logon ok, setup session
			$page->session->set('kiss_loged', 1);
			$page->session->set('kiss_userid', $page->data->onlineuser->row->user_id);

			header('Location: index.php');
			exit();
			
		} else {
			//logon wrong, prepare message
			$page->data->error = 'Zlé meno alebo heslo!';
		}
		*/
	
	}
	
	function logout(&$page) {
		$page->session->set('kiss_loged', null);
	}

}

?>
