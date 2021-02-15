<%--
  Created by IntelliJ IDEA.
  User: cherif
  Date: 14/02/2021
  Time: 01:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page de connexion</title>
</head>
<body>
    <h1>Connexion au réseau social d'album</h1>
    <form method="post" action="">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${empty email ? '' : email}"><br />
        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="motDePasse"><br />
        <input type="submit" value="Se connecter">
    </form>
    <p>
        ${error}
    </p>
</body>
</html>
