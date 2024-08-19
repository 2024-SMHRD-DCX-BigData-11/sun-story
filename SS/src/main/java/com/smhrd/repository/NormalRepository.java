package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.Trip;


@Repository
public interface NormalRepository extends JpaRepository<Trip, Integer> {

	public List<Trip> findById(int trip_id);
	public List<Trip> findByNameIn(List<String> name);
	public List<Trip> findByTagLike(String name);
	@Query("""
			select t.detail
			from Trip t
			where t.trip_id = :trip_id
			""")
	public String getdetail(int trip_id);
	
}
