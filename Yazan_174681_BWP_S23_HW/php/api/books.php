<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json');
if($_SERVER["REQUEST_METHOD"]==="GET"){

     //Instantiate book classes
     include "../model/dbh.model.php";
     include "../model/books.model.php";
     include "../controller/books.contr.php";
    //grabbing the data
    if(isset($_GET["title"]))
   {
    $books=new booksContr($_GET["title"],"title");
   }elseif(isset($_GET["id"])){
    $books=new booksContr($_GET["id"],"id");
   }

    //Running return the data in JSON Encode
    echo json_encode($books->books());
            
}else{
    echo json_encode("Should be GET Request");
}