<%-- 
    Document   : homepage
    Created on : Mar 3, 2019, 1:58:21 PM
    Author     : Bao Anh Luu
--%>

<%@page import="model.Account"%>
<%@page import="util.gui.Pagger"%>
<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book Shop</title>
        <link rel="stylesheet" type="text/css" href="Default.css"/>
        <link href="Pagger.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <%
            ArrayList<Book> books
                    = (ArrayList<Book>) request.getAttribute("books");
            Integer totalPage = (Integer) request.getAttribute("totalPage");
            Integer pageIndex = (Integer) request.getAttribute("pageIndex");
            int gap = 2;
            String pagelink = "manage";
        %>
        <script lang="javascript">
            function search() {
                window.location.replace("search?titlePart=" + document.getElementById("txtTim").value);
            }
        </script>
    </head>

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
                        <li><div style="margin-right:20px;">
                                <input type="text" id="txtTim" style="width: 180px;height: 25px; border: 1px solid #CA8186; font-style: italic; color: #787878;" value=""/>
                                <input onclick="search()" type="image" id="btnTim" title="Search" src="images/Search2.png" style="height:25px; position:relative;top:8px;width: 23px;border: none;"/>
                            </div></li> 
                    </ul>
                </nav>
            </div>
        </section>
        <section id="mainContainer">

            <aside id="sidebar1"> 
                <div class="sidebarcontent">
                    <iframe height="300px" width="100%" src="Categories.html" name="SanPhamMoi"></iframe>
                </div>
            </aside>

            <section id="maincontent">
                <div  class="contentItem">
                    <div class="menutitle">
                        &loz; Book List
                    </div>
                    <div>
                        <%=Pagger.generate(totalPage, pageIndex, gap, pagelink)%>
                        <form action="bookAdd" method="post">
                            <table border='1' style="width: 100%; border: 1px solid #8C0209; border-collapse:collapse;">
                                <tr>
                                    <th>Title</th>
                                    <th>Author</th>
                                    <th>Price</th>
                                    <th>Cover_url</th>
                                    <th>Add</th>
                                </tr>
                                <% for (Book book : books) {
                                %>
                                <tr>
                                    <td><%=book.getTitle()%></td>
                                    <td><%=book.getAuthor()%></td>
                                    <td><%=book.getPrice()%></td>
                                    <td><%=book.getCover_url()%></td>
                                    <td><input type="button" onclick="#" value="Delete"></td>
                                </tr>
                                <%}%>

                                <tr>
                                    <td><input type="text" name="title" required></td>
                                    <td><input type="text" name="author" required></td>
                                    <td><input type="number" step=0.01" name="price" required></td>
                                    <td><input type="text" name="cover_url" required></td>
                                    <td><input type="submit" value="Add"></td>
                                </tr>
                            </table>
                        </form>
                        <%=Pagger.generate(totalPage, pageIndex, gap, pagelink)%>
                    </div>
                    <div class="menutitle">
                        &loz; Customer List
                    </div>
                    <div class="menutitle">
                        &loz; Staff List
                    </div>
                    <div class="menutitle">
                        &loz; Order List
                    </div>
                    
                </div>
            </section>

            <div style="clear: both;">&nbsp;</div>
        </section>

        <footer id="footer">
            <div id="copyright">&copy; 2009 All Rights Reserved &bull; Design by <a href="http://alphatek.edu.vn">Alphatek Company</a></div>
            <div id="facebook">
                <a href="https://www.facebook.com/hoiyeuthichlaptrinh"><img src="images/facebook.png" alt="facebook"></a>
                <a href="http://www.youtube.com/hoclaptrinh"><img src="images/youTube.png" alt="youtube"></a>
            </div>
        </footer>
    </body>
</html>