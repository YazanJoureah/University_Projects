import cookie from "./cookies.js";
import Style from "./style.js";
import Components from "./components.js";
var cook=new cookie();
var styles=new Style();
var comp=new Components();

//function to get data of the user's wshlist an generate cards for it
let wishlist=async()=>{
    var array;
    var id= cook.getCookie("User_ID");
    console.log(id);
    document.getElementById("container").innerHTML=null;
    document.getElementById("container").innerHTML+=styles.bookList();
    console.log(id);
    //get the data
    let req=new XMLHttpRequest();
    req.onreadystatechange=()=>{
        if(req.readyState===4 && req.status===200){
            let res=JSON.parse(req.responseText);
            console.log(res);
            array=res;
        }
    };
     req.open("GET",`http://127.0.0.1/Yazan_174681_BWP_S23_HW/php/api/wishlist.php?user_id=${id}`,false);
     req.send();

    array.forEach(element => {
        document.getElementById("container").innerHTML+=comp.card(element["id"],element["title"],element["price"],element["img"]);
    });
}
window.addEventListener('load',wishlist);
export default {wishlist}