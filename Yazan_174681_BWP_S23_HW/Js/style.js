export default class Style{

    bookList(){
        return (`<style>
        .mid .main .book-list{
            display: flex;
            justify-content: space-evenly;
            margin: 2rem;
        }
        .card{
              width: 11.875em;  height: 20.875em; box-shadow: 0px 1px 13px rgba(0,0,0,0.1); cursor: pointer; transition: all 120ms; display: flex; flex-direction: column;  align-items: center;  justify-content: center;  background: #fff;  padding: 0.5em; ;
        }
        .desc {
          text-decoration: none;
          align-items: center;
          justify-content: center;
          background: #00AC7C;
          color: #fff;
          height: 2.5em;
          width: 90%;
          transition: all 80ms;
          font-weight: 600;
          text-transform: uppercase;
          opacity: 1;
          display: flex;
          }
        .card .price {
            font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
            font-size: 0.9em;
            
            left: 0.625em;
            bottom: 0.625em;
            color: #000;
          }
         .card:active {
           transform: scale(0.98);
        }
    
        .card:active .desc {
           height: 3.125em;
        }
    .booktitle{
        font-family: Arial, Helvetica, sans-serif; font-size: 0.9em;   left: 0.625em; bottom: 1.875em; font-weight: 400; color: #000;
    }
    .price{
        font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;font-size: 0.9em; left: 0.625em; bottom: 0.625em; color: #000;
    }
    .image{
        background: rgb(241, 241, 241); width: 100%; height: 70%; margin:5px;  place-items: center;
    }
    .img{
        width:100%; height: 100%;
    }
       .text {
           max-width: 55px;
        }
     </style>`);
    }

    logout(){
        return (`<style>
        .Btn {
          display: flex;
          align-items: center;
          justify-content: flex-start;
          width: 45px;
          height: 45px;
          border: none;
          border-radius: 50%;
          cursor: pointer;
          position: relative;
          overflow: hidden;
          transition-duration: .3s;
          box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.199);
          background-color: rgb(255, 65, 65);
        }
        
        /* plus sign */
        .sign {
          width: 100%;
          transition-duration: .3s;
          display: flex;
          align-items: center;
          justify-content: center;
        }
        
        .sign svg {
          width: 17px;
        }
        
        .sign svg path {
          fill: white;
        }
        /* text */
        .text {
          position: absolute;
          right: 0%;
          width: 0%;
          opacity: 0;
          color: white;
          font-size: 1.2em;
          font-weight: 600;
          transition-duration: .3s;
        }
        /* hover effect on button width */
        .Btn:hover {
          width: 125px;
          border-radius: 40px;
          transition-duration: .3s;
        }
        
        .Btn:hover .sign {
          width: 30%;
          transition-duration: .3s;
          padding-left: 20px;
        }
        /* hover effect button's text */
        .Btn:hover .text {
          opacity: 1;
          width: 70%;
          transition-duration: .3s;
          padding-right: 10px;
        }
        /* button click effect*/
        .Btn:active {
          transform: translate(2px ,2px);
        }
        </style>`);
    }

    login(){
        return (`<style>
        .Btn {
          display: flex;
          align-items: center;
          justify-content: flex-start;
          width: 45px;
          height: 45px;
          border: none;
          border-radius: 50%;
          cursor: pointer;
          position: relative;
          overflow: hidden;
          transition-duration: .3s;
          box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.199);
          background-color: rgb(163, 142, 255);
        }
        
        /* plus sign */
        .sign {
          width: 100%;
          transition-duration: .3s;
          display: flex;
          align-items: center;
          justify-content: center;
        }
        
        .sign svg {
          width: 17px;
        }
        
        .sign svg path {
          fill: white;
        }
        /* text */
        .text {
          position: absolute;
          right: 0%;
          width: 0%;
          opacity: 0;
          color: white;
          font-size: 1.2em;
          font-weight: 600;
          transition-duration: .3s;
        }
        /* hover effect on button width */
        .Btn:hover {
          width: 125px;
          border-radius: 40px;
          transition-duration: .3s;
        }
        
        .Btn:hover .sign {
          width: 30%;
          transition-duration: .3s;
          padding-left: 20px;
        }
        /* hover effect button's text */
        .Btn:hover .text {
          opacity: 1;
          width: 70%;
          transition-duration: .3s;
          padding-right: 10px;
        }
        /* button click effect*/
        .Btn:active {
          transform: translate(2px ,2px);
        }
        </style>`);
    }

    bookDetails(){
      return(`<style>
      @import url(https://fonts.googleapis.com/css?family=Raleway:400,300,500,700);
 * {
	 box-sizing: border-box;
}
 body {
	 background: #aedaa6;
	 font-family: "Raleway";
}
 body .card {
	 width: 650px;
	 position: absolute;
	 background: white;
	 margin: 0 auto;
	 top: 50%;
	 left: 50%;
	 transform: translate(-50%, -50%);
	 box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	 transition: all 0.3s;
}
 body .card:hover {
	 box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
 body .card nav {
	 width: 100%;
	 color: #727272;
	 text-transform: uppercase;
	 padding: 20px;
	 border-bottom: 2px solid #efefef;
	 font-size: 12px;
}
 body .card nav svg.heart {
	 height: 24px;
	 width: 24px;
	 float: right;
	 margin-top: -3px;
	 transition: all 0.3s ease;
	 cursor: pointer;
}
 body .card nav svg.heart:hover {
	 fill: red;
}
 body .card nav svg.arrow {
	 float: left;
	 height: 15px;
	 width: 15px;
	 margin-right: 10px;
}
 body .card .photo {
	 padding: 30px;
	 width: 45%;
	 text-align: center;
	 float: left;
}
 body .card .photo img {
	 max-height: 240px;
}
 body .card .description {
	 padding: 30px;
	 float: left;
	 width: 55%;
	 border-left: 2px solid #efefef;
}
 body .card .description h1 {
	 color: #515151;
	 font-weight: 300;
	 padding-top: 15px;
	 margin: 0;
	 font-size: 30px;
	 font-weight: 300;
}
 body .card .description h2 {
	 color: #515151;
	 margin: 0;
	 text-transform: uppercase;
	 font-weight: 500;
}
 body .card .description h4 {
	 margin: 0;
	 color: #727272;
	 text-transform: uppercase;
	 font-weight: 500;
	 font-size: 12px;
}
 body .card .description p {
	 font-size: 12px;
	 line-height: 20px;
	 color: #727272;
	 padding: 20px 0;
	 margin: 0;
}
 body .card .description button {
	 outline: 0;
	 border: 0;
	 background: none;
	 border: 1px solid #d9d9d9;
	 padding: 8px 0px;
	 margin-bottom: 30px;
	 color: #515151;
	 text-transform: uppercase;
	 width: 125px;
	 font-family: inherit;
	 margin-right: 5px;
	 transition: all 0.3s ease;
	 font-weight: 500;
}
 body .card .description button:hover {
	 border: 1px solid #aedaa6;
	 color: #aedaa6;
	 cursor: pointer;
}
 
      </style>`);
    }
}