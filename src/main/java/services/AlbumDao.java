package services;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
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
	
	 @EJB
	 UtilisateurDAO userDao;
	
	/*This method will add a new album to the database*/
	 
	public Album add(String name, boolean restricted, List<Utilisateur> users ) {
		
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
		
		return album;
		
	}
	
	
	public Album update(int id, String name, boolean restricted, List<Utilisateur> users) {/*This method will update an entry of album in the database*/
			
		long time = System.currentTimeMillis();
		
		Date today = new Date(time);
		
		Album album = getAlbumById(id);
		
		album.setNom(name);
					
		album.setDateModification(today);
		
		album.setEstPublic(restricted);
		
		album.setPermissions(users);
		
		manager.merge(album);
		
		return album;
		
	}
	
	public void remove(int id) {/*This method will remove and entry of album from the database*/
		
		Album album = manager.find(Album.class, id);
		
		manager.remove(album);
		
	}
	
	public Album getAlbumById(int id){ /*This method returns an album based on its id*/
				
		return manager.find(Album.class, id);
		
	}
	
	public List<Album> getAlbumsOf(int userId){ /*This method returns all the albums owned by a user*/
		
		Utilisateur concernedUser = userDao.recupererUnUtilisateur(userId);
		
		List<Album> albums =  manager.createQuery("SELECT a FROM Album a WHERE a.proprietaire = :id", Album.class)
    		
							.setParameter("id", concernedUser).getResultList();
		
		return albums;
		
	}
	
	public List<Album> getAuthorizedAlbumsOf(int userId){/*This method returns all the albums a user is authorized to visualize*/
		
		List<Album> allowedToVisualize = new ArrayList<Album>();
		
		List<Album> systemAlbums = manager.createQuery("SELECT a FROM Album a", Album.class).getResultList();
		
		for (Album album : systemAlbums) {
			
			List<Utilisateur> allowedUsers = album.getPermissions();
			
			for (Utilisateur user : allowedUsers) {
				
				if(user.getId() == userId)

					allowedToVisualize.add(album);
				
			}
			
		}
		
		return allowedToVisualize;
		
	}

	
}