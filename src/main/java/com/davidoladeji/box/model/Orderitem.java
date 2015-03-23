package com.davidoladeji.box.model;

import javax.persistence.*;

/**
 * Created by Daveola on 2/16/2015.
 */
@Entity(name = "orderItem")
@Table(name = "orderitem")
public class Orderitem {


    @ManyToOne
    Orders orders;

    @Column(name = "status")
    private int status;

    @OneToOne
    Warehouse warehouse;

    @OneToOne(optional = true)
    Transfer transfer;

    @OneToOne
    private Product product;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Basic
    @Column(name = "price")
    private Double price;

    @Basic
    @Column(name = "transferRequirement")
    private Long transferRequirement;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "product_id", insertable = false, updatable = false)
    private Long productId;


    public Orderitem() {
    }

    public Orderitem(Orders orders, Double price, int quantity, Long productId) {
        this.orders = orders;
        this.price = price;

        this.quantity = quantity;
        this.productId = productId;
    }


    public Orderitem(Long productId) {
        this.productId = productId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Long getTransferRequirement() {
        return transferRequirement;
    }

    public void setTransferRequirement(Long transferRequirement) {
        this.transferRequirement = transferRequirement;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }


    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public double getTotalItemPrice() {
        return this.getQuantity() * this.getPrice();
    }


    public Transfer getTransfer() {
        return transfer;
    }

    public void setTransfer(Transfer transfer) {
        this.transfer = transfer;
    }


    public Warehouse getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(Warehouse warehouse) {
        this.warehouse = warehouse;
    }


}
