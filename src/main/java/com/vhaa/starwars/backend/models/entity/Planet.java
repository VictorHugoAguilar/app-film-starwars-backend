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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name="planet")
@Table(name = "planets")
public class Planet implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name = "kaugen", strategy = "increment")
	@GeneratedValue(generator = "kaugen")
	@Column(name = "codigo", unique = true, nullable = false)
	private Long codigo;

	@Column(name = "name")
	@NotEmpty
	private String name;

	@Column(name = "diameter")
	@NotEmpty
	private String diameter;

	@Column(name = "rotation_period")
	@NotEmpty
	private String rotationPeriod;

	@Column(name = "orbital_period")
	@NotEmpty
	private String orbitalPeriod;

	@Column(name = "gravity")
	@NotEmpty
	private String gravity;

	@Column(name = "population")
	@NotEmpty
	private String population;

	@Column(name = "climate")
	@NotEmpty
	private String climate;

	@Column(name = "terrain")
	@NotEmpty
	private String terrain;

	@Column(name = "surface_water")
	@NotEmpty
	private String surfaceWater;

	@Column(name = "created")
	private String created;

	@Column(name = "edited")
	private String edited;

	@JsonIgnore
	@JsonIgnoreProperties(value = {"planet",  "handler", "hibernateLazyInitializer" }, allowSetters = true)
	@OneToMany(mappedBy = "planet", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<People> peoples = new HashSet<People>();

	@JsonIgnore
	@JsonIgnoreProperties(value = { "planets",  "handler", "hibernateLazyInitializer" }, allowSetters = true)
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "films_planets", joinColumns = {
			@JoinColumn(name = "codigo_planet", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "codigo_film", nullable = false, updatable = false) })
	private Set<Film> films = new HashSet<Film>();
	

	public Planet() {
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDiameter() {
		return diameter;
	}

	public void setDiameter(String diameter) {
		this.diameter = diameter;
	}

	public String getRotationPeriod() {
		return rotationPeriod;
	}

	public void setRotationPeriod(String rotationPeriod) {
		this.rotationPeriod = rotationPeriod;
	}

	public String getOrbitalPeriod() {
		return orbitalPeriod;
	}

	public void setOrbitalPeriod(String orbitalPeriod) {
		this.orbitalPeriod = orbitalPeriod;
	}

	public String getGravity() {
		return gravity;
	}

	public void setGravity(String gravity) {
		this.gravity = gravity;
	}

	public String getPopulation() {
		return population;
	}

	public void setPopulation(String population) {
		this.population = population;
	}

	public String getClimate() {
		return climate;
	}

	public void setClimate(String climate) {
		this.climate = climate;
	}

	public String getTerrain() {
		return terrain;
	}

	public void setTerrain(String terrain) {
		this.terrain = terrain;
	}

	public String getSurfaceWater() {
		return surfaceWater;
	}

	public void setSurfaceWater(String surfaceWater) {
		this.surfaceWater = surfaceWater;
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

	public Set<People> getPeoples() {
		return peoples;
	}

	public void setPeoples(Set<People> peoples) {
		this.peoples = peoples;
	}
	
	public Set<Film> getFilms() {
		return films;
	}

	public void setFilms(Set<Film> films) {
		this.films = films;
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
		Planet other = (Planet) obj;
		if (codigo == null) {
			if (other.codigo != null)
				return false;
		} else if (!codigo.equals(other.codigo))
			return false;
		return true;
	}

	
}
