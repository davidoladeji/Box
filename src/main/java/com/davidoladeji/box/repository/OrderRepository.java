package com.davidoladeji.box.repository;

import com.davidoladeji.box.model.Account;
import com.davidoladeji.box.model.Orders;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Daveola on 2/16/2015.
 */

@Transactional
public interface OrderRepository extends JpaRepository<Orders, Long> {

    // Allow finding a list of orders for a particular Logged in User
    List<Orders> findByAccount_Id(Long id);

    List<Orders> findByAccount(Account account);


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
 Entity involved e.g. Orders in this case

 */
}
