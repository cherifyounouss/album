package servlets;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Album;
import models.Utilisateur;
import services.AlbumDao;
import services.ImageDao;
import services.UtilisateurDAO;
import sessions.UtilisateurSession;


@WebServlet({"/albums","/albums/add","/albums/edit","/albums/delete"})
public class AlbumHandling extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final String ADD_ALBUM_FORM = "/WEB-INF/albums/add.jsp";

	private static final String EDIT_ALBUM_FORM = "/WEB-INF/albums/edit.jsp";

	private static final String LIST_ALBUM= "/WEB-INF/albums/list.jsp";
	
	private static final String UPLOAD_DIR = "G:\\DIC3\\JEE\\Projet\\Code\\src\\main\\webapp\\storage\\images\\";
	
	@EJB
	UtilisateurDAO userDao;
	
	@EJB
	AlbumDao albumDao;
	
	@EJB
	ImageDao imageDao;
	
	@Inject
	UtilisateurSession session;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("connectedUserFullName", session.getUtilisateur().getNom() + " " + session.getUtilisateur().getPrenom());
		
		String path = request.getServletPath();
		
		//Init
		
		int userId = session.getUtilisateur().getId();
		
		// Get albums
		
		List<Album> myAlbums = albumDao.getAlbumsOf(userId);
		
		List<Album> authorizedAlbums = albumDao.getAuthorizedAlbumsOf(userId);
		
		for (Album item : authorizedAlbums) {
			System.out.println("\n " + item.getNom());
		}
		
		//Get images
		
		for (Album album : myAlbums) {
			
			album.setImages(imageDao.getImagesOf(album.getId()));
		
		}

		//Setting variables
		
		request.setAttribute("myAlbums", myAlbums);

		request.setAttribute("authorizedAlbums", authorizedAlbums);
		
		switch (path) {
		
			case "/albums":
				
				request.setAttribute("title", "Album list");
				
				request.setAttribute("pageMainBrand", "ALBUMS COLLECTION");
				
				getServletContext().getRequestDispatcher(LIST_ALBUM).forward(request, response);
				
				break;

			case "/albums/add":
					
				List<Utilisateur> users = userDao.recupererTousLesUtilisateurs();
				
				request.setAttribute("title", "Album creation");
				
				request.setAttribute("users", users);
				
				request.setAttribute("pageMainBrand", "ADD A NEW ALBUM TO MY COLLECTION");
				
				getServletContext().getRequestDispatcher(ADD_ALBUM_FORM).forward(request, response);
				
				break;
			
			case "/albums/edit":

				int id = Integer.parseInt(request.getParameter("id"));
				
				Album album = albumDao.getAlbumById(id);
				
				//Rebuild id string
				
				String authorizedUsersId = "";
				
				for (Utilisateur user : album.getPermissions()) {
					
					authorizedUsersId = user.getId() + " " + authorizedUsersId;
					
				}
				
				request.setAttribute("album", album);
				
				request.setAttribute("authorized_users_id", authorizedUsersId);
				
				request.setAttribute("pageMainBrand", "EDITING MY ALBUM {" + album.getNom() + "}");
				
				getServletContext().getRequestDispatcher(EDIT_ALBUM_FORM).forward(request, response);
				
				break;

		default:
			
			break;
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = request.getServletPath();
		
		switch (path) {
	
			case "/albums/add":
				
				addAlbum(request);
				
				response.sendRedirect("/album/albums");
								
				break;
				
			case "/albums/edit":
				
				editAlbum(request);
				
				try {
					
					Thread.sleep(2000);
					
				} catch (InterruptedException e) {}
				
				response.sendRedirect("/album/albums");
				
				break;
				
			case "/albums/delete":
				
				int albumId = Integer.parseInt(request.getParameter("id"));
				
				albumDao.remove(albumId);
				
				break;
				
			default:
				
				break;
		}
		
	}

	
	// Logic
	
	private void addAlbum (HttpServletRequest request) {
		
		String albumName = request.getParameter("album_name");
		
		boolean open = "on".equals(request.getParameter("is_private")) ? false : true;
		
		List<Utilisateur> authorizedUsers = null;
		
		if(!open) {
		
			authorizedUsers	= new ArrayList<Utilisateur>();
			
			String usersId [] = request.getParameter("authorized_users").split(" ");
			
			for (int i = 0 ; i < usersId.length ; i++) {
				
				try {
					
					int userId = Integer.parseInt(usersId[i]);
					
					Utilisateur user = userDao.recupererUnUtilisateur(userId);
					
					authorizedUsers.add(user);
					
				} catch (Exception e) {}		
			}
			
		}
		
		albumDao.add(albumName, open,authorizedUsers);
		
	}

	
	private void editAlbum(HttpServletRequest request) {
		
		String albumName = request.getParameter("album_name");
	
		boolean open = "on".equals(request.getParameter("is_private")) ? false : true;

		int id = Integer.parseInt(request.getParameter("albumId"));
		
		List<Utilisateur> authorizedUsers = null;
		
		if(!open) {
		
			authorizedUsers	= new ArrayList<Utilisateur>();
			
			String usersId [] = request.getParameter("authorized_users").split(" ");
			
			for (int i = 0 ; i < usersId.length ; i++) {
				
				try {
					
					int userId = Integer.parseInt(usersId[i]);
					
					Utilisateur user = userDao.recupererUnUtilisateur(userId);
					
					authorizedUsers.add(user);
					
				} catch (Exception e) {}		
			}
			
		}
		
		//change directory name
		
		Album album = albumDao.getAlbumById(id);
		
		if(!album.getNom().equalsIgnoreCase(albumName)) {
		
			File sourceDirectory = new File(UPLOAD_DIR + File.separator + album.getNom());

			File destDirectory= new File(UPLOAD_DIR + File.separator + albumName);
			
			sourceDirectory.renameTo(destDirectory);
			
		}
				
		albumDao.update(id, albumName, open,authorizedUsers);
		
	}
	
}
