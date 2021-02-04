package com.vhaa.starwars.backend.models.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.vhaa.starwars.backend.models.entity.Film;

public interface FilmRepository extends PagingAndSortingRepository<Film, Long> {

}
