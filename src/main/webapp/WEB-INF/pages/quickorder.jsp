<%--
  Created by IntelliJ IDEA.
  User: Liza Kurilo
  Date: 19.12.2018
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>


<c:url var="contextLinkCart" context="${pageContext.servletContext.contextPath}" value="/cart" />
<c:url var="contextLinkProducts" context="${pageContext.servletContext.contextPath}" value="/products" />
<c:url var="contextLinkMinicart" context="${pageContext.servletContext.contextPath}" value="/minicart" />
<c:url var="contextLinkCompare" context="${pageContext.servletContext.contextPath}" value="/compare" />
<jsp:useBean id="cart" type="com.es.phoneshop.model.cart.Cart" scope="request"/>
<html>
<head>
    <title>Quick Order</title>
    <link href='http://fonts.googleapis.com/css?family=Lobster+Two' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/styles/main.css">
</head>
<body >
<div >
    <jsp:include page="/WEB-INF/pages/header.jsp"/>
</div>
    <main>
        <a  class="total-price" href="${contextLinkCart}" >Cart : ${cart.totalPrice}</a>
        <br>
        <a  class="total-price" href="${contextLinkCompare}" >Go to compare page </a>

        <iframe name="myIframe" src=${contextLinkMinicart} width="400" height="250" align="right" <%--sandbox="allow-same-origin"--%>>
            Нажмите
            <a href=${contextLinkCart} >сюда</a>, чтобы увидеть документ в новом окне. </iframe>

        <form method="post">
            <input name="code"  >
            <input name="quantity" class="number">
            <br>

            <input name="code" >
            <input name="quantity" class="number">
            <br>

            <input name="code"  >
            <input name="quantity"  class="number">
            <br>

            <input name="code"  >
            <input name="quantity"  class="number">
            <br>

            <input name="code"  >
            <input name="quantity"  class="number">
            <br>

            <input name="code"  >
            <input name="quantity"  class="number">
            <br>

            <input name="code"  >
            <input name="quantity"  class="number">
            <br>

            <input name="code"  >
            <input name="quantity"  class="number">
            <br>

            <input name="code"  >
            <input name="quantity" class="number">
            <br>

            <input name="code"  >
            <input name="quantity"  class="number">
        </form>

        <button type="submit" name="action1" value="addToCart">Submit</button>
    </main>
<div>
    <jsp:include page="/WEB-INF/pages/footer.jsp"/>
</div>
</body>
</html>

