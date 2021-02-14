package services;

import exceptions.UserAlreadyExistException;
import models.Utilisateur;
import org.mindrot.jbcrypt.BCrypt;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Stateless
public class UtilisateurDAO {
    @PersistenceContext(unitName = "albumManagement")
    protected EntityManager em;

    public Utilisateur creerUtilisateur(String nom, String prenom, String email, String motDePasse, boolean estAdmin) throws UserAlreadyExistException{
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setNom(nom);
        utilisateur.setPrenom(prenom);
        if (recupererUnUtilisateur(email) != null)
            throw new UserAlreadyExistException();
        utilisateur.setEmail(email);
        utilisateur.setMotDePasse(BCrypt.hashpw(motDePasse, BCrypt.gensalt()));
        utilisateur.setEstAdmin(estAdmin);
        getEntityManager().persist(utilisateur);
        return utilisateur;
    }



    public Utilisateur recupererUnUtilisateur(int id) {
        return getEntityManager().find(Utilisateur.class, id);
    }

    public Utilisateur recupererUnUtilisateur(String email) {
        List<Utilisateur> utilisateurs = recupererTousLesUtilisateurs();
        Utilisateur utilisateur = null;
        if (utilisateurs != null) {
            for (Utilisateur u : utilisateurs) {
                if (u.getEmail().equals(email)) {
                    utilisateur = u;
                    break;
                }
            }
        }
        return utilisateur;
    }

    public Utilisateur supprimerUtilisateur(int id) {
        Utilisateur utilisateurSupprime = getEntityManager().find(Utilisateur.class, id);
        if (utilisateurSupprime != null)
            getEntityManager().remove(utilisateurSupprime);
        return utilisateurSupprime;
    }

    public List<Utilisateur> recupererTousLesUtilisateurs() {
        TypedQuery<Utilisateur> typedQuery = getEntityManager().createQuery("SELECT u FROM Utilisateur u", Utilisateur.class);
        return typedQuery.getResultList();
    }

    EntityManager getEntityManager() {
        return  em;
    }
}