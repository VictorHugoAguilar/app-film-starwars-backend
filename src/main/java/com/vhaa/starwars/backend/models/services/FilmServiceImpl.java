package com.vhaa.starwars.backend.models.services;

import org.springframework.stereotype.Service;

import com.vhaa.starwars.backend.common.services.CommonServiceImpl;
import com.vhaa.starwars.backend.models.entity.Film;
import com.vhaa.starwars.backend.models.repository.FilmRepository;


@Service
public class FilmServiceImpl extends CommonServiceImpl<Film, FilmRepository> implements FilmService {
	

}