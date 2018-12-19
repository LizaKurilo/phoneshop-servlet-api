<%--
  Created by IntelliJ IDEA.
  User: Liza Kurilo
  Date: 19.12.2018
  Time: 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="comparison" type="java.util.ArrayList" scope="request"/>

<tags:master pageTitle="Compare">

    <c:url var="contextLinkCart" context="${pageContext.servletContext.contextPath}" value="/cart" />
    <c:url var="contextLinkCheckout" context="${pageContext.servletContext.contextPath}" value="/checkout" />

    <c:if test="${not empty param.message}">
        <p class="success">${param.message}</p>
    </c:if>

    <form method="post" action="${contextLinkCart}">
        <table>
            <tr>
                <td></td>
                <td>Code</td>
                <td>Description</td>
                <td class="number">Price</td>
                <td class="number">Stock</td>
                <td></td>
            </tr>

            <c:forEach var="comparison" items="${comparison}">
                <tr>
                    <td>
                        <img class="product-list" src="https://raw.githubusercontent.com/andrewosipenko/phoneshop-ex..${comparison.imageUrl}"></td>
                    </td>
                    <td>
                            ${comparison.code}
                    <td>${comparison.description}</td>
                    <td>  <fmt:formatNumber value="${comparison.price}" type="currency" currencySymbol="${comparison.currency.symbol}"/> </td>

                    <td>${comparison.stock}</td>

                    <td>
                        <button formaction="${contextLinkCart}/${product.product.id}">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </form>
</tags:master>