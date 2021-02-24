package servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Album;
import services.AlbumDao;
import services.ImageDao;
import services.UtilisateurDAO;

@WebServlet({""})
public class Home extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private static final String HOME_VIEW= "/WEB-INF/images/list.jsp";
	
	@EJB
	UtilisateurDAO userDao;
	
	@EJB
	AlbumDao albumDao;
	
	@EJB
	ImageDao imageDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Album> publicAlbums = albumDao.getAllPublicAlbums();
		
		request.setAttribute("publicAlbums", publicAlbums);
		
		getServletContext().getRequestDispatcher(HOME_VIEW).forward(request, response);
		
		
	}

}
