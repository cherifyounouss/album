<%--
  Created by IntelliJ IDEA.
  User: cherif
  Date: 13/02/2021
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page d'inscription</title>
</head>
<body>
    <h1>Inscription au réseau social d'album</h1>
    <form method="post" action="">
        <label for="prenom">Prenom</label>
        <input type="text" id="prenom" name="prenom"><br />
        <label for="nom">Nom</label>
        <input type="text" id="nom" name="nom"><br />
        <label for="email">Email</label>
        <input type="email" id="email" name="email"><br />
        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="motDePasse"><br />
        <input type="submit" value="Cr&eacute;er">
    </form>
</body>
</html>
