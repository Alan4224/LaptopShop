package vn.nhom8.laptopshop.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "products")

public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @NotEmpty(message = "Không được để trống")
    private String name;

    @NotNull
    @DecimalMin(value = "0", inclusive = false, message = "Price phải lớn hơn 0")
    private double price;

    private String image;

    private String ram;
    private String ssd;
    private String screen;
    private String cpu;
    private String graphics_card;
    private String battery;
    private String weight;

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getSsd() {
        return ssd;
    }

    public void setSsd(String ssd) {
        this.ssd = ssd;
    }

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getGraphics_card() {
        return graphics_card;
    }

    public void setGraphics_card(String graphics_card) {
        this.graphics_card = graphics_card;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    @NotNull
    @Min(value = 1, message = "Số lượng phải lớn hơn bằng 1")
    private long quantity;
    private long sold;
    private String factory;
    private String target;

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public long getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image + ", ram=" + ram
                + ", ssd=" + ssd + ", screen=" + screen + ", cpu=" + cpu + ", graphics_card=" + graphics_card
                + ", battery=" + battery + ", weight=" + weight + ", quantity=" + quantity + ", sold=" + sold
                + ", factory=" + factory + ", target=" + target + ", getRam()=" + getRam() + ", getSsd()=" + getSsd()
                + ", getScreen()=" + getScreen() + ", getCpu()=" + getCpu() + ", getClass()=" + getClass()
                + ", getGraphics_card()=" + getGraphics_card() + ", getBattery()=" + getBattery() + ", getWeight()="
                + getWeight() + ", getName()=" + getName() + ", getPrice()=" + getPrice() + ", getImage()=" + getImage()
                + ", getQuantity()=" + getQuantity() + ", getSold()=" + getSold() + ", getFactory()=" + getFactory()
                + ", getTarget()=" + getTarget() + ", getId()=" + getId() + ", hashCode()=" + hashCode()
                + ", toString()=" + super.toString() + "]";
    }

}
