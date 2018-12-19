package com.es.phoneshop.web;

import com.es.phoneshop.model.cart.CartService;
import com.es.phoneshop.model.cart.CartServiceImpl;
import com.es.phoneshop.model.comparisonServise.ComparisonService;
import com.es.phoneshop.model.comparisonServise.ComparisonServiceImpl;
import com.es.phoneshop.model.product.ArrayListProductDao;
import com.es.phoneshop.model.product.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ComparePageServlet extends HttpServlet {

    private ComparisonService comparisonService;

    @Override
    public void init() throws ServletException {
        super.init();
        comparisonService = ComparisonServiceImpl.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("comparison", comparisonService.getComparisonProducts(request.getSession()));
        request.getRequestDispatcher("/WEB-INF/pages/compare.jsp").forward(request, response);
    }
}
