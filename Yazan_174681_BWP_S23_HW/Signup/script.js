import cookie from "../Js/cookies.js";
var cook=new cookie();

//To switch between signin and signup forms
function signupin(){
    document.querySelector('.frame').classList.toggle("frame-long");
    document.querySelector('.form-signin').classList.toggle("form-signin-left");
    document.querySelector('.signup-inactive').classList.toggle("signup-active");
    document.querySelector('.signin-active').classList.toggle("signin-inactive"); 
    document.querySelector('.form-signup').classList.toggle("form-signup-left");
  }
//To Register a user in database
  let Signup=async ()=>{
    //take fields values
    const feilds=document.querySelector(".form-signup").children;
    const data=[feilds[1].value,feilds[3].value,feilds[5].value,feilds[7].value];
   
    //Check if empty
    if(data[0]==""||data[1]==""||data[2]==""||data[3]==""){
      let errmsg=document.querySelector('.form-signup').lastElementChild;
          errmsg.innerText="Empty Fields!"; 
    }else{
      let formdata=new FormData();
      formdata.set("fullname",data[0]);
      formdata.set("email",data[1]);
      formdata.set("password",data[2]);
      formdata.set("confirmpassword",data[3]);

      //get a response after sending the data
      let response= async ()=>{
        //send the data using api
        const a = await send_signup(formdata);
        console.log(a);
        
        if(a.status=="Success")
        {
          cook.setCookie("User_ID",a.User_ID,365);
          cook.setCookie("User_Name",a.User_Name,365);
         window.location.assign(`../index.html?ID=${a.User_ID}&username=${a.User_Name}`);
        }
        if(a.status=="failed"){
          alert("Error : "+a.Error+" !");
          return null;
        }
      };
      response();
    }
  }

  //To Login a user 
  let Signin=async ()=>{
    //take fields values
    const feilds=document.querySelector(".form-signin").children;
    const data=[feilds[1].value,feilds[3].value];

    //Check if empty
  if(data[0]==""||data[1]==""){
    let errmsg=document.querySelector('.form-signin').lastElementChild;
            errmsg.innerText="Empty Fields!"; 
  }else{
    let formdata=new FormData();
      formdata.set("username",data[0]);
      formdata.set("password",data[1]);

       //get a response after sending the data
      let response= async ()=>{
        //send the data using api
        const a = await send_signin(formdata);
        console.log(a);
        if(a.status=="Success")
        {
          cook.setCookie("User_ID",a.User_ID,365);
          cook.setCookie("User_Name",a.User_Name,365);
          window.location.assign(`../index.html`);
        }
        if(a.status=="failed"){
          alert("Error : "+a.Error+" !");
          return null;
        }
      };
      response();
  }   
  }

  //function to send the data and return a response
  async function send_signup(formdata){
      let response;
      await fetch("http://127.0.0.1/Yazan_174681_BWP_S23_HW/php/api/signup.php",
        {method:'POST',body:formdata})
        .then(res=>res.json()).then(data=>response=data[0]);     
        return response;   
  }
   //function to send the data and return a response
  async function send_signin(formdata){
    let response;
    await fetch("http://127.0.0.1/Yazan_174681_BWP_S23_HW/php/api/login.php",
    {method:'POST',body:formdata})
    .then(res=>res.json()).then(data=>response=data[0]);
    return response; 
}

//add events to all buttons
document.querySelector('#Signin').addEventListener('click',Signin);
document.querySelector('#Signup').addEventListener('click',Signup);
document.querySelector('#signin').addEventListener('click',signupin);
document.querySelector('#signup').addEventListener('click',signupin);
export  {signupin,Signin,Signup};