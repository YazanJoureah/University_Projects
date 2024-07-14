<?php

class SignupContr extends SignupModel{

    private $_fullname;
    private $_password;
    private $_email;
    private $_confirm_password;

    public function __construct(
    $fullname,
    $email,
    $password,
    $confirm_password)
    {
        $this->_fullname=$fullname;
        $this->_email=$email;
        $this->_password=$password;
        $this->_confirm_password=$confirm_password;
    }

    //This function is to signup the user
    public function signupUser(){

        //check if any field of data is empty
    if($this->emptyInput()){
        return "ERR:Empty Field";
    }

    //check if username is valid
    if($this->invalidFullname()){
        return "ERR:Invalid Username";
    }
    
    //check if the email is valid
    if($this->invalidEmail()){
        return "ERR:Invalid Email";
    }
    
    //check if passwords match
    if(!$this->IsPasswordMatch()){
        return "ERR:Password Does Not Match";
    }
    
    //check if user is already registered
    if($this->IsUsernameTaken()){
        return "ERR:Username Is Already Been Taken";
    }
    if(!$this->setUser($this->_fullname,$this->_password,$this->_email))
    {
        return "Success";
    }else{
        return "Unkown ERR";
    }
    
    }

    //function to detect the empty data
    private function emptyInput():bool{
    
        if (empty($this->_fullname)||empty($this->_password)||empty($this->_email)||empty($this->_confirm_password)) {
            return true;
        }else{
            return false;
        }

    }

    //function to check if username is valid
    private function invalidFullname():bool
    {
        if(!preg_match("/^[a-zA-Z0-9]*$/",$this->_fullname)){
            return true;
        }
        else{
            return false;
        }
    }

    //function to check if email is valid
    private function invalidEmail():bool
    {
        if(!filter_var($this->_email,FILTER_VALIDATE_EMAIL)){
            return true;
        }
        else{
            return false;
        }
    }

    //function to check if passwords are match
    private function IsPasswordMatch():bool
    {
        if($this->_password===$this->_confirm_password){
            return true;
        }
        else{
            return false;
        }
    }

    //function to check if user is already registered
    private function IsUsernameTaken():bool
    {
        if($this->checkUser($this->_fullname,$this->_email)){
            return true;
        }
        else{
            return false;
        }
    }
}