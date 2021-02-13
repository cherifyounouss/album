package servlets.auth;

import services.UtilisateurDAO;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/utilisateurs/inscription")
public class Inscription extends HttpServlet {

    @EJB
    UtilisateurDAO service;

    private static final String VUE_INSCRIPTION = "/WEB-INF/auth/inscription.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(VUE_INSCRIPTION).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String prenom = req.getParameter("prenom");
        String nom = req.getParameter("nom");
        String email = req.getParameter("email");
        String motDePasse = req.getParameter("motDePasse");

        service.creerUtilisateur(nom, prenom, email, motDePasse, false);

        resp.getWriter().println("Ajouté avec succès");
        
    }
}
