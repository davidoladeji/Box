package com.davidoladeji.box.model;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Daveola on 2/16/2015.
 */
@Entity
@Table(name = "product")
public class Product {


    @OneToMany
    List<ProductStock> productStock;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "weight")
    private String weight;
    @Column(name = "regular_price")
    private Double regularPrice;
    @Column(name = "sales_price")
    private Double salesPrice;
    @Column(name = "itemsperbox")
    private int itemsperbox;


    @Column(name = "enabled")
    private boolean enabled;


    @Column(name = "featured")
    private boolean featured;
    @Column(name = "totalstock", nullable = true)
    private int totalstock;


    public Product() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }


    public Double getRegularPrice() {
        return regularPrice;
    }

    public void setRegularPrice(Double regularPrice) {
        this.regularPrice = regularPrice;
    }


    public Double getSalesPrice() {
        return salesPrice;
    }

    public void setSalesPrice(Double salesPrice) {
        this.salesPrice = salesPrice;
    }


    public int getItemsperbox() {
        return itemsperbox;
    }

    public void setItemsperbox(int itemsperbox) {
        this.itemsperbox = itemsperbox;
    }


    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }


    public boolean isFeatured() {
        return featured;
    }

    public void setFeatured(boolean featured) {
        this.featured = featured;
    }


    public int getTotalstock() {
        int totalstock = 0, stock = 0, count = 0;

        if (this.getProductStock() == null) {
            //If its a new product
            this.totalstock = 0;
        } else if (this.getProductStock().size() >= 1 && this.getProductStock() != null) {
            //Ensure The List of the Product Stock is not empty
            while (this.getProductStock().listIterator().hasNext() && !(count > this.getProductStock().size() - 1)) {
                //Get the stock as a number
                stock = this.getProductStock().get(count).getStock();
                totalstock += stock;
                count++;
            }
            this.totalstock = totalstock;
        } else {
            this.totalstock = 0;
        }

        return totalstock;
    }

    public void setTotalstock(int totalstock) {
        this.totalstock = totalstock;
    }

    public List<ProductStock> getProductStock() {
        return productStock;
    }

    public void setProductStock(List<ProductStock> productStock) {
        this.productStock = productStock;
    }


    @PostLoad
    public void doPostLoad() {
        this.setTotalstock(this.getTotalstock());

        if (this.totalstock == 0) {
            this.setEnabled(false);
        }
    }


    @PrePersist
    public void doPrePersist() {
        this.setTotalstock(this.getTotalstock());
    }


}
