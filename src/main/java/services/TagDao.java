package services;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import models.Tag;

@Stateless
public class TagDao{
	
	private static final String PUN = "albumManagement";
	
	/*Getting entity manager*/
		
	@PersistenceContext(name = PUN)
	protected EntityManager manager;
	
	public Tag addOrGet(String label) {	

		List<Tag> tags=  manager.createQuery("SELECT t FROM Tag t WHERE t.libelle = :label", Tag.class)
	    		
				.setParameter("label", label).getResultList();
	
		for (Tag tag : tags) {
			
			if(tag.getLibelle().equals(label))
			
				return tag;
				
		}
		
		Tag tag = new Tag();
		
		tag.setLibelle(label);
		
		manager.persist(tag);
		
		return tag;
	}
	
	
	public Tag getTagById(int id) {
		
		return null;
		
	}
	
}