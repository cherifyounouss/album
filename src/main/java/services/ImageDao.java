package services;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import models.Album;
import models.Image;
import models.Tag;

@Stateless
public class ImageDao{
	
	private static final String PUN = "albumManagement";
	
	/*Getting entity manager*/
	@PersistenceContext(name = PUN)
	protected EntityManager manager;
	
	public Image add(String title, String description, int width , int height, List<Tag> tags, Album album) {
		
		Image image = new Image();
		
		image.setTitre(title);
		
		image.setDescription(description);
		
		image.setAlbum(album);
		
		image.setHauteur(height);
		
		image.setLargeur(width);
		
		image.setTags(tags);
		
		manager.persist(image);
		
		return image;
		
	}
	
}