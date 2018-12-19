<%--
  Created by IntelliJ IDEA.
  User: Liza Kurilo
  Date: 19.12.2018
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Minicart</title>
</head>
<body>

<jsp:useBean id="cart" type="com.es.phoneshop.model.cart.Cart" scope="request"/>

<c:url var="contextLinkCart" context="${pageContext.servletContext.contextPath}" value="/cart" />
<c:url var="contextLinkCheckout" context="${pageContext.servletContext.contextPath}" value="/checkout" />
<table>
    <tr>
        <td>Description</td>
        <td>Code</td>
        <td class="number">Price</td>
        <td class="number">Quantity</td>
    </tr>

    <c:forEach var="item" items="${cart.cartItems}">
        <tr>
            <td>${item.product.description}</td>
            <td>
                    ${item.product.code}
            <td>  <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="${item.product.currency.symbol}"/> </td>
            <td>
                    ${item.quantity}
            </td>

        </tr>
    </c:forEach>
    <tr>
        <td></td>
        <td>Total:</td>
        <td>${cart.totalPrice}</td>
    </tr>
</table>
</body>
</html>
