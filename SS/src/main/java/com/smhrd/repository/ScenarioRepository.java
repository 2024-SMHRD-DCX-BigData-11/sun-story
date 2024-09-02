package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.tb_scenario;

@Repository
public interface ScenarioRepository extends JpaRepository<tb_scenario, Integer> {
	
	List<tb_scenario> findByTouridx_Touridx(int idx);

}
