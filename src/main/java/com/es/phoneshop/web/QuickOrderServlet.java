package com.es.phoneshop.web;

import com.es.phoneshop.model.cart.Cart;
import com.es.phoneshop.model.cart.CartService;
import com.es.phoneshop.model.cart.CartServiceImpl;
import com.es.phoneshop.model.cart.NotEnoughStockException;
import com.es.phoneshop.model.product.ArrayListProductDao;
import com.es.phoneshop.model.product.Product;
import com.es.phoneshop.model.product.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QuickOrderServlet extends HttpServlet {

    private ProductDao productDao;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        super.init();
        productDao = ArrayListProductDao.getInstance();
        cartService = CartServiceImpl.getInstance();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/quickorder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if (request.getParameter("code") != null && request.getParameter("quantity") != null) {

            Cart cart = cartService.getCart(request.getSession());
            List<Product> products = productDao.findProducts("", "", "");
            if (products.stream().anyMatch(product->request.getParameter("code").equals(product.getCode()))) {

            }
        }
     /*   request.setAttribute("quantityErrors", quantityErrors);
        request.setAttribute("cart", cart);*/
        request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
    }
}
