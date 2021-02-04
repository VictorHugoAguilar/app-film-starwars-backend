package com.vhaa.starwars.backend.controller;

import java.time.Instant;

import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vhaa.starwars.backend.common.controller.CommonController;
import com.vhaa.starwars.backend.models.entity.Planet;
import com.vhaa.starwars.backend.models.services.PlanetService;

@CrossOrigin(origins = {"http://localhost:4200"})
@RestController
@RequestMapping("planet")
public class PlanetController extends CommonController<Planet, PlanetService> {

	@Override
	public ResponseEntity<?> crear(@Valid @RequestBody Planet planet, BindingResult result) {
		Instant instant = Instant.now();
		String fecha = instant.toString();
		planet.setEdited(fecha);
		planet.setCreated(fecha);
		return super.crear(planet, result);
	}

	@Override
	public ResponseEntity<?> modificar(@Valid @RequestBody Planet planet, BindingResult result) {
		Instant instant = Instant.now();
		String fecha = instant.toString();
		planet.setEdited(fecha);
		return super.modificar(planet, result);
	}

}
