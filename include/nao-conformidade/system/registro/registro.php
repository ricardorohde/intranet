<div class="well">

    <div>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#cadastro" data-toggle="tab">Cadastro</a></li>
            <li><a href="#avaliacao" data-toggle="tab">Avaliação</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="cadastro" ng-controller="registro">
                <article><?php include 'cadastro.php'; ?></article>
            </div>
            <div class="tab-pane" id="avaliacao" ng-controller="avaliacao">
                <article><?php include 'avaliacao.php'; ?></article>
            </div>
        </div>

    </div>

    <div class="clear"></div>
</div> <!-- content home -->