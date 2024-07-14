<?php

class booksModel extends Dbh
{

    protected function getbooks($title)
    {
        $stmt=$this->connect()->prepare('SELECT * FROM books WHERE 1=1;');
    
        if(!$stmt->execute()){
            $stmt=null;
            return true;
            exit();
        }
       
        $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
    
            return $newData=$this->filter($title,$data);
        
        $stmt=null;
    }

    protected function getbook($id)
    {
        $stmt=$this->connect()->prepare('SELECT * FROM books WHERE id=?;');
    
        if(!$stmt->execute($id)){
            $stmt=null;
            return true;
            exit();
        }
       
        $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt=null;
        return $data;
    }
    protected function filter($title,$data) {
        $new=[];
        for($i=0;$i<sizeof($data);$i++){
            $flag=true;
            foreach ($title as $str) {
                if (strpos(strtolower($data[$i]['title']),strtolower($str)) === FALSE) {
                    $flag=false;
                    break;
                }
            }
            if($flag){
            array_push($new,$data[$i]);
            }
        }
       return $new;
    }   
    }
    
   