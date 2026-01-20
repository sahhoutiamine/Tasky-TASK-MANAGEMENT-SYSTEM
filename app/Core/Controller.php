<?php

use twig\Loader\FileSystemLoader;
use twig\Environment;


class Controller {
    protected $twig;

    public function __construct () {
        $loader = new FileSystemLoader(__DIR__. "/../Views");
        $this->twig = new Environment($loader, [
            'cache' => false,
            'dubeg' => true
        ]);

        $this->twig->addGlobale('session', $_SESSION);
    }

    protected function render($view, $data = []) {
        echo $this->twig->render($view, $data);
    }

}