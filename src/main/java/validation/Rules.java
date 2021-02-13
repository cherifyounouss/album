package validation;

public enum Rules {

    EMAIL_TYPE("L'email fournit est invalide"),
    ALPHA("Chaine doit contenir uniquement des caractères alphabétiques"),
    REQUIRED("Ce champ est requis"),
    NUMERIC("Ce champ doit être numérique"),
    DATE("La date fournit est invalide");

    public final String message;

    private Rules(String message) {
        this.message = message;
    }
}
