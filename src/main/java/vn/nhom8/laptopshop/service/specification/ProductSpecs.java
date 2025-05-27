package vn.nhom8.laptopshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.nhom8.laptopshop.domain.Product_;
import vn.nhom8.laptopshop.domain.Product;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> minPrice(double price) {
        return (root, querry, criteriaBuilder) -> criteriaBuilder.ge(root.get(Product_.PRICE), price);
    }

    public static Specification<Product> maxPrice(double price) {
        return (root, querry, criteriaBuilder) -> criteriaBuilder.le(root.get(Product_.PRICE), price);
    }

    public static Specification<Product> matchFactory(String factory) {
        return (root, querry, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.FACTORY), factory);
    }

    public static Specification<Product> matchListFactory(List<String> factory) {
        return (root, querry, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.FACTORY)).value(factory);
    }

    public static Specification<Product> matchListTarget(List<String> factory) {
        return (root, querry, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.TARGET)).value(factory);
    }

    public static Specification<Product> matchPrice(double min, double max) {
        return (root, querry, criteriaBuilder) -> criteriaBuilder.and(
                criteriaBuilder.le(root.get(Product_.PRICE), max),
                criteriaBuilder.gt(root.get(Product_.PRICE), min));
    }

    public static Specification<Product> matchMultiplePrice(double min, double max) {
        return (root, querry, criteriaBuilder) -> criteriaBuilder.between(
                root.get(Product_.PRICE), min, max);
    }
}
