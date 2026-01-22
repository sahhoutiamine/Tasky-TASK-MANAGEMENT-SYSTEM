<?php 


namespace app\Models;

use PDO;
use app\Core\Database;

class User {
    private $db;
    public function __construct() {
        $this->db = Database::getInstance()->getConnection();
    }


    public function register ($data) {
        $stmt = $db->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
        $stmt->execute([$data['username'], $data['email'], $data['password']]);
    }

    public function login ($email, $pw) {
        $stmt = $db->prepare("SELECT * FROM users WHERE  email = ? AND password = ?");
        $user = $stmt->execute([$email, $pw]);
    }
}