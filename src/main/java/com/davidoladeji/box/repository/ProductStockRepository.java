package com.davidoladeji.box.repository;

import com.davidoladeji.box.model.ProductStock;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Daveola on 2/16/2015.
 */

@DynamicUpdate(value = true)
public interface ProductStockRepository extends JpaRepository<ProductStock, Long> {

    List<ProductStock> findByProductId(Long productId);

    List<ProductStock> findByProductIdAndWarehouse_Id(Long productId, Long warehouseId);

    /**

     Extending JPArepository Translates to inheriting the following


     <S extends T> S save(S entity);

     T findOne(ID primaryKey);

     Iterable<T> findAll();

     Long count();

     FindALL() returns a list of repository


     void delete(T entity);

     boolean exists(ID primaryKey);


     This do not need to be implemented

     Also Allows searching or carrying out various actions as related to the attributes of the
     Entity involved e.g.  ProductStock here

     */
}
