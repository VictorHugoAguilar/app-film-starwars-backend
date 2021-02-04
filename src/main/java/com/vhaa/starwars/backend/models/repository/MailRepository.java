package com.vhaa.starwars.backend.models.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.vhaa.starwars.backend.models.entity.Mail;
import com.vhaa.starwars.backend.models.entity.Usuario;

public interface MailRepository extends PagingAndSortingRepository<Mail, Long> {
	
	public List<Mail> findByUsuario(Usuario usuario);
	
}
