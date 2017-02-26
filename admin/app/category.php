<?php

	class CategoryPage {

		function show(&$page) {
			$page->data->category = $page->db->select('category');
		}

		function add(&$page) {
			$page->tpl = 'category-edit';

			$page->data->cat_id = 0;
		}

		function edit(&$page) {
			$page->tpl = 'category-edit';

			$id = (int)$page->from->get('id')->val();
			$page->data->category = $page->db->select('category', $id);

			$page->data->cat_id = $id;
		}

		function save(&$page) {
			$query = new QueryHelper($page);

			$id = (int)$page->from->post('id')->val();

			$query->into('category')->fromPost()->autoAdd();


			if($query->isValid()) {
				if ($id > 0) {
					$query->update($id);
				} else {
					$query->insert();
				}
			} else {
				print_r($query->validations());
				exit();
			}
			

			$page->redirect('?page=category');
		}

		function delete(&$page) {
			$id = (int)$page->from->get('id')->val();

			$page->db->delete('category', $id);

			$page->redirect('?page=category');
		}
	}
?>