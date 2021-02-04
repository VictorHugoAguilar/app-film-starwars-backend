package com.vhaa.starwars.backend.models.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.vhaa.starwars.backend.common.services.CommonService;
import com.vhaa.starwars.backend.models.entity.People;

public interface PeopleService extends CommonService<People> {
	
	public List<People> findByName(String name);
	
	public Page<People> findByNameContaining(String name, Pageable pageable);

	public List<People> findByUsuarioIsNull();

}
