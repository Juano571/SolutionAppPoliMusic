<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
</head>
<body>
    <%
for each x in Request.ServerVariables
  response.write(x & "" & "<br>")
next
%>
</body>
</html>