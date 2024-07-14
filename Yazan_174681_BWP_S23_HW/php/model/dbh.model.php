<?php

class Dbh{
    protected function connect()
    {
        try{
            $username='root';
            $password='Yazan112123';
            $dbh=new PDO('mysql:host=localhost;dbname=bookstore',$username,$password);
            return $dbh;
        }catch(PDOException $e)
        {
            print "Error!: ".$e->getMessage()."<br>";
            die();
        }
    }
}