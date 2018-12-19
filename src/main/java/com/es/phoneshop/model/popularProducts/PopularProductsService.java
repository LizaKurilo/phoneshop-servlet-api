package com.es.phoneshop.model.popularProducts;

import com.es.phoneshop.model.product.Product;

import java.util.List;

public interface PopularProductsService {
    List<Product> getPopularProducts();
    void addToPopularProducts(List<Product> list, Product product);
}
