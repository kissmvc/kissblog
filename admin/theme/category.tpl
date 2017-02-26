<?php include 'inc/header.tpl'; ?>

    <h2>Kategórie</h2>
    
    <p><a href="index.php?page=category&action=add" class="btn btn-primary">Pridať novú</a></p>
    
    <table class="table">
		
		<tr>
			<th>ID</th><th>Názov</th><th>Akcie</th>
		</tr>
		
		<?php foreach ($page->data->category->rows as $category) { ?>
		<tr>
			<td><?php echo $category->id; ?></td><td><?php echo $category->name; ?></td><td><a href="index.php?page=category&action=edit&id=<?php echo $category->id; ?>" class="btn btn-success">Upraviť</a> <a href="index.php?page=category&action=delete&id=<?php echo $category->id; ?>" class="btn btn-danger">Zmazať</a></td>
		</tr>
		<?php } ?>
		
    </table>

<?php include 'inc/footer.tpl'; ?>