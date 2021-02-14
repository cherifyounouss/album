package servlets.auth;

import models.Utilisateur;
import services.UtilisateurDAO;
import sessions.UtilisateurSession;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/connexion")
public class Connexion extends HttpServlet {

    private static final String VUE_CONNEXION = "/WEB-INF/auth/connexion.jsp";

    @EJB
    UtilisateurDAO service;

    @Inject
    UtilisateurSession sessionUtilisateur;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(VUE_CONNEXION).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String motDePasse = req.getParameter("motDePasse");

        Utilisateur utilisateur = service.authentifier(email, motDePasse);
        if (utilisateur == null) {
            req.setAttribute("error","Login ou mot de passe incorrect");
            req.getRequestDispatcher(VUE_CONNEXION).forward(req, resp);
        }
        else {
            resp.getWriter().append("Bienvenue à l'accueil");
            sessionUtilisateur.setUtilisateur(utilisateur);
            return;
        }
    }
}
