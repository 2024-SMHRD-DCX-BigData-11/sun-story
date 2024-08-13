package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.Trip;


@Repository
public interface NormalRepository extends JpaRepository<Trip, Integer> {

	public List<Trip> findById(int trip_id);
}
