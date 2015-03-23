package com.davidoladeji.box.repository;

import com.davidoladeji.box.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

/**
 * Created by Daveola on 2/16/2015.
 */

@Transactional
public interface AccountRepository extends JpaRepository<Account, Long> {

    Account findByUsername(String username);
    List<Account> findByRoleId(int id);

}
