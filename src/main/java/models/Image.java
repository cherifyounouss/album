package models;

import java.sql.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "images")
public class Image {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String titre;

	private String description;
	
	private int hauteur;

	private int largeur;
	
	private Date dateCreation;
	
	@ManyToOne
	@JoinColumn(name = "album")
	private Album album;

	@ManyToMany
	@JoinTable(name = "associationstags",
			
		joinColumns = @JoinColumn(name = "image" ),
		
		inverseJoinColumns = @JoinColumn(name = "tag")
	)
	private List<Tag> tags;

	/*CONSTRUCTOR*/
	
	public Image() {}
	
	/*GETTERS*/
	
	public Integer getId() {
		return id;
	}

	public String getTitre() {
		return titre;
	}

	public String getDescription() {
		return description;
	}

	public int getHauteur() {
		return hauteur;
	}

	public int getLargeur() {
		return largeur;
	}

	public Date getDateCreation() {
		return dateCreation;
	}

	public Album getAlbum() {
		return album;
	}

	public List<Tag> getTags() {
		return tags;
	}

	/*SETTERS*/
	
	public void setTitre(String titre) {
		this.titre = titre;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setHauteur(int hauteur) {
		this.hauteur = hauteur;
	}

	public void setLargeur(int largeur) {
		this.largeur = largeur;
	}

	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

}
