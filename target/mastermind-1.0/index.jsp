<%--
  Created by IntelliJ IDEA.
  User: sgalsant
  Date: 5/12/20
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>mastermind</title>
</head>
<body>
    <h1>Super mastermind Java</h1>

    <form action="NewGameServlet" method="post">
        <label for="long">Introduce la longitud del codigo:</label>
        <input type="number" name="longitud" id="long" >
        <br>
        <label for="max">Introduce el numero maximo de intentos: </label>
        <input type="number" name="maxAttemp" id="max">
        <br>
        <input type="submit" value="Empezar">
    </form>


    <!--<button onClick="window.location='NewGameServlet'">iniciar</button>-->

</body>
</html>
