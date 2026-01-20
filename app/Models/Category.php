<?php 


namespace app\Models;


class Category {
    private $db;
    public function __construct() {
        $this->db = Database::getInstance()->getConnection();
    }
}