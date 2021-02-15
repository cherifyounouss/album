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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "albums")
public class Album{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String nom;
	
	private Date dateCreation;
	
	private Date dateModification;
	
	private boolean estPublic;
	
	@ManyToOne
	@JoinColumn(name = "proprietaire")
	private Utilisateur proprietaire;
	
	@OneToMany(mappedBy = "album")
	private List<Image> images;

	@ManyToMany
	@JoinTable(name = "autorisations",
	
	joinColumns = @JoinColumn(name = "album" ),
	
	inverseJoinColumns = @JoinColumn(name = "utilisateur"))
	private List<Utilisateur> permissions;
	
	/*CONSTRUCTOR*/
	
	public Album() {}
	
	/*GETTERS*/
	
	public Integer getId() {
		return id;
	}

	public String getNom() {
		return nom;
	}

	public Date getDateCreation() {
		return dateCreation;
	}

	public Date getDateModification() {
		return dateModification;
	}

	public boolean estPublic() {
		return estPublic;
	}

	public Utilisateur getProprietaire() {
		return proprietaire;
	}

	public List<Image> getImages() {
		return images;
	}

	/*SETTERS*/
	
	public void setNom(String nom) {
		this.nom = nom;
	}

	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}

	public void setDateModification(Date dateModification) {
		this.dateModification = dateModification;
	}

	public void setEstPublic(boolean estPublic) {
		this.estPublic = estPublic;
	}

	public void setProprietaire(Utilisateur proprietaire) {
		this.proprietaire = proprietaire;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

}