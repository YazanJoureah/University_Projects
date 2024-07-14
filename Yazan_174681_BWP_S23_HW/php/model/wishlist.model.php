<?php

class WishlistModel extends Dbh
{
    protected function show($id)
{
    $stmt=$this->connect()->prepare('SELECT books.id as id ,books.title as title,books.price as price,books.img as img
    FROM books
    INNER JOIN wishlist ON wishlist.book_id=books.id WHERE wishlist.user_id=?;');

    if(!$stmt->execute($id)){
        $stmt=null;
        exit();
    }

    $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt=null;
    return $data;
    
}

protected function add($user_id,$book_id)
{   if(!$this->checkbook($user_id,$book_id)){
    $stmt=$this->connect()->prepare('INSERT INTO `wishlist`(`book_id`, `user_id`) VALUES (?,?);');

    if(!$stmt->execute(array($book_id,$user_id))){
        $stmt=null;
        return "faild";
    }else{
        $stmt=null;
        return "success";
    }
}else{
    return "exsists";
}
   
    
}
protected function checkbook($user_id,$book_id)
{
    $stmt=$this->connect()->prepare('SELECT book_id, user_id From wishlist WHERE book_id=? and user_id=?;');

    if(!$stmt->execute(array($book_id,$user_id))){
        $stmt=null;
        exit();
    }

    if($stmt->rowCount()>0){
        return true;
    }else{
        return false;
    }
}
}