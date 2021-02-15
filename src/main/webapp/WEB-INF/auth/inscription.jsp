<%--
  Created by IntelliJ IDEA.
  User: cherif
  Date: 13/02/2021
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Page d'inscription</title>
</head>
<body>
    <h1>Inscription au réseau social d'album</h1>
    <form method="post" action="">
        <label for="prenom">Prenom</label>
        <input type="text" id="prenom" name="prenom" value="${empty prenom ? '' : prenom}"><br />
        <label for="nom">Nom</label>
        <input type="text" id="nom" name="nom" value="${empty nom ? '' : nom}"><br />
        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${empty email ? '' : email}"><br />
        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="motDePasse"><br />
        <input type="submit" value="Cr&eacute;er">
    </form>
    <p>
        <c:forEach items="${errors}" var="entry">
            <em>${entry.key}</em>
            <c:forEach items="${entry.value}" var="error">
                ${error}<br />
            </c:forEach>
            <br />
        </c:forEach>
    </p>
    <p>${exception}</p>
</body>
</html>
