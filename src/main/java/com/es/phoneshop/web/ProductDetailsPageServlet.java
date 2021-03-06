package com.es.phoneshop.web;

import com.es.phoneshop.model.cart.CartService;
import com.es.phoneshop.model.cart.CartServiceImpl;

import com.es.phoneshop.model.cart.NotEnoughStockException;
import com.es.phoneshop.model.product.ArrayListProductDao;
import com.es.phoneshop.model.product.Product;
import com.es.phoneshop.model.product.ProductDao;
import com.es.phoneshop.model.viewedProducts.ViewedProductsService;
import com.es.phoneshop.model.viewedProducts.ViwedProductsImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.NoSuchElementException;

public class ProductDetailsPageServlet extends HttpServlet {
    private ProductDao productDao;
    private CartService cartService;
    private ViewedProductsService viewedProductsService;


    @Override
    public void init() throws ServletException {
        super.init();
        productDao = ArrayListProductDao.getInstance();
        cartService = CartServiceImpl.getInstance();
        viewedProductsService = ViwedProductsImpl.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Product product = loadProduct(request);
            request.setAttribute("viewed", viewedProductsService.getViewedProducts(request.getSession()));
            request.setAttribute("cart", cartService.getCart(request.getSession()).getCartItems().toString());
            request.setAttribute("product", product);
            request.getRequestDispatcher("/WEB-INF/pages/product.jsp").forward(request, response);
            viewedProductsService.addToViewedProducts(viewedProductsService.getViewedProducts(request.getSession()), product);
        }
        catch (NoSuchElementException e ) {
           request.getRequestDispatcher("/WEB-INF/pages/404.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product product = loadProduct(req);
        req.setAttribute("product", product);
        req.setAttribute("cart", cartService.getCart(req.getSession()).getCartItems().toString());
        Integer quantity = null;
        try {
            String quantityString = req.getParameter("quantity");
            quantity = Integer.valueOf(quantityString);
        } catch (NumberFormatException e) {
            req.setAttribute("quantityError", "Not a number");
        }
        if (quantity != null) {
            try {
                cartService.addToCart(cartService.getCart(req.getSession()), product, quantity);
                req.setAttribute("message", "Product added successfully");
                resp.sendRedirect(req.getRequestURI() + "?message=Product added successfully");
            } catch (NotEnoughStockException ex) {
                req.setAttribute("quantityError", "Not enough stock");
                req.getRequestDispatcher("/WEB-INF/pages/product.jsp").forward(req, resp);
            }
        } else {
            req.getRequestDispatcher("/WEB-INF/pages/product.jsp").forward(req, resp);
        }
    }

    private Product loadProduct(HttpServletRequest request) throws NoSuchElementException {
        String idString = request.getRequestURI().substring((request.getContextPath() + request.getServletPath()).length() + 1);
        Long id = Long.parseLong(idString);
        return productDao.getProduct(id);
    }
}
