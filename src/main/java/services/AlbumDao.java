package services;

import java.sql.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import models.Album;
import models.Utilisateur;
import sessions.UtilisateurSession;

@Stateless
public class AlbumDao{

	private static final String PUN = "albumManagement";
	
	/*Getting entity manager*/
		
	@PersistenceContext(name = PUN)
	protected EntityManager manager;

	/*Getting user from session*/
	 @Inject
	 UtilisateurSession userSession;
	
	 /*Add album method*/
	 
	public void add(String name, boolean restricted, List<Utilisateur> users ) {
		
		Utilisateur connectedUser = userSession.getUtilisateur();
		
		Utilisateur owner = manager.find(Utilisateur.class, connectedUser.getId()); 	
		
		long time = System.currentTimeMillis();
		
		Date today = new Date(time);
		
		Album album = new Album();
		
		album.setNom(name);
			
		album.setDateCreation(today);
		
		album.setDateModification(today);
		
		album.setEstPublic(restricted);
		
		album.setProprietaire(owner);
		
		album.setPermissions(users);
		
		manager.persist(album);
		
	}
	
	
}