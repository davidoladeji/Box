package com.davidoladeji.box.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Daveola on 2/16/2015.
 */

public class Cartitem {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Id
    @Column(name = "cart_id")
    private int cartId;

    @Basic
    @Column(name = "timestamp")
    private Timestamp timestamp;

    @Basic
    @Column(name = "product_id")
    private int productId;

    @Id
    @Column(name = "Products_id")
    private int productsId;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }


    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }


    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }


    public int getProductsId() {
        return productsId;
    }

    public void setProductsId(int productsId) {
        this.productsId = productsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cartitem cartitem = (Cartitem) o;

        if (cartId != cartitem.cartId) return false;
        if (productId != cartitem.productId) return false;
        if (productsId != cartitem.productsId) return false;
        if (id != null ? !id.equals(cartitem.id) : cartitem.id != null) return false;
        if (timestamp != null ? !timestamp.equals(cartitem.timestamp) : cartitem.timestamp != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + cartId;
        result = 31 * result + (timestamp != null ? timestamp.hashCode() : 0);
        result = 31 * result + productId;
        result = 31 * result + productsId;
        return result;
    }
}
