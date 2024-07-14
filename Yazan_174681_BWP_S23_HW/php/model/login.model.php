<?php

class LoginModel extends Dbh{


protected function getUser($fullname,$password)
{
    $stmt=$this->connect()->prepare('SELECT * FROM users WHERE user_name=? OR email=?;');

    if(!$stmt->execute(array($fullname,$password))){
        $stmt=null;
        return true;
        exit();
    }
    if($stmt->rowCount()==0){
        $stmt=null;
        return true;
        exit(); 
    }

    $pwdhashed=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $checkpwd=password_verify($password,$pwdhashed[0]["user_password"]);
    if($checkpwd==false){
        $stmt=null;
        return true;
        exit(); 
    }elseif($checkpwd==true){
        $stmt=$this->connect()->prepare('SELECT * FROM users WHERE user_name=? OR email=? AND user_password=?;');
        if(!$stmt->execute(array($fullname,$fullname,$pwdhashed[0]["user_password"]))){
            $stmt=null;
            return true;
            exit();
        }
        if($stmt->rowCount()==0){
            $stmt=null;
            return true;
            exit(); 
        }

        $user=$stmt->fetchAll(PDO::FETCH_ASSOC);
        
       session_start();
        $_SESSION['User_ID']=$user[0]["id"];
        $_SESSION['User_Name']=$user[0]["user_name"];
    
    }
    $stmt=null;
}
}
