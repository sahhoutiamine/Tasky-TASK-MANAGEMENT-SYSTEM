<?php 

namespace app\Core;

class Router {
    private $routes = [];


    public function get($path, $callback) {
        $this->routes['GET'][$path] = $callback;
    }
   
}