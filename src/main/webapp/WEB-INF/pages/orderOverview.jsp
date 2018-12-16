<%--
  Created by IntelliJ IDEA.
  User: Liza Kurilo
  Date: 09.12.2018
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<tags:master pageTitle="Cart">
    <jsp:useBean id="order" type="com.es.phoneshop.model.order.Order" scope="request"/>

    <c:url var="contextLinkCheckout" context="${pageContext.servletContext.contextPath}" value="/checkout" />
    <c:url var="contextLinkCart" context="${pageContext.servletContext.contextPath}" value="/cart" />

  <p>Thank you for order!</p>

        <%--<table>--%>
            <%--<tr>--%>
                <%--<td></td>--%>
                <%--<td>Code</td>--%>
                <%--<td>Description</td>--%>
                <%--<td class="number">Price</td>--%>
                <%--<td class="number">Quantity</td>--%>
                <%--<td></td>--%>
            <%--</tr>--%>

            <%--<c:forEach var="item" items="${cart.cartItems}">--%>
                <%--<tr>--%>
                    <%--<td>--%>
                        <%--<img class="product-list" src="https://raw.githubusercontent.com/andrewosipenko/phoneshop-ex..${item.product.imageUrl}"></td>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                            <%--${item.product.code}--%>
                    <%--<td>${item.product.description}</td>--%>
                    <%--<td>  <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="${item.product.currency.symbol}"/> </td>--%>
                    <%--<td>--%>
                            <%--${item.quantity}--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<button formaction="${contextLinkCart}/${item.product.id}">Delete</button>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--<tr>--%>
                <%--<td></td>--%>
                <%--<td>Total:</td>--%>
                <%--<td>${cart.totalPrice}</td>--%>
            <%--</tr>--%>
        <%--</table>--%>
        <br>
        Name: ${order.name}
       <%-- <input name="name" placeholder="name">--%>
        <br><br>
        Address: ${order.deliveryAddress}
       <%-- <input name="deliveryAddress" placeholder="deliveryAddress">--%>
        <br><br>
        Phone: ${order.phone}
        <%--<input name="phone" placeholder="phone">--%>
        <br><br>
    </form>
</tags:master>