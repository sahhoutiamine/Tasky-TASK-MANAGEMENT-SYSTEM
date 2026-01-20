<?php 


namespace app\Core;

use PDO;
use PDOException;
class Database {
    private $host = "localhost";
    private $dbname = "taskydb";
    private $username = "root";
    private $pw = "";
    private $pdo;
    private static $instance = null;


    public function __construct(){
        $this->connect();
    }

    
}