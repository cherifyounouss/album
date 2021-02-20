package servlets;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ij.IJ;
import ij.ImagePlus;
import models.Album;
import models.Tag;
import services.AlbumDao;
import services.ImageDao;
import services.TagDao;
import sessions.UtilisateurSession;

@WebServlet({"/images","/images/add","/images/edit","/images/delete"})
@MultipartConfig(location ="G:\\DIC3\\JEE\\Projet\\Code\\src\\main\\webapp\\storage\\images")

public class ImageHandling extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private static final String ADD_IMAGE_FORM = "/WEB-INF/images/add.jsp";

	private static final String EDIT_IMAGE_FORM = "/WEB-INF/images/edit.jsp";

	private static final String LIST_IMAGES= "/WEB-INF/images/list.jsp";

	private static final String UPLOAD_DIR = "G:\\DIC3\\JEE\\Projet\\Code\\src\\main\\webapp\\storage\\images\\";
		
	private static final String IJ_UPLOAD_DIR = "G:/DIC3/JEE/Projet/Code/src/main/webapp/storage/images/";
	
	@Inject
	UtilisateurSession session;
	
	@EJB
	AlbumDao albumDao;
	
	@EJB
	TagDao tagDao;
	
	@EJB
	ImageDao imageDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getServletPath();
		
		request.setAttribute("connectedUserFullName", session.getUtilisateur().getNom() + " " + session.getUtilisateur().getPrenom());
		
		request.setAttribute("pageMainBrand", "ADD IMAGE TO MY ALBUM");
		
		switch (path) {
		
			case "/images":
				
				getServletContext().getRequestDispatcher(LIST_IMAGES).forward(request, response);
				
				break;
	
			case "/images/add":
			
				getServletContext().getRequestDispatcher(ADD_IMAGE_FORM).forward(request, response);
				
				break;

			case "/images/edit":
				
				getServletContext().getRequestDispatcher(EDIT_IMAGE_FORM).forward(request, response);
				
				break;
								
			default:
		
				break;
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getServletPath();
		
		switch(path) {
	
			case "/images/add":
				
				addImage(request);
				
			try {
				
				Thread.sleep(2000);
				
			} catch (InterruptedException e) {}
				
				response.sendRedirect("/album/albums");
				
				break;
		
			case "/images/edit":
				
				break;
				
			case "/images/delete":
				
				break;
				
			default:
		
				break;
		
		}		
		
	}
	

	// UTILS
	
    /*
     * Getting file name through request
     */
    private String getFileName( Part part ) {
        
    	for ( String content : part.getHeader( "content-disposition" ).split( ";" ) ) {
        
    		if ( content.trim().startsWith( "filename" ) )
            
    			return content.substring( content.indexOf( "=" ) + 2, content.length() - 1 );
        }
        
    	return "";
    }

    
    // LOGIC
    
    private void addImage(HttpServletRequest request) {
    
    	// pick attributes
		
		String description = request.getParameter("description");
		
		String tags[] = request.getParameter("tags").split(" ");
		
		//Creating tags
		
		List<Tag> tagList = new ArrayList<Tag>();
		
		for (String tag : tags) {
			
			tagList.add(tagDao.addOrGet(tag));
			
		}
		
		String imageName = request.getParameter("picture");
		
		System.out.println("im name : " + imageName);
		
		int albumId = Integer.parseInt(request.getParameter("album_id"));
	
		Album album = albumDao.getAlbumById(albumId);
		
		//Handling image to put it a folder
		
		 File fileSaveDir = new File(UPLOAD_DIR + File.separator + album.getNom());
	     
		 if (!fileSaveDir.exists()) {
	     
			 fileSaveDir.mkdirs();
	        
		 }
		
		try {
			
			Part part = request.getPart("picture");
			
			String fileName = getFileName(part);
		    
			System.out.println("fn : " + fileName);
			
			imageName = fileName;
			
			fileName = album.getNom() + File.separator + fileName;
			
			part.write(fileName);
						
		} catch (IOException e) {
			
		} catch (ServletException e) {
			
		}
		
		String path = IJ_UPLOAD_DIR + album.getNom() +'/' + imageName;
		
		System.out.println("path : " + path);
		
		ImagePlus image = IJ.openImage(path);
		
		int width = image.getWidth();
		
		int height = image.getHeight();
		
		imageDao.add(imageName, description, width, height, tagList, album);
    }
    
}

