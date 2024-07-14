import Components from "./components.js";
import Style from "./style.js";
import cookie from "./cookies.js";
 var com=new Components();
 var style=new Style();
 var cook=new cookie();

 //Get Books Details
 let Book=()=>{
    var book;
    const id=location.search.substring(1).split('=').slice(-1)[0];
    console.log(id);
   document.getElementById("container").innerHTML=null;
    document.getElementById("container").innerHTML+=style.bookDetails();
    let req=new XMLHttpRequest();
    req.onreadystatechange=()=>{
        if(req.readyState===4 && req.status===200){
            let res=JSON.parse(req.responseText);
            console.log(res);
            book=res;
        }
    };
     req.open("GET",`http://127.0.0.1/Yazan_174681_BWP_S23_HW/php/api/books.php?id=${id}`,false);
     req.send();

    document.getElementById("container").innerHTML+=com.bookDetails(
        book[0].title,
        book[0].author,
        book[0].ISBN,
        book[0].category,
        book[0].description,
        book[0].price,
        book[0].img);
        document.getElementById("wish").addEventListener("click",addToWishlist);
 }

 //add the book to the user's wishlist
 let addToWishlist=()=>{
let flag=cook.checkCookie("User_Name","User_ID");
  console.log(flag);
  if(flag){
    var array;
    var user_id= cook.getCookie("User_ID");
    var book_id=location.search.substring(1).split('=').slice(-1)[0];
   
    let req=new XMLHttpRequest();
    req.onreadystatechange=()=>{
        if(req.readyState===4 && req.status===200){
            let res=JSON.parse(req.responseText);
            console.log(res);
            array=res;
        }
    };
     req.open("GET",`http://127.0.0.1/Yazan_174681_BWP_S23_HW/php/api/wishlist.php?user_id=${user_id}&&book_id=${book_id}`,false);
     req.send();
if(array==="success"){
    alert("Book is added to yor wishlist");
}else{
    alert("Book is exsists");
}
   
  }else{
    alert("You are Not Signed In!!")
    window.location.assign("./Signup/index.html");
  }
 }
 window.addEventListener('load',Book);
export default {Book,addToWishlist};