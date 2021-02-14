package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tags")
public class Tag {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String libelle;

	@ManyToMany(mappedBy = "tags")
	private List<Image> images;

	/*CONSTRUCTOR*/
	
	public Tag() {}

	/*GETTERS*/
	
	public Integer getId() {
		return id;
	}

	public String getLibelle() {
		return libelle;
	}

	public List<Image> getImages() {
		return images;
	}

	/*SETTERS*/
	
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}
	
}
