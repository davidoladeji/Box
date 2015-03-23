package com.davidoladeji.box.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

/**
 * Created by Daveola on 2/16/2015.
 */
@Entity
public class Transfer {

    @Id
    @Column(name = "id")
    private Long id;

    @Basic
    @Column(name = "transfer_timestamp")
    private Timestamp transferTimestamp;

    @Basic
    @Column(name = "destination_warehouse")
    private int destinationWarehouse;

    @Basic
    @Column(name = "departure_warehouse")
    private int departureWarehouse;

    @Basic
    @Column(name = "mileage")
    private Long mileage;

    @Basic
    @Column(name = "transfer_status_id")
    private int transferStatusId;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Timestamp getTransferTimestamp() {
        return transferTimestamp;
    }

    public void setTransferTimestamp(Timestamp transferTimestamp) {
        this.transferTimestamp = transferTimestamp;
    }


    public int getDestinationWarehouse() {
        return destinationWarehouse;
    }

    public void setDestinationWarehouse(int destinationWarehouse) {
        this.destinationWarehouse = destinationWarehouse;
    }


    public int getDepartureWarehouse() {
        return departureWarehouse;
    }

    public void setDepartureWarehouse(int departureWarehouse) {
        this.departureWarehouse = departureWarehouse;
    }


    public Long getMileage() {
        return mileage;
    }

    public void setMileage(Long mileage) {
        this.mileage = mileage;
    }

    public int getTransferStatusId() {
        return transferStatusId;
    }

    public void setTransferStatusId(int transferStatusId) {
        this.transferStatusId = transferStatusId;
    }

}
