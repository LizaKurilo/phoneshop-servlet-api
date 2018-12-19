package com.es.phoneshop.model.comparisonServise;

import com.es.phoneshop.model.product.Product;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class ComparisonServiceImpl implements ComparisonService {

    List<Product> comparisomProducts;
    private static final String COMPARISON_ATTRIBUTE = "comparison";
    private static volatile ComparisonService comparisonService;

    private ComparisonServiceImpl() {
        comparisomProducts = new ArrayList<>();
    }

    public static ComparisonService getInstance() {
        if (comparisonService == null) {
            synchronized (ComparisonServiceImpl.class) {
                if (comparisonService == null) {
                    comparisonService = new ComparisonServiceImpl();
                }
            }
        }
        return comparisonService;
    }



    @Override
    public List<Product> getComparisonProducts(HttpSession session) {
        comparisomProducts = (List<Product>) session.getAttribute(COMPARISON_ATTRIBUTE);
        if (comparisomProducts == null) {
            comparisomProducts = new ArrayList<>();
            session.setAttribute(COMPARISON_ATTRIBUTE, comparisomProducts);
        }
        return comparisomProducts;
    }

    @Override
    public void addToComparisonProducts(List<Product> list, Product product) {
        if (list.stream()
                .noneMatch(product1 -> product1.getId()
                        .equals(product.getId()))) {
            list.add(product);
        }
    }
}
