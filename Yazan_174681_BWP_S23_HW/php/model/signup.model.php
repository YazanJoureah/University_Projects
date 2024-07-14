<?php

class SignupModel extends Dbh
{
    protected function checkUser($fullname,$email)
{
    $stmt=$this->connect()->prepare('SELECT user_name From users WHERE user_name=? OR email=?;');

    if(!$stmt->execute(array($fullname,$email))){
        $stmt=null;
        exit();
    }

    if($stmt->rowCount()>0){
        return true;
    }else{
        return false;
    }
}
protected function setUser($fullname,$password,$email)
{
    $stmt=$this->connect()->prepare('INSERT INTO users (user_name,email,user_password)VALUES(?,?,?);');

    $hashedpwd=password_hash($password,PASSWORD_DEFAULT);

    if(!$stmt->execute(array($fullname,$email,$hashedpwd))){
        $stmt=null;
        exit();
    }
    $stmt=null;  
}
}