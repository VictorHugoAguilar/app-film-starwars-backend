package com.vhaa.starwars.backend.models.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

@Entity(name="people")
@Table(name = "people")
public class People implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name = "kaugen", strategy = "increment")
	@GeneratedValue(generator = "kaugen")
	@Column(name = "codigo", unique = true, nullable = false)
	private Long codigo;

	@Column(name = "name")
	@NotEmpty
	private String name;

	@Column(name = "gender")
	@NotEmpty
	private String gender;

	@Column(name = "height")
	@NotEmpty
	private String height;

	@Column(name = "mass")
	@NotEmpty
	private String mass;

	@Column(name = "birth_year")
	@NotEmpty
	private String birthYear;

	@Column(name = "eye_color")
	@NotEmpty
	private String eyeColor;

	@Column(name = "hair_color")
	@NotEmpty
	private String hairColor;

	@Column(name = "skin_color")
	@NotEmpty
	private String skinColor;

	@NotNull
	@JsonIgnoreProperties(value = {"peoples", "handler", "hibernateLazyInitializer"} )
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="homeworld")
	private Planet planet;
	
	@JsonIgnore
	@JsonIgnoreProperties(value = {"peoples", "handler", "hibernateLazyInitializer"} )
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "films_people", joinColumns = {
			@JoinColumn(name = "codigo_people", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "codigo_film", nullable = false, updatable = false) })
	private Set<Film> films = new HashSet<Film>();
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	@JsonIgnoreProperties(value = {"people","handler", "hibernateLazyInitializer"} )
	@OneToOne(mappedBy = "people", cascade = CascadeType.ALL,
            fetch = FetchType.LAZY, optional = true)
	private Usuario usuario;

	@Column(name = "created")
	private String created;

	@Column(name = "edited")
	private String edited;

	public People() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	public String getEyeColor() {
		return eyeColor;
	}

	public void setEyeColor(String eyeColor) {
		this.eyeColor = eyeColor;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHairColor() {
		return hairColor;
	}

	public void setHairColor(String hairColor) {
		this.hairColor = hairColor;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getMass() {
		return mass;
	}

	public void setMass(String mass) {
		this.mass = mass;
	}

	public String getSkinColor() {
		return skinColor;
	}

	public void setSkinColor(String skinColor) {
		this.skinColor = skinColor;
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getEdited() {
		return edited;
	}

	public void setEdited(String edited) {
		this.edited = edited;
	}

	public Planet getPlanet() {
		return planet;
	}

	public void setPlanet(Planet planet) {
		this.planet = planet;
	}

	public Set<Film> getFilms() {
		return films;
	}

	public void setFilms(Set<Film> films) {
		this.films = films;
	}
	

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((codigo == null) ? 0 : codigo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		People other = (People) obj;
		if (codigo == null) {
			if (other.codigo != null)
				return false;
		} else if (!codigo.equals(other.codigo))
			return false;
		return true;
	}


}
