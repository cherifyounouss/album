package sessions;


import models.Utilisateur;

import javax.enterprise.context.SessionScoped;
import java.io.Serializable;

@SessionScoped
public class UtilisateurSession implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Utilisateur utilisateur;

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

}
