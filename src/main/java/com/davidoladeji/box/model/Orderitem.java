package com.davidoladeji.box.model;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Daveola on 2/16/2015.
 */
@Entity(name = "orderItem")
@Table(name = "orderitem")
public class Orderitem {


    @OneToMany
    List<Orders> orders;
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
    @Column(name = "orders_id")
    private Long orders_id;

    @Basic
    @Column(name = "transfer_id", insertable = false, updatable = false)
    private int transferId;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "product_id", insertable = false, updatable = false)
    private Long productId;
    @OneToOne
    private Transfer transfer;

    public Orderitem() {
    }

    public Orderitem(Long orderId, Double price, int quantity, Long productId) {
        this.orders_id = orderId;
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

    public Long getOrders_id() {
        return orders_id;
    }

    public void setOrders_id(Long orders_id) {
        this.orders_id = orders_id;
    }

    public int getTransferId() {
        return transferId;
    }

    public void setTransferId(int transferId) {
        this.transferId = transferId;
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


    public Transfer getTransfer() {
        return transfer;
    }

    public void setTransfer(Transfer transfer) {
        this.transfer = transfer;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }


    public List<Orders> getOrders() {
        return orders;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
    }

    public double getTotalItemPrice() {
        return this.getQuantity() * this.getPrice();
    }
}
