package com.vhaa.starwars.backend.models.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.vhaa.starwars.backend.common.services.CommonServiceImpl;
import com.vhaa.starwars.backend.models.entity.People;
import com.vhaa.starwars.backend.models.repository.PeopleRepository;

@Service
public class PeopleServiceImpl extends CommonServiceImpl<People, PeopleRepository> implements PeopleService {

	@Override
	public List<People> findByName(String name) {
		return repository.findByNameContaining(name);
	}

	@Override
	public List<People> findByUsuarioIsNull() {
 		return repository.findByUsuarioIsNull();
	}

	@Override
	public Page<People> findByNameContaining(String name, Pageable pageable) {
		return repository.findByNameContaining(name, pageable);
	}

}