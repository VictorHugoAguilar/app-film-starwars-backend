package com.vhaa.starwars.backend.models.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.vhaa.starwars.backend.models.entity.People;

public interface PeopleRepository extends PagingAndSortingRepository<People, Long> {

	//@Query("select p from people p where p.name like concat('%', ?1, '%') ")
	public List<People> findByNameContaining(String name);
	
	public List<People> findByUsuarioIsNull();

	
	public Page<People> findByNameContaining(String name, Pageable pageable);

}
