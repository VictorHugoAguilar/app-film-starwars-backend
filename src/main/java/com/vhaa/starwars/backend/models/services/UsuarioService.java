package com.vhaa.starwars.backend.models.services;

import java.util.List;

import com.vhaa.starwars.backend.common.services.CommonService;
import com.vhaa.starwars.backend.models.entity.Usuario;
import com.vhaa.starwars.backend.models.entity.proyecciones.UsuarioFilms;

public interface UsuarioService extends CommonService<Usuario> {
	
	public Usuario findByUsuario(String usuario);

	public UsuarioFilms getUsuarioAndFilms(String name);
	
	public List<Usuario> findByPeopleIsNull();

	
}
