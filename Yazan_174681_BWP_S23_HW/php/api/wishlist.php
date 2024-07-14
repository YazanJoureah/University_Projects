<?php

header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json');
if($_SERVER["REQUEST_METHOD"]==="GET"){

     //Instantiate wishlist classes
     include "../model/dbh.model.php";
     include "../model/wishlist.model.php";
     include "../controller/wishlist.contr.php";
    //grabbing the data
    $wishlist=new WishlistContr($_GET["user_id"]);
    if(isset($_GET["user_id"])&&isset($_GET["book_id"])){
        echo json_encode($wishlist->addbook($_GET["book_id"]));
    }elseif(isset($_GET["user_id"])){
    
        echo json_encode($wishlist->showbooks());
    }
        
}else{
    echo json_encode("Should be GET Request");
}