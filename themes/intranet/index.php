<hr>
<div class="col-md-9">
    
    <?php
    $cat = Check::CatByName("destaque");
    $c = 0;
    $Read = new WsPosts();
    $Read->setPost_category($cat);
    $Read->Execute()->Query("post_status = 1 AND (post_category = :cat OR post_cat_parent = :cat) ORDER BY post_date LIMIT 3", "cat={$cat}", true);
    if (!$Read->Execute()->getResult()):
        WSErro("Opps! Não temos artigos em destaques!", WS_INFOR);
    else:
        ?>
        <div id = "carousel" data-interval = "3000" class = "carousel slide well" data-ride = "carousel">
            <div class = "carousel-inner" >
                <?php
                $View = new View();
                $siderbar = $View->Load("carousel_m");
                foreach ($Read->Execute()->getResult() as $bar):
                    $bar->datetime = date('Y-m-d', strtotime($bar->post_date));
                    $bar->pubdate = date("d/m/Y H:i", strtotime($bar->post_date));
                    $bar->post_content = Check::Words($bar->post_content, 6);
                    $bar->class = ($c == 0 ? "item active" : "item");
                    if (!$bar->post_url):
                        $bar->post_url = "#HOME#/artigo/#post_name#";
                    endif;
                    $View->Show((array) $bar, $siderbar);
                    $c++;
                endforeach;
                ?>
            </div>
            <?php
            if ($c != 1):
                echo "<a class='left carousel-control' href='#carousel' data-slide='prev'><i class='icon-prev fa fa-angle-left'></i></a>";
                echo "<a class='right carousel-control' href='#carousel' data-slide='next'><i class='icon-next fa fa-angle-right'></i></a>";
            endif;
            ?>
        </div>
    <?php
    endif;
    ?>
    
    <?php include "inc/apresentacao.inc.html"; ?>
    
</div>

<?php
//coluna direita
$cat = Check::CatByName("siderbar-left");
require("inc/siderbar.inc.php");
