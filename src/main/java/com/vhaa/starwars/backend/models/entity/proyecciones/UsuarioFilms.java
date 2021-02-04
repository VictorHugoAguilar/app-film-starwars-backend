package com.vhaa.starwars.backend.models.entity.proyecciones;

import java.util.List;

import org.springframework.data.web.ProjectedPayload;

import com.vhaa.starwars.backend.models.entity.Film;
import com.vhaa.starwars.backend.models.entity.Usuario;

@ProjectedPayload
public interface UsuarioFilms {

	String getName();
	
	List<Film> getFilms();
	
	Usuario getUsuario();

}
	