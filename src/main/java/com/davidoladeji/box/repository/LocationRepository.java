package com.davidoladeji.box.repository;

import com.davidoladeji.box.model.Location;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;

/**
 * Created by Daveola on 2/16/2015.
 */

@Transactional
public interface LocationRepository extends JpaRepository<Location, Long> {

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
     Entity involved e.g. Location in this case

     */

}
