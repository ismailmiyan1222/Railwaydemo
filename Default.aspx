<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery/jquery-1.11.2.js"></script>
    <link href="jquery/jquery-ui.css" rel="stylesheet" />
    <script src="jquery/jquery-ui.js"></script>
 <script type="text/javascript">
     $(document).ready(function () {
         $('#TextBox2').datepicker({
             numberOfMonths: 2,
             minDate: new Date(2018, 2, 2),
             maxDate: new Date(2018, 2, 4),
             dateFormat: 'dd/mm/yy'
         });
     });
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    
        passanger<asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox1"></asp:TextBox>
        <br />
        <br />
        date<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        train<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <br />
        class<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height: 26px" Text="Button" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server"></asp:Label>
    
    
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
          <asp:TextBox ID="TextBox5" runat="server" Class="abcd"></asp:TextBox>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css"
    rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(".abcd").autocomplete(
            {
                source: 'stationHandler.ashx'
            }
            );
        </script>
    <script type="text/javascript">
        $(".TextBox1").autocomplete(
            {
                source: 'stationHandler.ashx'
            }
            );
        </script>
    
    </div>
    </form>
</body>
</html>
