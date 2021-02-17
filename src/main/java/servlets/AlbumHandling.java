package servlets;

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

import models.Utilisateur;
import services.AlbumDao;
import services.UtilisateurDAO;
import sessions.UtilisateurSession;


@WebServlet({"/albums","/albums/add","/albums/edit","/albums/delete"})
public class AlbumHandling extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final String ADD_ALBUM_FORM = "/WEB-INF/albums/add.jsp";

	private static final String EDIT_ALBUM_FORM = "/WEB-INF/albums/edit.jsp";

	private static final String LIST_ALBUM= "/WEB-INF/albums/list.jsp";
	
	@EJB
	UtilisateurDAO userDao;
	
	@EJB
	AlbumDao albumDao;
	
	@Inject
	UtilisateurSession session;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getServletPath();
		
		switch (path) {
		
			case "/albums":
			
				getServletContext().getRequestDispatcher(LIST_ALBUM).forward(request, response);
				
				break;

			case "/albums/add":
					
				List<Utilisateur> users = userDao.recupererTousLesUtilisateurs();
								
				request.setAttribute("users", users);
				
				getServletContext().getRequestDispatcher(ADD_ALBUM_FORM).forward(request, response);
				
				break;
			
			case "/albums/edit":

				getServletContext().getRequestDispatcher(EDIT_ALBUM_FORM).forward(request, response);
				
				break;
				
			case "/albums/delete":
				
				break;
		default:
			
			break;
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = request.getServletPath();
		
		switch (path) {
		
			case "/albums":
				
				break;
	
			case "/albums/add":
				
				String albumName = request.getParameter("album_name");
				
				System.out.println(request.getParameter("is_private"));
				
				System.err.println(request.getParameter("is_private"));
				
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
				
				break;
				
			case "/albums/edit":
				
				break;
				
			case "/albums/delete":
				
				break;
				
			default:
				
				break;
		}
		
	}

}
