<%-- 
    Document   : homepage
    Created on : Mar 3, 2019, 1:58:21 PM
    Author     : Bao Anh Luu
--%>

<%@page import="model.Account"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book Shop</title>
        <link rel="stylesheet" type="text/css" href="Default.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <%
            Order order = (Order) request.getAttribute("order");
            Account user = (Account) session.getAttribute("user");
        %>
        <script>
            function checkOut(user) {
                var invalid = (user === null);
                if (invalid === true) {
                    alert("You need to login first");
                    return false;
                }
                var confirm = confirm("Do you really want to checkout?");
                if (confirm) {
                    return true;
                } else
                    return false;
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
                        &loz; Ordered Products
                    </div>
                    <div>
                        <form action="checkout" method="POST" onsubmit="return checkOut(<%=user%>);">
                            <table border='1' style="width: 100%; border: 1px solid #8C0209; border-collapse:collapse;">
                                <tr>
                                    <th>Title</th>
                                    <th>Author</th>
                                    <th>Price</th>
                                    <th>Remove</th>
                                </tr>
                                <% for (OrderDetail od : order.getOrderdetails()) {
                                %>
                                <tr>
                                    <td><%=od.getBook().getTitle()%></td>
                                    <td><%=od.getBook().getAuthor()%></td>
                                    <td><%=od.getPrice()%></td>
                                    <td><a href="cartRemove?id=<%=od.getBook().getID()%>" onclick="return confirm('Are you sure?')">Remove</a></td>
                                </tr>    
                                <%}%>
                            </table>
                            Total: <%=order.totalPrice()%>
                            <input type="submit" value="CheckOut"/>
                        </form>
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