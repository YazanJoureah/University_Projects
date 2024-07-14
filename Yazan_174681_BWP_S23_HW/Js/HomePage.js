/**
 * This file is used to add elements to main index page 
 * elements that need data from the backend
 * and handle sign in/up status 
 * **/
import cookie from "./cookies.js";
import Style from "./style.js";
import Components from "./components.js";
var cook=new cookie();
var styles=new Style();
var comp=new Components();

//This function is used to fetch books data from the database 
let Book=async()=>{
    var array;
    //implay a filter to the fetched data using search bar
    var title=document.getElementById('search').value;
    document.getElementById("booklist").innerHTML=null;
    document.getElementById("booklist").innerHTML+=styles.bookList();
    console.log(title);

    //start fetching data
    let req=new XMLHttpRequest();
    req.onreadystatechange=()=>{
        if(req.readyState===4 && req.status===200){
            let res=JSON.parse(req.responseText);
            console.log(res);
            array=res;
        }
    };
     req.open("GET",`http://127.0.0.1/Yazan_174681_BWP_S23_HW/php/api/books.php?title=${title}`,false);
     req.send();

     //Generate Cards for each book
    array.forEach(element => {
        document.getElementById("booklist").innerHTML+=comp.card(element["id"],element["title"],element["price"],element["img"]);
    });
}

//This function is used to check if the user is signed In and add signup/in button
let ISIN=()=>{
  let flag=cook.checkCookie("User_Name","User_ID");
  if(flag){
    document.getElementById("r-status").innerHTML=null;
    document.getElementById("r-status").innerHTML+=styles.logout();
    document.getElementById("r-status").innerHTML+=comp.logout();
    document.getElementById('logout').addEventListener('click',logout);
  }else{
    document.getElementById("r-status").innerHTML=null;
    document.getElementById("r-status").innerHTML+=styles.login();
    document.getElementById("r-status").innerHTML+=comp.login();
  document.getElementById('login').addEventListener('click',login);
  }
};

//This is used to logout the user from the website
let logout=()=>{
  cook.setCookie("User_ID","",-1);
  cook.setCookie("User_Name","",-1);
  window.location.reload();
}

//this is used to send the user to registration form
let login=()=>{
  window.location.assign("./Signup/index.html");
}

//this is used to send the user to his wishlist if signedin
let ToWishlist=()=>{
  let flag=cook.checkCookie("User_Name","User_ID");
  console.log(flag);
  if(flag){
   let id=cook.getCookie("User_ID");
   window.location.assign(`./wishlist.html`);
  }else{
    alert("You are Not Signed In!!")
  }
}

window.addEventListener('load',ISIN);
window.addEventListener('load',Book);
document.getElementById('search').addEventListener('keyup',Book);
document.getElementById("wishlist").addEventListener("click",ToWishlist);
export {Book,ISIN,logout,ToWishlist};