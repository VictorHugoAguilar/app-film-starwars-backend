package com.vhaa.starwars.backend.controller;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vhaa.starwars.backend.common.controller.CommonController;
import com.vhaa.starwars.backend.models.entity.People;
import com.vhaa.starwars.backend.models.entity.Usuario;
import com.vhaa.starwars.backend.models.services.PeopleService;
import com.vhaa.starwars.backend.models.services.UsuarioService;

@CrossOrigin(origins = {"http://localhost:4200"})
@RestController
@RequestMapping("people")
public class PeopleController extends CommonController<People, PeopleService> {

	@Autowired
	UsuarioService usuarioService;

	@Override
	public ResponseEntity<?> crear(@Valid @RequestBody People people, BindingResult result) {
		Instant instant = Instant.now();
		String fecha = instant.toString();
		people.setEdited(fecha);
		people.setCreated(fecha);
		return super.crear(people, result);
	}

	@Override
	public ResponseEntity<?> modificar(@Valid @RequestBody People people, BindingResult result) {
		Instant instant = Instant.now();
		String fecha = instant.toString();
		people.setEdited(fecha);
		if(people.getUsuario() != null) {
			Usuario usuario = people.getUsuario();
			usuario.setPeople(people);
			people.setUsuario(usuario);
		}
		return super.modificar(people, result);
	}

	@PutMapping("/{id}/asignar-usuario")
	public ResponseEntity<?> asignarUsuario(@RequestBody Usuario usuario, @PathVariable Long id) {
		Optional<People> people = service.findById(id);
		if (!people.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		Optional<Usuario> usuarioOptional = Optional.ofNullable(usuarioService.findByUsuario(usuario.getUsuario()));
		if (!usuarioOptional.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		People currentPeople = people.get();
		Usuario currentUsuario = usuarioOptional.get();
		currentUsuario.setPeople(currentPeople);
		currentPeople.setUsuario(currentUsuario);
		usuarioService.save(currentUsuario);
		People peopleUpdate = service.save(currentPeople);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(peopleUpdate);
	}

	@PutMapping("/{id}/eliminar-usuario")
	public ResponseEntity<?> eliminarUsuario(@RequestBody Usuario usuario, @PathVariable Long id) {
		Optional<People> people = service.findById(id);
		if (!people.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		Optional<Usuario> usuarioOptional = Optional.ofNullable(usuarioService.findByUsuario(usuario.getUsuario()));
		if (!usuarioOptional.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		People currentPeople = people.get();
		Usuario currentUser = usuarioOptional.get();
		currentUser.setPeople(null);
		usuarioService.save(currentUser);
		currentPeople.setUsuario(null);
		People peopleUpdate = service.save(currentPeople);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(peopleUpdate);
	}

	@GetMapping("/buscar/{name}")
	public ResponseEntity<?> filtrar(@PathVariable String name, Pageable pageable) {
		Page<People> peoples = service.findByNameContaining(name, pageable);
		if (peoples.isEmpty()) {
			ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
		return ResponseEntity.ok(peoples);
	}

	@GetMapping("/buscar-sin-usuarios")
	public ResponseEntity<?> buscarSinUsuarios() {
		List<People> peoples = service.findByUsuarioIsNull();
		if (peoples.isEmpty()) {
			ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
		return ResponseEntity.ok(peoples);
	}
}
