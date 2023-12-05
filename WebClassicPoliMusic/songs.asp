<%@ Language=VBScript %>
 <!DOCTYPE html>
<html>
    <body>
        <%
            If Session("username") = "" Then
            Response.Write("Please, login first. <a href='login.asp'>Click here.</a>")
            Response.End()
            End If
            %>
        Welcome <% Session("username") &nbsp %>
           <% Response.Write("<a href='login.asp'>Logout.</a>")%>
        <h1>

<%
Dim conn, rs
Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")

' Cadena de conexión a la base de datos
Dim connectionString
connectionString = "Provider=SQLOLEDB;Data Source=localhost;Initial Catalog=BDD_PoliMusic;User ID=usr_polimusic;Password=usr_polimusic;"

' Abrir la conexión
conn.Open connectionString

' Consulta SQL
Dim strSQL
strSQL = "SELECT ID_SONG, SONG_NAME, SONG_PATH, PLAYS FROM TBL_SONG"

' Abrir el recordset
rs.Open strSQL, conn

' Mostrar los resultados en una tabla HTML
Response.Write("<html>")
Response.Write("<head><title>Lista de Canciones</title></head>")
Response.Write("<body>")
Response.Write("<h2>Lista de Canciones</h2>")
Response.Write("<table border='1'>")
Response.Write("<tr><th>ID</th><th>Nombre de la Cancion</th><th>Path Cancion</th><th>Plays</th></tr>")

' Recorrer los registros y mostrarlos en la tabla
Do While Not rs.EOF
    Response.Write("<tr>")
    Response.Write("<td>" & rs("ID_SONG") & "</td>")
    Response.Write("<td>" & rs("SONG_NAME") & "</td>")
    Response.Write("<td>" & rs("SONG_PATH") & "</td>")
    Response.Write("<td>" & rs("PLAYS") & "</td>")
    Response.Write("</tr>")
    rs.MoveNext
Loop

Response.Write("</table>")
Response.Write("</body>")
Response.Write("</html>")

' Cerrar recordset y conexión
rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing
%>

        </h1>
    </body>
</html>