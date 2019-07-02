package org.iii.seaotter.jayee.dao;


import org.iii.seaotter.jayee.entity.Vender;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface VenderDao extends JpaRepository<Vender, Long>,JpaSpecificationExecutor<Vender> {

}
