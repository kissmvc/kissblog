<?php include 'inc/header.tpl'; ?>

    <h2>Nový/Úprava článku</h2>
    
    <form action="index.php?page=clanky&action=save" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="id" value="<?php echo $page->data->news_id; ?>">
		
		<p>
			<label>Titulok</label>
			<input class="form-control" type="text" name="db_title_1_255" value="<?php echo ifedit($page->data->clanok->row->title); ?>">
		</p>

		<p>
			<label>Kategória</label>
			<select class="form-control" name="category_id">
				<option></option>
				<?php foreach($page->data->category as $category) {?>
					<option value="<?php echo $category->id; ?>" <?php echo ($category->id == $page->data->clanok->row->category_id ? 'selected' : ''); ?>><?php echo $category->name; ?></option>
				<?php } ?>
			</select>
		</p>
		
		<p>
			<label>Text</label>
			<textarea id="editor" class="form-control" type="text" name="db_text" rows="10"><?php echo ifedit(htmlspecialchars($page->data->clanok->row->text)); ?></textarea>
		</p>
		
		<p>
			<label>Image 1</label>
			<input class="form-control" type="file" name="file1" value="">
		</p>

		<?php if($page->data->clanok->row->image != '') { ?>

			<p><img src="../public/images/<?php echo $page->data->clanok->row->image; ?>" alt=""></p>
		<?php } ?>
		
		<!--<p>
			<label>Image 2</label>
			<input class="form-control" type="file" name="file2" value="">
		</p>-->

		<p>
			<input class="btn btn-primary" type="submit" name="submit" value=" Uložiť "> <a class="btn btn-default" href="index.php?page=clanky">Zavrieť</a>
		</p>
		
    </form>

	<script type="text/javascript">

		CKEDITOR.replace("editor", {
			height: 300,
			extraPlugins: 'divarea'
		});
		
	</script>

</div>


<?php include 'inc/footer.tpl'; ?>