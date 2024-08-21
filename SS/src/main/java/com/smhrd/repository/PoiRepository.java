package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.tb_poi;

	@Repository
	public interface PoiRepository extends JpaRepository<tb_poi, Integer> {

		public List<tb_poi> findById(int trip_id);
}
