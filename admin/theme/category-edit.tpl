<?php include 'inc/header.tpl'; ?>

    <h2>Nová/Úprava kategórie</h2>
    
    <form action="index.php?page=category&action=save" method="post">
		
		<input type="hidden" name="id" value="<?php echo $page->data->cat_id; ?>">
		
		<p>
			<label>Názov</label>
			<input class="form-control" type="text" name="db_name_1_50" value="<?php echo ifedit($page->data->category->row->name); ?>">
		</p>

		<p>
			<input class="btn btn-primary" type="submit" name="submit" value=" Uložiť "> <a class="btn btn-default" href="index.php?page=category">Zavrieť</a>
		</p>
		
    </form>

</div>


<?php include 'inc/footer.tpl'; ?>