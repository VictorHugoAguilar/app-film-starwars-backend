package com.vhaa.starwars.backend.models.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.vhaa.starwars.backend.models.entity.Planet;


public interface PlanetRepository extends PagingAndSortingRepository<Planet, Long> {

}
