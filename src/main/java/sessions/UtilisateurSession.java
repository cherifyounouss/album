package sessions;


import models.Utilisateur;

import javax.enterprise.context.SessionScoped;
import java.io.Serializable;

@SessionScoped
public class UtilisateurSession implements Serializable {

    private Utilisateur utilisateur;

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

}
