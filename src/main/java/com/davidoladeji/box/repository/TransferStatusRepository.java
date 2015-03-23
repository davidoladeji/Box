package com.davidoladeji.box.repository;

import com.davidoladeji.box.model.Transfer;
import com.davidoladeji.box.model.TransferStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;

/**
 * Created by Daveola on 2/16/2015.
 */

@Transactional
public interface TransferStatusRepository extends JpaRepository<TransferStatus, Long> {


}
