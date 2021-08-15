<%@page import="java.util.ArrayList"%>
<%@page import="models.History"%>
<%@page import="java.util.List"%>
<%@page import="models.Order"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PRJ321</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            body {
                margin-top: 20px;padding: 0;
                background: #FFFFFF;
                text-align: justify;
                font-family: "Helvetica Neue", "Lucida Grande", "Segoe UI", Arial, Helvetica, Verdana, sans-serif;
                font-size:  0.875em;
                color: #616161;	/*xám*/
            }

            h1 {
                padding-top: 10px;
                padding-bottom: 50px;
                padding-left: 50px;
                color: #000000;
                font-weight: normal;
                font-size: 2em;
            }

            p {
                font-size: 14px; 
                font-weight: bold;
            }

            /* Menu */

            #menuContaniner {
                width: 500px;
                float: right;
                margin: -60px 0 0 0;
                background-color:#FFFFFF;/* trắng */
            }
            ul.main_nav {
                margin: 0 auto;
                margin-left: -150px;	
                padding: 0;
                list-style: none;
                height: 50px;
            }

            ul.main_nav li {
                border-right: 1px solid #BCBCBC;
                float: left;
                position: relative;
                text-align: center;
                margin: 0;padding: 0;
                display: inline;
                height: 45px;
                padding-top: 5px;
            }
            ul.main_nav li a {
                color: #000000;
                width: 100px;
                padding: 10px;
                text-decoration: none;
                display: block;
            }

            /* Content */

            #mainContainer {
                width: 1200px;
                height:100%;
                margin: 40px auto;
                padding: 20px 5px;
                background: #FFFACD;
                boder:10px solid black;
            }
            /* about */
            div.about {
                boder: 10px solid pink;
                text-align: center;
            }
        </style>

        <%
            HttpSession s = request.getSession(true);
            String us = (String) s.getAttribute("username");
            String admin = (String) s.getAttribute("admin");
            Order order = (Order) s.getAttribute("order");
        %>
    </head>

    <body>
        <!-- START HEADER -->
        <div id="header" style="width: 1000px; height: 100px; margin: 0 auto; background-color:#FFFFFF; border: none solid #8C0209;">
            <div>
                <h1 style="float:left; margin-left:15px; font-size:40px;">
                    <span style=""><a href="home" style="text-decoration: none;color:#DAA520">Hide</a> </span><span style=""><a href="home" style="text-decoration: none;color:#000000">Store</a></span>
                </h1>
                <p style="float:left;margin-top: 70px;font-weight: 900px;margin-left: 5px;word-spacing: 2px;color:black;font-size:15px;">
                    Baking Store
                </p>
            </div>
        </div>

        <!-- END HEADER -->

        <!-- START MENU -->
        <section id="menuContaniner">
            <ul class="main_nav">

                <% if (us != null) {%>
                <li ><a  href="about" >About</a></li>
                <li ><a  href="shop" style="color:green;">Shop</a></li>
                <li><a  href="shoppingcart" >Cart</a></li>
                <li ><a  href="cart">My Order</a></li>

                <% if (admin != null) {%>
                <li ><a  href="manager">Manager</a></li>
                    <%}%>
                <li ><a  href="logout">Logout</a></li>
                    <%} else {%>

                <li ><a  href="about">About </a></li>
                <li ><a  href="shop" style="color:green;">Shop</a></li>
                <li ><a  href="login">Login</a></li>
                <li ><a  href="register">Register</a></li>
                <li ><a  href="contact">Contact</a></li>
                    <%}%>
            </ul>
        </section>	
        <!-- END MENU -->

        <!-- START CONTENT PAGE -->
        <section id="mainContainer">
            <div class="about" >
                <h2 style="font-size:50px;font-family:Time New Roman">Order history of <span style="color: red;">#<%=us%></span> </h2>
                <table style="width: 50%;height: 100%;" border="1px solid black" align="center">
                    <tr>
                        <td><b>Cart ID</b></td>
                        <td><b>Total Price</b></td>
                    </tr>


                    <%
                        ArrayList<History> list = (ArrayList<History>) request.getAttribute("list");
                        for (History o : list) {
                    %>
                    <tr>
                        <td><%= o.getCartId()%> </td>
                        <td><%= o.getTotalPrice()%> </td>
                    </tr>
                    <%}%>

                </table>
            </div>
        </section>
        <!-- end page -->

        <!-- start Footer-->
        <div id="footer" style="height: 250px; margin: 0 auto;padding: 0 20px;
             background-color: #D3D3D3; border: none solid #8C0209;">
            <p style="float:left; margin:70px; font-size:60px;"> <span style="color:#DAA520">Hide </span><span style="color:#000000">Store</span>
            </p>

            <p style="float:left;margin-top:170px;margin-left:-350px;">
                <a href="https://www.instagram.com/_hide.sg/"><img src="src/ins.png" style="width:65px; height:65px;"></img>
                    <a href="https://www.facebook.com/hiimhide1"><img src="src/fb.png" style="width:65px; height:65px;"></img>

                        </p>

                        <p style="float:right;margin:40px;text-align:left;font-size:15px;margin-right:190px;">
                            <b>Our Story</b><br /><br />
                            <span style="color:#556B2F;">Hide Store is a Hanoi-based bakeshop, which is <br/>
                                known for it’s elegant and delicious selection of <br/>
                                freshly baked sweet treats and beautifully detailed<br /> custom cakes. Our custom and bakeshop treats are<br/>  
                                baked fresh daily, using only the best ingredients
                            </span>
                            </div>
                            <!-- end page -->
                            </body>
                            </html>
