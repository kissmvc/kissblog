<?php include 'inc/header.tpl'; ?>

    <div class="clanok">
	
		<h1><?php echo $page->data->clanok->title; ?></h1>
		
		<?php if ($page->data->clanok->image) { ?>
		<img class="title-image" src="<?php echo $page->assets('public/images/'.$page->data->clanok->image); ?>" alt="<?php echo $page->data->clanok->title; ?>">
		<?php } ?>
		
		<div class="clanok-text">
			<?php echo gethtml($page->data->clanok->text); ?>
		</div>
	
    </div>
    
    <div class="comments">
    
		<h3>Komentáre</h3>
		
		<?php if (count($page->data->comments) > 0) { ?>
		<ul>
		<?php foreach ($page->data->comments as $comment) { ?>
			<li id="comment-<?php echo $comment->id; ?>">
				<p class="uname"><em><?php echo $comment->name; ?></em></p>
				<p>
					<?php echo $comment->comment; ?>
				</p>
			</li>
		<?php } ?>
		</ul>
		<?php } else { ?>
			<p>
				Zatiaľ žiadne komentáre, napíšte prvý komentár.
			</p>
		<?php } ?>
    
    </div>
    
    <div class="comment_form">
     
		<h4>Napíšte svoj komentár</h4>
   
		<form action="<?php echo $this->page->urlroot ?>/index.php?page=index&action=addcomment" method="post">
		
			<input type="hidden" name="news_id" value="<?php echo $page->data->clanok->id; ?>">
			<input type="hidden" name="redir" value="<?php echo $page->data->url; ?>">
			
			<p>
				<label>Vaše meno</label>
				<input type="text" class="form-control" name="db_name" value="">
			</p>
			
			<p>
				<label>Komentár</label>
				<textarea class="form-control" name="db_comment" rows="5"></textarea>
			</p>
			
			<p>
				<input type="submit" class="btn btn-primary" name="submit" value=" Odoslať ">
			</p>
			
		</form>
    
    </div>

<?php include 'inc/footer.tpl'; ?>