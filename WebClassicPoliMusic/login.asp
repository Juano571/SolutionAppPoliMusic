<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebClassicPoliMusic.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login Page</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #2c3e50;
            color: #ecf0f1;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            width: 300px;
            background-color: #34495e;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }

        h2 {
            color: #ecf0f1;
            font-weight: 700;
            margin-bottom: 20px;
        }

        #lblMessage {
            color: #e67e22; /* Naranja */
        }

        #txtUsername,
        #txtPassword {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #2c3e50;
            border-radius: 4px;
            background-color: #ecf0f1;
            color: #2c3e50;
        }

        #btnLogin {
            background-color: #e67e22; /* Naranja */
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        #btnLogin:hover {
            background-color: #d35400; /* Tonos más oscuros de naranja */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Login</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="#e67e22" EnableViewState="false"></asp:Label>
            <br />
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" Required="true"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" Required="true"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
