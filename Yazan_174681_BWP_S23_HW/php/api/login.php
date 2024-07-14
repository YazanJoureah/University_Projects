<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json');
if($_SERVER["REQUEST_METHOD"]==="POST"){

    //grabbing the date
    $fullname=$_POST["username"];
    $password=$_POST["password"];

    //Instantiate signincontr classes
    include "../model/dbh.model.php";
    include "../model/login.model.php";
    include "../controller/login.contr.php";

    $login=new LoginContr($fullname,$password);
    
    //Running erroe handlers and user sign up
    switch($login->loginUser())
    {
        case "ERR:Empty Field":
            echo json_encode(array(["status"=>"failed","Error"=>"Empty Field"]));
            break;
        case "ERR:Invalid Username":
            echo json_encode(array(["status"=>"failed","Error"=>"Invalid Username"]));
            break;
        case "Unkown ERR":
            echo json_encode(array(["status"=>"failed","Error"=>"User Or Password is Wrong!"]));
            break;
        case "Success":
            echo json_encode(array(["status"=>"Success",
            "User_ID"=>$_SESSION['User_ID'],
            "User_Name"=>$_SESSION['User_Name']]));
            break; 
    }
}else{
    echo json_encode("Should be POST Request");
}