<?php 

namespace app\Core;

class Router {
    private $routes = [];


    public function get($path, $callback) {
        $this->routes['GET'][$path] = $callback;
    }

     public function post($path, $callback) {
        $this->routes['POST'][$path] = $callback;
    }

    public function dispatch() {
        $method = $_SERVER["REQUEST_METHOD"];
        $url = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);
    }
   
}