package com.vhaa.starwars.backend.models.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.vhaa.starwars.backend.models.entity.Usuario;
import com.vhaa.starwars.backend.models.entity.proyecciones.UsuarioFilms;

public interface UsuarioRepository extends PagingAndSortingRepository<Usuario, Long> {


	
	@Query("select u from Usuario u where upper(u.usuario) like upper(concat('%', ?1, '%')) ")
	public Usuario findByUsuario(String usuario);
	
	
	//@Query("select u, f from Usuario, Film u where upper(u.usuario) like upper(concat('%', ?1, '%')) ")
	
	@Query("Select p from people p "
			+ " join p.usuario u "
			+ " where upper(u.usuario) like upper(concat('%', ?1, '%'))")
	public UsuarioFilms getUsuarioAndFilms(String name);

	public List<Usuario> findByPeopleIsNull();
	
}
