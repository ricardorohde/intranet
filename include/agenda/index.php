<?php
define("AGENDADIR", HOME . "/include/agenda/js");
//registro de script Angular
if (!PRODUCAO):
    Register::addRegister("<script src='" . AGENDADIR . "/model.app.js'></script>");
    Register::addRegister("<script src='" . AGENDADIR . "/config/config.value.js'></script>");
    Register::addRegister("<script src='" . AGENDADIR . "/controller/home.ctrl.js'></script>");
    Register::addRegister("<script src='" . AGENDADIR . "/controller/setor.ctrl.js'></script>");
    Register::addRegister("<script src='" . AGENDADIR . "/controller/contato.ctrl.js'></script>");
    Register::addRegister("<script src='" . AGENDADIR . "/services/contatoAPI.services.js'></script>");
    Register::addRegister("<script src='" . AGENDADIR . "/services/setorAPI.services.js'></script>");
    Register::addRegister("<script src='" . AGENDADIR . "/controller/user.ctrl.js'></script>");
endif;
?>

<div ng-app="agenda">
    <?php if (Check::UserLogin(3)): ?>
        <a href="<?= HOME ?>/plugin/agenda/admin" title="Admin" class="btn btn-primary glyphicon glyphicon-cog" style="float: right;"></a>
        <a href="<?= HOME ?>/plugin/agenda/" title="Lista telefonica" class="btn btn-danger glyphicon glyphicon-th" style="float: right;"></a>
        <?php
    endif;
    if (!empty($Link->getLocal()[2]) && $Link->getLocal()[2] == "admin" && Check::UserLogin(3)):
        include 'admin.php';
    else:
        include 'user.php';
    endif;
    ?>
</div>