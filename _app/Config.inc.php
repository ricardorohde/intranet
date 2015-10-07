<?php

//CONFIGURACAO DO BANCO ####################
define("DB_HOST", "localhost");
define("DB_USER", "root");
define("DB_PASS", "root");
define("DB_NAME", "ws_intranet");

//DEFINE SERVIDOR DE E-MAIL ####################
define('MAILUSER', 'adriano@tommasi.com.br');
define('MAILDESTINO', 'adriano@tommasi.com.br');
define('MAILNAME', 'CIDDHC - SITE');
define('MAILASSUNTO', 'Mensagem via Site!');
define('MAILHOST', 'mail.ita.locaweb.com.br');
define('MAILPASS', 'tommasi0000');
define('MAILPORT', '587');

//DEFINE IDENTIDADE DO SITE ####################
define('SITENAME', 'Intranet Tommasi');
define('SITEDESC', '&copy; 2015 Adriano Reis | Todos os direitos reservados.');

//DEFINE A HOME DO SITE #########################
define('NAME', '/intranet');
define('HTTP_HOST', 'http://' . $_SERVER['HTTP_HOST']);
define('HOME', HTTP_HOST . NAME);
define('THEME', 'intranet');
define('REQUIRE_PATH', 'themes' . DIRECTORY_SEPARATOR . THEME);
define('INCLUDE_PATH', HOME . DIRECTORY_SEPARATOR . REQUIRE_PATH);
define('PLUGIN_PATH', REQUIRE_PATH . DIRECTORY_SEPARATOR . 'plugin');

//REDES SOCIAIS
define('CANAL', 'UCG1S-LQV55pl0-n_KLTNtJQ');
define('FACEBOOK', 'adriano.reis23');
define('TWITTER', 'Adriano_EngPro');

//TRATAMENTO DE ERROS #####################
//CSS Constantes :: Mensagens de Erro
define("WS_ACCEPT", 'accept');
define("WS_INFOR", 'infor');
define("WS_ALERT", 'alert');
define("WS_ERROR", 'error');

//AUTO LOAD DE CALSSES ####################
function __autoload($Class_name) {

    /*
     * ****************************************
     * ********* DIRETORIOS PRINCIPAIS ********
     * ****************************************
     */
    $cDir = ['Conn', 'Helpers', 'Beans', 'Models', 'library'];
    $iDir = null;

    foreach ($cDir as $dirName):
        $file = __DIR__ . DIRECTORY_SEPARATOR . $dirName . DIRECTORY_SEPARATOR . $Class_name . ".class.php";
        if (!$iDir && file_exists($file) && !is_dir($file)):
            require_once($file);
            $iDir = true;
        endif;
    endforeach;

    /*
     * ****************************************
     * ************* PLUGINS ******************
     * ****************************************
     */
    $pDir = ['contatores-de-impressao', 'qualidade'];
    if (!$iDir):
        foreach ($pDir as $dirName):
            $file = __DIR__ . DIRECTORY_SEPARATOR . "plugins" . DIRECTORY_SEPARATOR . $dirName . DIRECTORY_SEPARATOR . $Class_name . ".class.php";
            if (!$iDir && file_exists($file) && !is_dir($file)):
                require_once($file);
                $iDir = true;
            endif;
        endforeach;
    endif;

    if (!$iDir):
        trigger_error("Não foi possivel inclur {$Class_name} .class.php", E_USER_ERROR);
        die;
    endif;
}

//ES ERROR :: Exibe os erros lançados :: FRONT
function WSErro($ErrMsg, $ErrNo, $ErrDie = null) {
    $CssClass = ($ErrNo == E_USER_NOTICE ? WS_INFOR : ($ErrNo == E_USER_WARNING ? WS_ALERT : ($ErrNo == E_USER_ERROR ? WS_ERROR : $ErrNo)));

    echo "<p class=\"trigger {$CssClass}\">{$ErrMsg}<span class=\"ajax_close\"></span></p>";

    if ($ErrDie):
        die;
    endif;
}

//PHPErro :: Personaliza o gatilho do PHP
function PHPErro($ErrNo, $ErrMsg, $ErrFile, $ErrLine) {
    $start = explode("SQLSTATE[42S02]", $ErrMsg);
    if (!empty($start[1])):
        Check::BDCREATE($ErrMsg);
        echo "<div style='margin: 10px; padding: 15px; font-size: 1.2em; text-aling: center; color: #fff;' class=" . WS_ERROR . ">";
        echo "<p><strong>ERRO:</strong></p>";
        echo "<p>Tivemos um pequeno problema tecnico, mas já estamos consertando para você!</p>";
        echo "<small>Por favor, atualize a pagina!</small>";
        echo "</div>";
    endif;

    $CssClass = ($ErrNo == E_USER_NOTICE ? WS_INFOR : ($ErrNo == E_USER_WARNING ? WS_ALERT : ($ErrNo == E_USER_ERROR ? WS_ERROR : $ErrNo)));
    echo "<p class=\"trigger {$CssClass}\">";
    echo "<b>Erro na Linha: {$ErrLine} ::</b> {$ErrMsg} <br>";
    echo "<small>{$ErrFile}</small>";
    echo "<span class=\"ajax_close\">{$ErrMsg}</span></p>";

    if ($ErrNo == E_USER_ERROR):
        die;
    endif;
}

set_error_handler('PHPErro');