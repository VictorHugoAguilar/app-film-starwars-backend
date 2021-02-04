package com.vhaa.starwars.backend.controller;

import java.time.Instant;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vhaa.starwars.backend.common.controller.CommonController;
import com.vhaa.starwars.backend.models.entity.Film;
import com.vhaa.starwars.backend.models.entity.People;
import com.vhaa.starwars.backend.models.entity.Planet;
import com.vhaa.starwars.backend.models.services.FilmService;

@CrossOrigin(origins = {"http://localhost:4200"})
@RestController
@RequestMapping("films")
public class FilmController extends CommonController<Film, FilmService>{
	
	@Override
	public ResponseEntity<?> crear(@Valid @RequestBody Film film, BindingResult result) {
		Instant instant = Instant.now(); 
		String fecha = instant.toString();
		film.setEdited(fecha);
		film.setCreated(fecha);
		return super.crear(film, result);
	}
	
	@Override
	public ResponseEntity<?> modificar(@Valid @RequestBody Film film, BindingResult result) {
		Instant instant = Instant.now(); 
		String fecha = instant.toString();
		film.setEdited(fecha);
		return super.modificar(film, result);
	}
	
	
	@PutMapping("/{id}/asignar-people")
	public ResponseEntity<?> asignarPeople(@RequestBody People people, @PathVariable Long id) {
		Optional<Film> film = service.findById(id);
		if (!film.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		Film currentFilm = film.get();
		currentFilm.addPeople(people);
		Film filmUpdate = service.save(currentFilm);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(filmUpdate);
	}

	@PutMapping("/{id}/eliminar-people")
	public ResponseEntity<?> eliminarPeople(@RequestBody People people, @PathVariable Long id) {
		Optional<Film> film = service.findById(id);
		if (!film.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		Film currentFilm = film.get();
		currentFilm.removePeople(people);
		Film filmUdate = service.save(currentFilm);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(filmUdate);
	}
	
	@PutMapping("/{id}/asignar-planet")
	public ResponseEntity<?> asignarPlanet(@RequestBody Planet planet, @PathVariable Long id) {
		Optional<Film> film = service.findById(id);
		if (!film.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		Film currentFilm = film.get();
		currentFilm.addPlanet(planet);
		Film filmUpdate = service.save(currentFilm);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(filmUpdate);
	}

	@PutMapping("/{id}/eliminar-planet")
	public ResponseEntity<?> eliminarPlanet(@RequestBody Planet planet, @PathVariable Long id) {
		Optional<Film> film = service.findById(id);
		if (!film.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		Film currentFilm = film.get();
		currentFilm.removePlanet(planet);
		Film filmUdate = service.save(currentFilm);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(filmUdate);
	}
}
