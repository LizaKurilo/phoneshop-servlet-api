package com.es.phoneshop.model.comparisonServise;

import com.es.phoneshop.model.product.Product;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ComparisonService {

    List<Product> getComparisonProducts(HttpSession session);
    void addToComparisonProducts(List<Product> list, Product product);
}
