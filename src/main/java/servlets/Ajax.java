package servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Utilisateur;
import services.UtilisateurDAO;

@WebServlet({"/fullnameresearch"})
public class Ajax extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@EJB
	UtilisateurDAO userDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String lastName = request.getParameter("lastName");
		
		String firstName = request.getParameter("firstName");
		
		List<Utilisateur> users = userDao.recupererUtilisateurParNomEtPrenom(lastName, firstName);
		
		String result = new Gson().toJson(users);
		
		response.setContentType("text/json");
		
	    response.setHeader("Cache-Control", "no-cache");
		
	    response.getWriter().write(result);

	}

}
