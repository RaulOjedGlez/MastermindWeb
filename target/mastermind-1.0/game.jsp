<%@ page import="game.Game" %>
<%@ page import="game.State" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <style type="text/css" >
        table{
            border: solid black 1px;
            border-collapse: collapse;
        }
        table:nth-child(odd) td{
            background-color: cornflowerblue;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
   <% Game game = (Game) request.getSession().getAttribute("game");%>




   <% if (game.getState()== State.PLAYING){%>

   <p>Introducir el codigo a probar </p>
   <p>Intentos maximos: <%= game.getMaxGuess()%></p>
   <p>Intentos actuales:<%= game.getGuessCount()%></p>


   <form action="GuessServlet" method="post">

       <% for (int i =0;i< game.getLengthCode();i++){%>
       <input type="number" name="codigo<%=i+1%>"
        <% if (game.getLastGuess()!= null){%>
               value="<%= game.getLastGuess().getCode(i)%>"
              <%}%>
       >
<%}%>
       <input type="submit" value="probar">
   </form>
<% }else {%>

   <p> Codigo secreto:
       <% for (int i =0;i< game.getLengthCode();i++){ %>
       <%= game.getCodeSecret().getCode(i) %>
       <% } %>

   </p>
   <br>

   <% if (game.getState() == State.WON){%>
    <p> Ehorabuena has decubierto el codigo secreto</p>
   <button onClick="window.location='index.jsp'">Jugar de nuevo</button>

   <% }else if (game.getState()==State.LOST){%>
   <p>No has conseguido descubrir el codigo</p>
   <button onClick="window.location='index.jsp'">Jugar de nuevo</button>
   <% }%>
   <%}%>
   <br>
    <h2>Tabla de intentos</h2>
<table>
    <tr>
        <th>Codigo</th>
        <th>Exactos</th>
        <th>Aproximados</th>
    </tr>
    <% for (int i = 0; i<game.getGuessCount();i++){%>

    <tr>
        <td>
            <% for (int j = 0; j<game.getLengthCode();j++){%>
            <%=game.getGuess(i).getCode(j)%>
            <% } %>

        </td>
        <td>
            <%= game.getGuess(i).getExactMatches()%>
        </td>
        <td>
            <%= game.getGuess(i).getNearMatches()%>
        </td>
    </tr>
    <% }%>
</table>
</body>
</html>
