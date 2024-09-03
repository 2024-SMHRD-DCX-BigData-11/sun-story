package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.tb_tour_site;


@Repository
public interface NormalRepository extends JpaRepository<tb_tour_site, Integer> {

	public List<tb_tour_site> findById(int trip_id);
	public List<tb_tour_site> findByToursiteIn(List<String> name);
	public List<tb_tour_site> findByTourtagLike(String name);
	public List<tb_tour_site> findByToursiteLike(String name);
	
}
