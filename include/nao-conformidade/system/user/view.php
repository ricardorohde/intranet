<div ng-if="registro">
    <?php include HOME . '/include/nao-conformidade/system/registro/avaliacao.php'; ?>
</div>

<div ng-if="view !== 'todos' && !registro">
    <div ng-include="getAllList()"></div>
</div>

<div ng-if="view === 'todos' && !registro">
    <article class="col-md-6">
        <h1>Recebido:</h1>
        <?php include 'listas/recebido_aberto.html'; ?>
        <?php include 'listas/recebido_fechado.html'; ?>
    </article>

    <article class="col-md-6">
        <h1>Enviado:</h1>
        <?php include 'listas/enviado_aberto.html'; ?>
        <?php include 'listas/enviado_fechado.html'; ?>
    </article>
</div>