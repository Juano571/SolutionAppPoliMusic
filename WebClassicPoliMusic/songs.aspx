<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="songs.aspx.cs" Inherits="WebClassicPoliMusic.songs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Music Player</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1a1a1a;
            color: #ffffff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #container {
            width: 60%;
            background-color: #2b2b2b;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            border-radius: 12px;
            text-align: center;
        }

        h2 {
            color: #ffffff;
            font-weight: 700;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #1a1a1a;
            padding: 12px;
            text-align: left;
            border-radius: 8px;
        }

        th {
            background-color: #1a1a1a;
            color: #ffffff;
        }

        #audioPanel {
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #audioPlayer {
            width: 90%;
            margin-top: 20px;
            background-color: #2b2b2b;
            color: #ffffff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #audioPlayer::-webkit-media-controls-panel {
            background-color: #2b2b2b;
        }

        #audioPlayer::-webkit-media-controls-play-button {
            color: #ffffff;
        }

        #audioPlayer::-webkit-media-controls-volume-slider-container {
            display: none;
        }

        .play-btn {
            background-color: #e67e22; /* Naranja */
            color: #ffffff;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s;
        }

        .play-btn:hover {
            background-color: #d35400; /* Tonos más oscuros de naranja */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h2>Music Player</h2>
            <asp:Label ID="lblUsername" runat="server" EnableViewState="false"></asp:Label>

            <asp:GridView ID="GridViewSongs" runat="server" AutoGenerateColumns="False" EmptyDataText="No songs found" OnSelectedIndexChanged="GridViewSongs_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="SONG_NAME" HeaderText="Song Name" SortExpression="SONG_NAME" />
                    <asp:BoundField DataField="SONG_PATH" HeaderText="Song Path" SortExpression="SONG_PATH" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Play" ControlStyle-CssClass="play-btn" />
                </Columns>
                <SelectedRowStyle BackColor="#2b2b2b" Font-Bold="True" ForeColor="#ffffff" />
            </asp:GridView>

            <div id="audioPanel" runat="server" visible="false">
                <audio id="audioPlayer" runat="server" controls>
                    Your browser does not support the audio element.
                </audio>
            </div>
        </div>
    </form>
</body>
</html>
