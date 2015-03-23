package com.davidoladeji.box.model;

import com.davidoladeji.box.util.Encrypter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by Daveola on 2/16/2015.
 */
@Entity
@Table(name = "account")
public class Account {

    @OneToMany
    List<Orders> orders;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Basic
    @Column(name = "staffid")
    private Long staffid;
    @Column(name = "role_id")
    private int roleId;
    @Column(name = "firstname")
    private String firstname;
    @Column(name = "surname")
    private String surname;
    @Column(name = "username")
    private String username;
    @Column(name = "email")
    private String email;
    @Column(name = "password")
    private String password;
    @Column(name = "gender")
    private int gender;
    @Column(name = "dob")
    private Date dob;
    @Column(name = "mobile")
    private String mobile;
    @Column(name = "postcode")
    private String postcode;
    @Column(name = "addresslineone")
    private String addresslineone;
    @Column(name = "addresslinetwo")
    private String addresslinetwo;
    @Column(name = "city")
    private String city;
    @Column(name = "country")
    private String country;
    @Column(name = "enabled")
    private boolean enabled;

    public Account() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Long getStaffid() {
        return staffid;
    }

    public void setStaffid(Long staffid) {
        this.staffid = staffid;
    }


    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }


    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }


    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        Encrypter encrypter = new Encrypter();
        this.password = encrypter.encrypt(password);
    }


    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }


    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }


    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getAddresslineone() {
        return addresslineone;
    }

    public void setAddresslineone(String addresslineone) {
        this.addresslineone = addresslineone;
    }

    public String getAddresslinetwo() {
        return addresslinetwo;
    }

    public void setAddresslinetwo(String addresslinetwo) {
        this.addresslinetwo = addresslinetwo;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }


    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }


    public List<Orders> getOrders() {
        return orders;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
    }
}
