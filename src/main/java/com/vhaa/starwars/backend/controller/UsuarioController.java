package com.vhaa.starwars.backend.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vhaa.starwars.backend.common.controller.CommonController;
import com.vhaa.starwars.backend.models.entity.Mail;
import com.vhaa.starwars.backend.models.entity.Usuario;
import com.vhaa.starwars.backend.models.entity.UsuarioRequest;
import com.vhaa.starwars.backend.models.entity.proyecciones.UsuarioFilms;
import com.vhaa.starwars.backend.models.repository.MailRepository;
import com.vhaa.starwars.backend.models.services.UsuarioService;

@CrossOrigin(origins = { "http://localhost:4200" })
@RestController
@RequestMapping("usuarios")
public class UsuarioController extends CommonController<Usuario, UsuarioService> {

	@Autowired
	MailRepository mailService;

	@PostMapping("crear-con-mail")
	public ResponseEntity<?> crear(@Valid @RequestBody UsuarioRequest usuarioRequest, BindingResult result) {

		if (result.hasErrors()) {
			return this.validar(result);
		}
		Usuario currentUser = new Usuario();
		currentUser.setUsuario(usuarioRequest.getUsuario());
		currentUser.setPassword(usuarioRequest.getPassword());
		Usuario entityDb = service.save(currentUser);
		usuarioRequest.getMails().forEach(m -> {
			Mail currentMail = new Mail();
			currentMail.setMail(m.getMail());
			currentMail.setUsuario(entityDb);
			mailService.save(currentMail);
			entityDb.addMail(currentMail);
		});
		return ResponseEntity.status(HttpStatus.CREATED).body(entityDb);
	}

	@PutMapping("modificar-con-mail")
	public ResponseEntity<?> modificar(@Valid @RequestBody UsuarioRequest usuarioRequest, BindingResult result) {

		if (result.hasErrors()) {
			return this.validar(result);
		}
		Optional<Usuario> optionalUser = service.findById(usuarioRequest.getId());
		if (!optionalUser.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		Usuario currentUser = optionalUser.get();
		currentUser.setUsuario(usuarioRequest.getUsuario());
		currentUser.setPassword(usuarioRequest.getPassword());
		Usuario entityDb = service.save(currentUser);

		List<Mail> mails = mailService.findByUsuario(entityDb);
		mails.stream().forEach(m -> {
			if (!usuarioRequest.getMails().contains(m)) {
				mailService.delete(m);
			}
		});

		usuarioRequest.getMails().forEach(m -> {
			Optional<Mail> optionalMail = Optional.empty();
			Mail currentMail;
			if (m.getId() == null) {
				currentMail = new Mail();
			} else {
				optionalMail = mailService.findById(m.getId());
				currentMail = optionalMail.get();
			}
			currentMail.setMail(m.getMail());
			currentMail.setUsuario(currentUser);
			mailService.save(currentMail);
			if (m.getId() == null) {
				entityDb.addMail(currentMail);
			}
		});
		return ResponseEntity.status(HttpStatus.CREATED).body(entityDb);
	}

	@PutMapping("/{id}/asignar-mail")
	public ResponseEntity<?> asignarMail(@RequestBody Mail mail, @PathVariable Long id) {
		Optional<Usuario> usuario = service.findById(id);
		if (!usuario.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		Usuario currentUsuario = usuario.get();
		currentUsuario.addMail(mail);
		Usuario usuarioUpdate = service.save(currentUsuario);
		mail.setUsuario(usuarioUpdate);
		mailService.save(mail);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(usuarioUpdate);
	}

	@PutMapping("/{id}/eliminar-mail")
	public ResponseEntity<?> eliminarMail(@RequestBody Mail mail, @PathVariable Long id) {
		Optional<Usuario> usuario = service.findById(id);
		if (!usuario.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		Usuario currentUsuario = usuario.get();
		Mail mailToDelete = currentUsuario.getMails().stream().filter(m -> m.getMail().equalsIgnoreCase(mail.getMail()))
				.findFirst().get();
		;
		currentUsuario.removeMail(mailToDelete);
		Usuario usuarioUpdate = service.save(currentUsuario);
		mailService.delete(mailToDelete);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(usuarioUpdate);
	}

	@GetMapping("/buscar-usuario/{usuario}")
	public ResponseEntity<?> buscarUsuario(@PathVariable String usuario) {
		Optional<UsuarioFilms> usuariosFilms = Optional.ofNullable(service.getUsuarioAndFilms(usuario));
		if (!usuariosFilms.isPresent()) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();

		}
		return ResponseEntity.ok(usuariosFilms);
	}
	
	@GetMapping("/buscar-usuario-sin-people")
	public ResponseEntity<?> buscarUsuarioSinPeople() {
		Optional<List<Usuario>> usuariosFilms = Optional.ofNullable(service.findByPeopleIsNull());
		if (!usuariosFilms.isPresent()) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();

		}
		return ResponseEntity.ok(usuariosFilms);
	}

}
