<?php include 'inc/header.tpl'; ?>

    <div class="clanky">
		
		<?php foreach ($page->data->clanky->rows as $clanok) { ?>
		
		<div class="clanok">
			
			<!--<h2><a href="index.php?page=index&action=clanok&id=<?php echo $clanok->id; ?>"><?php echo $clanok->title; ?></a></h2>-->
			<h2><a href="<?php echo $page->getRoute('clanok', 'slug='.idslug($clanok->id, $clanok->title)); ?>"><?php echo $clanok->title; ?></a></h2>
			
			<div class="clanok-text">
				
				<?php if ($clanok->image) { ?>
				<img class="thumb-image" src="<?php echo $page->assets('public/images/'.$clanok->image); ?>" alt="<?php echo $clanok->title; ?>">
				<?php } ?>
			
				<p>
				<?php 
					//ukladame si do textu html kod, musime ho pred vyisanim cez echo teda dekodovat (funkcia html_entity_decode), inak sa nezobrazi spravne
					//echo html_entity_decode(htmlspecialchars($clanok->text)); // keďže tam máme aj ukážkové php kódy, musíme dekódovať aj html specialchar
					//echo gethtml($clanok->text); //funkcia gethtml je zjednodušené html_entity_decode+htmlspecialchars
					echo str_truncate(cleanHtml(gethtml($clanok->text)), 500); //skonvertujeme html kód z CKEditoru cez gethtml, potom cez cleanHtml odstránime html tagy, aby sme mali čistý úryvok a nakoniec skrátime cez truncate na 500 znakov ako ukážku kúska článku
				?>
				</p>
				
				<p class="more-link">
					<a href="<?php echo $page->getRoute('clanok', 'slug='.idslug($clanok->id, $clanok->title)); ?>">&rarr; Čítať celý článok</a>
				</p>
				
			</div>
			
		</div>
		
		<?php } ?>
		
    </div>

<?php include 'inc/footer.tpl'; ?>