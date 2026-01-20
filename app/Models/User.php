<?php 


namespace app\Models;

use PDO;
use app\Core\Database;

class User {
    private $db;
    public function __construct() {
        $this->db = Database::getInstance()->getConnection();
    }
}