package vn.nhom8.laptopshop.domain.DTO;

import java.util.List;
import java.util.Optional;

public class ProductCriterDTO {
    private Optional<String> pageOptional;
    private Optional<List<String>> factoryOptional;
    private Optional<List<String>> targetOptional;
    private Optional<List<String>> priceOptional;
    private Optional<String> sortOptional;

    public Optional<String> getPageOptional() {
        return pageOptional;
    }

    public void setPageOptional(Optional<String> pageOptional) {
        this.pageOptional = pageOptional;
    }

    public Optional<List<String>> getFactoryOptional() {
        return factoryOptional;
    }

    public void setFactoryOptional(Optional<List<String>> factoryOptional) {
        this.factoryOptional = factoryOptional;
    }

    public Optional<List<String>> getTargetOptional() {
        return targetOptional;
    }

    public void setTargetOptional(Optional<List<String>> targetOptional) {
        this.targetOptional = targetOptional;
    }

    public Optional<List<String>> getPriceOptional() {
        return priceOptional;
    }

    public void setPriceOptional(Optional<List<String>> priceOptional) {
        this.priceOptional = priceOptional;
    }

    public Optional<String> getSortOptional() {
        return sortOptional;
    }

    public void setSortOptional(Optional<String> sortOptional) {
        this.sortOptional = sortOptional;
    }

}
