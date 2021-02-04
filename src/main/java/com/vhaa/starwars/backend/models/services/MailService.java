package com.vhaa.starwars.backend.models.services;

import java.util.List;

import com.vhaa.starwars.backend.common.services.CommonService;
import com.vhaa.starwars.backend.models.entity.Mail;
import com.vhaa.starwars.backend.models.entity.Usuario;

public interface MailService extends CommonService<Mail> {
	
	public List<Mail> findByUsuario(Usuario usuario);

}
