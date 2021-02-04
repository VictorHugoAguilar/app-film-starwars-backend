package com.vhaa.starwars.backend.models.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.vhaa.starwars.backend.common.services.CommonServiceImpl;
import com.vhaa.starwars.backend.models.entity.Mail;
import com.vhaa.starwars.backend.models.entity.Usuario;
import com.vhaa.starwars.backend.models.repository.MailRepository;


@Service
public class MailServiceImpl extends CommonServiceImpl<Mail, MailRepository> implements MailService {

	@Override
	public List<Mail> findByUsuario(Usuario usuario) {
		return this.repository.findByUsuario(usuario);
	}

	 

}