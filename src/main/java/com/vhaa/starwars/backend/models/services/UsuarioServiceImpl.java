package com.vhaa.starwars.backend.models.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.vhaa.starwars.backend.common.services.CommonServiceImpl;
import com.vhaa.starwars.backend.models.entity.Usuario;
import com.vhaa.starwars.backend.models.entity.proyecciones.UsuarioFilms;
import com.vhaa.starwars.backend.models.repository.UsuarioRepository;


@Service
public class UsuarioServiceImpl extends CommonServiceImpl<Usuario, UsuarioRepository> implements UsuarioService {

	@Override
	public Usuario findByUsuario(String usuario) {
		return repository.findByUsuario(usuario);
	}
	
	@Override
	public UsuarioFilms getUsuarioAndFilms(String name) {
		return repository.getUsuarioAndFilms(name);
	}

	@Override
	public List<Usuario> findByPeopleIsNull() {
		return  repository.findByPeopleIsNull();
	}

}