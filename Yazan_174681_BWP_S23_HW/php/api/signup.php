<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json');
if($_SERVER["REQUEST_METHOD"]==="POST"){
    
    //grabbing the date
    $fullname=$_POST["fullname"];
    $email=$_POST["email"];
    $password=$_POST["password"];
    $confirmpassword=$_POST["confirmpassword"];

    //Instantiate signupcontr classes
    include "../model/dbh.model.php";
    include "../model/signup.model.php";
    include "../model/login.model.php";
    include "../controller/signup.contr.php";
    include "../controller/login.contr.php";

    $signup=new SignupContr($fullname,$email,$password,$confirmpassword);
    //Running erroe handlers and user sign up
 
   switch ($signup->signupUser())
    {
        case "ERR:Empty Field":
            echo json_encode(array(["status"=>"failed","Error"=>"Empty Field"]));
            break;
        case "ERR:Invalid Username":
            echo json_encode(array(["status"=>"failed","Error"=>"Invalid Username"]));
            break;
        case "ERR:Invalid Email":
            echo json_encode(array(["status"=>"failed","Error"=>"Invalid Email"]));
            break; 
        case "ERR:Password Does Not Match":
            echo json_encode(array(["status"=>"failed","Error"=>"Password Does Not Match"]));
            break;      
        case "ERR:Username Is Already Been Taken":
            echo json_encode(array(["status"=>"failed","Error"=>"Username Is Already Been Taken"]));
            break;
        case "Unkown ERR":
            echo json_encode(array(["status"=>"failed","Error"=>"Unkown"]));
            break;
        case "Success":
            //Log in the user
            $login=new LoginContr($fullname,$password);
            $login->loginUser();
            echo json_encode(array(["status"=>"Success",
            "User_ID"=>$_SESSION['User_ID'],
            "User_Name"=>$_SESSION['User_Name']]));
            break;                  
    }

}else{
    echo json_encode("Should be POST Request");
}