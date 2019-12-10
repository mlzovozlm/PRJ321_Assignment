<%-- 
    Document   : login
    Created on : Mar 3, 2019, 2:48:08 PM
    Author     : Bao Anh Luu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <%
            String fail = (String) request.getAttribute("fail");
        %>
        <link rel="stylesheet" type="text/css" href="Default.css">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    </head>

    <body class="HomePage">
        <body class="HomePage">
            <header id="header"> 
                <div id="logo">
                    <img src="images/logo.gif" alt="logo"><b style="font-size: 400%">EBook <span style="color: #8C0209;">Shop</span></b>
                        <div><a href="mailto:anhlbse05203@fpt.edu.vn" style="text-decoration: none;"><img src="images/Email.gif" alt="email"> Liên hệ</a></div>
                </div>

            </header>
            <section id="menuContainer"> 
                <div id="menu" >
                    <div class="menu_left" > </div>
                    <nav class="menu_bg" >
                        <ul id="mainMenu">
                            <li><a href="homepage">Home</a></li>
                            <li><a href="cart">Cart</a></li>
                            <li><a href="login">Login</a></li>
                            <li><a href="register">Register</a></li>
                            <li><a href="manage">Manage (For Staff)</a></li>
                        </ul>
                    </nav>
                </div>
            </section>
            <section id="mainContainer">
                <aside id="sidebar1"> 
                    <div class="sidebarcontent">
                        <iframe class="bar1_box" src="Categories.html" name="SanPhamMoi"></iframe>
                    </div>
                </aside>
                <div class="formDK">
                    <form id="loginform" action="login" method="POST">
                        <h1 id="formTitle">Login</h1>
                        <p class="divide">&nbsp;&nbsp;&nbsp;&nbsp;-----------------------------------------------------------</p>
                        <table class="formContent">
                            <tr>
                                <td class="td1">
                                    Username:
                                </td>
                                <td>
                                    <input type="text" name="username" required/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td1">
                                    Password:
                                </td>
                                <td>
                                    <input type="password" name="password" required/>
                                </td>
                            </tr>
                            <tr>
                                <td id="confirmRow" colspan="2">
                                    <input value="submit" type="image" id="submit" src="images/submit2.gif" alt="submit"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <%if (fail != null) {%>
                    <div class="besideemailbox" style="color : red">
                        <%=fail%>
                    </div>
                    <%}%>
                </div>
                <aside id="sidebar2">
                    <div class="sidebarcontent">
                        <iframe height="130px" width="100%" src="CartSummary.html" name="GioHang"></iframe>
                    </div>
                </aside>
                <div style="clear: both;">&nbsp;</div>
            </section>

            <footer id="footer">
                <div id="copyright">&copy; 2009 All Rights Reserved &bull; Design by <a href="http://alphatek.edu.vn">Alphatek Company</a></div>
                <div id="facebook">
                    <a href="https://www.facebook.com/hoiyeuthichlaptrinh"><img src="images/facebook.png" alt="facebook"/></a>
                    <a href="http://www.youtube.com/hoclaptrinh"><img src="images/youTube.png" alt="youtube"/></a>
                </div>
            </footer>
        </body>
</html>
