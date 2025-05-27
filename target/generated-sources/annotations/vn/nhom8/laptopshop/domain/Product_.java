package vn.nhom8.laptopshop.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(Product.class)
@Generated("org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
public abstract class Product_ {

	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#image
	 **/
	public static volatile SingularAttribute<Product, String> image;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#sold
	 **/
	public static volatile SingularAttribute<Product, Long> sold;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#factory
	 **/
	public static volatile SingularAttribute<Product, String> factory;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#quantity
	 **/
	public static volatile SingularAttribute<Product, Long> quantity;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#ssd
	 **/
	public static volatile SingularAttribute<Product, String> ssd;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#screen
	 **/
	public static volatile SingularAttribute<Product, String> screen;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#cpu
	 **/
	public static volatile SingularAttribute<Product, String> cpu;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#weight
	 **/
	public static volatile SingularAttribute<Product, String> weight;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#battery
	 **/
	public static volatile SingularAttribute<Product, String> battery;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#target
	 **/
	public static volatile SingularAttribute<Product, String> target;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#graphics_card
	 **/
	public static volatile SingularAttribute<Product, String> graphics_card;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#price
	 **/
	public static volatile SingularAttribute<Product, Double> price;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#name
	 **/
	public static volatile SingularAttribute<Product, String> name;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#id
	 **/
	public static volatile SingularAttribute<Product, Long> id;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product
	 **/
	public static volatile EntityType<Product> class_;
	
	/**
	 * @see vn.nhom8.laptopshop.domain.Product#ram
	 **/
	public static volatile SingularAttribute<Product, String> ram;

	public static final String IMAGE = "image";
	public static final String SOLD = "sold";
	public static final String FACTORY = "factory";
	public static final String QUANTITY = "quantity";
	public static final String SSD = "ssd";
	public static final String SCREEN = "screen";
	public static final String CPU = "cpu";
	public static final String WEIGHT = "weight";
	public static final String BATTERY = "battery";
	public static final String TARGET = "target";
	public static final String GRAPHICS_CARD = "graphics_card";
	public static final String PRICE = "price";
	public static final String NAME = "name";
	public static final String ID = "id";
	public static final String RAM = "ram";

}

