<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="product" type="com.es.phoneshop.model.product.Product" scope="request"/>
<c:url var="contextLinkProducts" context="${pageContext.servletContext.contextPath}" value="/products" />

<table border="1">
    <tr>
        <c:forEach var="product" items="${product}">
            <td>
                <img class="product-title" src="https://raw.githubusercontent.com/andrewosipenko/phoneshop-ex..${product.imageUrl}">
                <p><a href="${contextLinkProducts}/${product.id}">${product.description}</a></p>
                <p>Price: <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="${product.currency.symbol}"></fmt:formatNumber> </p>
            </td>
        </c:forEach>
    </tr>
</table>