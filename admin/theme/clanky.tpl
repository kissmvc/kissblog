<?php include 'inc/header.tpl'; ?>

    <h2>Články</h2>
    
    <p><a href="index.php?page=clanky&action=add" class="btn btn-primary">Pridať nový</a></p>
    
    <table class="table">
		
		<tr>
			<th>ID</th><th>Nadpis</th><th>Akcie</th>
		</tr>
		
		<?php foreach ($page->data->clanky->rows as $row) { ?>
		<tr>
			<td><?php echo $row->id; ?></td><td><?php echo $row->title; ?></td><td><a href="index.php?page=clanky&action=edit&id=<?php echo $row->id; ?>" class="btn btn-success">Upraviť</a> <a href="index.php?page=clanky&action=delete&id=<?php echo $row->id; ?>" class="btn btn-danger">Zmazať</a></td>
		</tr>
		<?php } ?>
		
    </table>

<?php include 'inc/footer.tpl'; ?>