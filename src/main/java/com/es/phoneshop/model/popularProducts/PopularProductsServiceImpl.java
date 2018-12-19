package com.es.phoneshop.model.popularProducts;

import com.es.phoneshop.model.product.Product;
import com.es.phoneshop.model.viewedProducts.ViwedProductsImpl;

import java.util.*;
import java.util.stream.Collectors;

public class PopularProductsServiceImpl implements PopularProductsService {
    private static volatile PopularProductsService popularProductsService;

    private PopularProductsServiceImpl() {
        popularMap = new HashMap<>();
    }

    public static PopularProductsService getInstance() {
        if (popularProductsService == null) {
            synchronized (ViwedProductsImpl.class) {
                if (popularProductsService == null) {
                    popularProductsService = new PopularProductsServiceImpl();
                }
            }
        }
        return popularProductsService;
    }

    private  Map<Product, Integer> popularMap;

    @Override
    public List<Product> getPopularProducts() {
         HashMap<Product, Integer> sorted =
                popularMap.entrySet().stream()
                        .sorted(Map.Entry.<Product, Integer>comparingByValue().reversed())
                        .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue,
                                (oldValue, newValue) -> oldValue, LinkedHashMap::new));
        List<Product> allProducts = new ArrayList<>( sorted.keySet());
        if(allProducts.size() < 3){
            return allProducts;
        } else {
            return allProducts.subList(0, 3);
        }

    }

    @Override
    public void addToPopularProducts (List<Product> list, Product product) {
        if (popularMap.containsKey(product)) {
            popularMap.put(product, popularMap.get(product) + 1);
        }
        else {
            popularMap.put(product, 1);
        }
    }
}
