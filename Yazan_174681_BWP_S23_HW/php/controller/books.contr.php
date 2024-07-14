<?php

class booksContr extends booksModel{

    private $_Input;
    private $_type;

    public function __construct(
    $Input,$type)
    {
        $this->_Input=$Input;
        $this->_type=$type;    
    }

    public function books(){
        if($this->_type=="title"){
            //get books by title
            $data=$this->getbooks($this->prepare($this->_Input));
            return $data;   
        }elseif($this->_type=="id"){
            //get books by id
            $data=$this->getbook($this->prepare($this->_Input));
            return $data;  
        }
       
    }
//this function is to split the string into words
    private function prepare($string)
    {
       return $array = str_getcsv($string, ' ', ',',':',); 
    }

    
}