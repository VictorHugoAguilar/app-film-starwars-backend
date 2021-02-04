package com.vhaa.starwars.backend.models.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "films")
@Table(name = "films")
public class Film implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name = "kaugen", strategy = "increment")
	@GeneratedValue(generator = "kaugen")
	@Column(name = "codigo", unique = true, nullable = false)
	private Long codigo;

	@Column(name = "title")
	@NotEmpty
	@Size(min = 5, max = 100 )
	private String title;

	@Column(name = "episode_id")
	@NotNull
	private Long episodeId;

	@Column(name = "opening_crawl")
	@NotEmpty
	private String openingCrawl;

	@Column(name = "director")
	@NotEmpty
	private String director;

	@Column(name = "producer")
	@NotEmpty
	private String producer;

	@Column(name = "release_date")
	@NotEmpty(message = "tiene que declarar una fecha de lanzamiento")
	private String releaseDate;

	@Column(name = "created")
	private String created;

	@Column(name = "edited")
	private String edited;

	@JsonIgnoreProperties(value = { "films", "handler", "hibernateLazyInitializer" }, allowSetters = true)
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "films_planets", joinColumns = {
			@JoinColumn(name = "codigo_film", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "codigo_planet", nullable = false, updatable = false) })
	private Set<Planet> planets = new HashSet<Planet>();
	
	@JsonIgnoreProperties(value = { "films", "handler", "hibernateLazyInitializer" }, allowSetters = true)
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "films_people", joinColumns = {
			@JoinColumn(name = "codigo_film", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "codigo_people", nullable = false, updatable = false) })
	private Set<People> peoples = new HashSet<People>();

	public Film() {
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getEpisodeId() {
		return episodeId;
	}

	public void setEpisodeId(Long episodeId) {
		this.episodeId = episodeId;
	}

	public String getOpeningCrawl() {
		return openingCrawl;
	}

	public void setOpeningCrawl(String openingCrawl) {
		this.openingCrawl = openingCrawl;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
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

	public Set<Planet> getPlanets() {
		return planets;
	}

	public void setPlanets(Set<Planet> planets) {
		this.planets = planets;
	}
	
	public void addPlanet(Planet planet) {
		this.planets.add(planet);
	}

	public void removePlanet(Planet planet) {
		this.planets.remove(planet);
	}

	public Set<People> getPeoples() {
		return peoples;
	}

	public void setPeoples(Set<People> peoples) {
		this.peoples = peoples;
	}
	
	public void addPeople(People people) {
		this.peoples.add(people);
	}

	public void removePeople(People people) {
		this.peoples.remove(people);
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
		Film other = (Film) obj;
		if (codigo == null) {
			if (other.codigo != null)
				return false;
		} else if (!codigo.equals(other.codigo))
			return false;
		return true;
	}

}

