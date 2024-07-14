<?php

class WishlistContr extends WishlistModel{

    private $_user_id;

    public function __construct(
    $id)
    {
        $this->_user_id=$id;
        
    }

    public function showbooks(){
        
        return $data=$this->show($this->prepare($this->_user_id));
          
          
        }
        public function addbook($book_id){
        
           return $data=$this->add($this->_user_id,$book_id);
            
          
        }
    

    private function prepare($string)
    {
       return $array = str_getcsv($string, ' ', ',',':',); 
    }

    
}