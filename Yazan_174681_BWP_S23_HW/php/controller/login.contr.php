<?php

class LoginContr extends LoginModel{

    private $_fullname;
    private $_password;

  

    public function __construct(
    $fullname,
    $password)
    {
        $this->_fullname=$fullname;
        $this->_password=$password;
      
    }

    //This function is to login the user
    public function loginUser(){

        //check if any data is empty
        if($this->emptyInput()){
            return "ERR:Empty Field";
        }
        //chaeck if the username is valid
        if($this->invalidFullname()){
            return "ERR:Invalid Username";
        }
        //send the data to model and get the user data if user is exsist
        if(!$this->getUser($this->_fullname,$this->_password)){
            return "Success";
        }else{
            return "Unkown ERR";
        }
    
    }

    //function to check if empty
    private function emptyInput():bool{
    
        if (empty($this->_fullname)||empty($this->_password)) {
            return true;
        }else{
            return false;
        }

    }

    //function to check if user name is valid
    private function invalidFullname():bool
    {
        if(!preg_match("/^[a-zA-Z0-9]*$/",$this->_fullname)){
            return true;
        }
        else{
            return false;
        }
    }

    
}