<%--
  Created by IntelliJ IDEA.
  User: Liza Kurilo
  Date: 18.11.2018
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>


<jsp:useBean id="product" type="com.es.phoneshop.model.product.Product" scope="request"/>

<tags:master pageTitle="${product.description}" pageClass="product-detail">
    <c:url var="contextLinkCart" context="${pageContext.servletContext.contextPath}" value="/cart" />
    <c:url var="contextLinkProducts" context="${pageContext.servletContext.contextPath}" value="/products" />
    <c:url var="contextLinkMinicart" context="${pageContext.servletContext.contextPath}" value="/minicart" />
    <main>

        <iframe name="myIframe" src=${contextLinkMinicart} width="400" height="250" align="right" <%--sandbox="allow-same-origin"--%>>
            Нажмите
            <a href=${contextLinkCart} >сюда</a>, чтобы увидеть документ в новом окне. </iframe>

    <c:if test="${not empty param.message}">
        <p class="success">${param.message}</p>
    </c:if>
    <table>
        <tr>
            <td>
                <img class="product-list" src="https://raw.githubusercontent.com/andrewosipenko/phoneshop-ext-images/master/${product.imageUrl}"  >
            </td>
            <td>
                <h1>${product.description}</h1>
                <p>Code: ${product.code}</p>
                <p>Stock: ${product.stock}</p>
                <p>Price:  <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="${product.currency.symbol}"/> </p>
                <form method="post" action="${contextLinkProducts}/${product.id}">
                    Quantity: <input name="quantity" value="${not empty param.quantity ? param.quantity : 1}" class="number">
                    <button type="submit" name="action1" value="addToCart">Add to cart</button>
                    <c:if test="${not empty quantityError}">
                        <p class="error">${quantityError}</p>
                    </c:if>
                    <br>
                    <br>
                    <button type="submit" name="action2" value="addToComparison">Add to comparison</button>
                </form>

            </td>
        </tr>
    </table>
    <p>
        Viewed products:
    </p>
    <table border="1">
        <tr>
            <c:forEach var="viewed" items="${viewed}">
                <td>
                    <img class="product-title" src="https://raw.githubusercontent.com/andrewosipenko/phoneshop-ex..${viewed.imageUrl}">
                    <p><a href="${contextLinkProducts}/${viewed.id}">${viewed.description}</a></p>
                    <p>Price: <fmt:formatNumber value="${viewed.price}" type="currency" currencySymbol="${product.currency.symbol}"></fmt:formatNumber> </p>
                </td>
            </c:forEach>
        </tr>
    </table>
     <%--   <tags:tableTag >

    </tags:tableTag>--%>
        Popular products:
        </p>
        <table border="1">
            <tr>
                <c:forEach var="popular" items="${popular}">
                    <td>
                        <img class="product-title" src="https://raw.githubusercontent.com/andrewosipenko/phoneshop-ex..${popular.imageUrl}">
                        <p><a href="${contextLinkProducts}/${popular.id}">${popular.description}</a></p>
                        <p>Price: <fmt:formatNumber value="${popular.price}" type="currency" currencySymbol="${popular.currency.symbol}"></fmt:formatNumber> </p>
                    </td>
                </c:forEach>
            </tr>
        </table>
    </main>
</tags:master>

