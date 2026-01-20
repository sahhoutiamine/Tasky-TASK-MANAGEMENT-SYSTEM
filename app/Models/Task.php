<?php 


namespace app\Models;


class Task {
    private $db;
    public function __construct() {
        $this->db = Database::getInstance()->getConnection();
    }
}