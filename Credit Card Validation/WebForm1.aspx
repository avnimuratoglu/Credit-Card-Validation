<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Homework1_1.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        #form1 {
            width: 521px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            background: #fff;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"], select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .half-input-container, .exp-date-container {
            display: flex;
            justify-content: space-between;
        }
        .half-input-container .form-group,
        .exp-date-container .form-group {
            flex: 1;
            margin-right: 10px;
        }
        .half-input-container .form-group:last-child,
        .exp-date-container .form-group:last-child {
            margin-right: 0;
        }
        .exp-date-container .form-group {
            flex-basis: 30%;
        }
        .card-images img {
            margin-right: 10px;
            width: 40px;
            height: auto;
        }
        .button-container {
            text-align: center;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .card-images {
            margin-left: 280px;
            width: 233px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="half-input-container">
            <div class="form-group">
                <label for="txtOwner">Owner</label>
                <asp:TextBox ID="txtOwner" runat="server" />
            </div>
            <div class="form-group">
                <label for="cardNumber">CVV</label>
                <asp:TextBox ID="txtCVV" runat="server" TextMode="Password" MaxLength="5" Height="30px" BorderColor="#DDDDDD" BorderStyle="Solid" OnTextChanged="txtCVV_TextChanged" />
            </div>
        </div>
        <div class="form-group">
            <label for="cardNumber">Card Number</label>
            <asp:TextBox ID="cardNumber" runat="server" OnTextChanged="cardNumber_TextChanged" MaxLength="19" />
        </div>
        <div class="half-input-container">
            <div class="exp-date-container">
                <div class="form-group">
                    <label for="expMonth">Month</label>
                    <asp:DropDownList ID="expMonth" runat="server">
                        <asp:ListItem Value=" "> </asp:ListItem>
                        <asp:ListItem Value="01">01</asp:ListItem>
                        <asp:ListItem Value="02">02</asp:ListItem>
                        <asp:ListItem Value="03">03</asp:ListItem>
                        <asp:ListItem Value="04">04</asp:ListItem>
                        <asp:ListItem Value="05">05</asp:ListItem>
                        <asp:ListItem Value="06">06</asp:ListItem>
                        <asp:ListItem Value="07">07</asp:ListItem>
                        <asp:ListItem Value="08">08</asp:ListItem>
                        <asp:ListItem Value="09">09</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="expYear">Year</label>
                    <asp:DropDownList ID="expYear" runat="server">
                        <asp:ListItem Value=" "> </asp:ListItem>
                        <asp:ListItem Value="2020">2020</asp:ListItem>
                        <asp:ListItem Value="2021">2021</asp:ListItem>
                        <asp:ListItem Value="2022">2022</asp:ListItem>
                        <asp:ListItem Value="2023">2023</asp:ListItem>
                        <asp:ListItem Value="2024">2024</asp:ListItem>
                        <asp:ListItem Value="2025">2025</asp:ListItem>
                        <asp:ListItem Value="2026">2026</asp:ListItem>
                        <asp:ListItem Value="2027">2027</asp:ListItem>
                        <asp:ListItem Value="2028">2028</asp:ListItem>
                        <asp:ListItem Value="2029">2029</asp:ListItem>
                        <asp:ListItem Value="2030">2030</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="card-images">
                <asp:Image ID="VisaCardImage" runat="server" ImageUrl="~/cardnameimages/visa.jpg" AlternateText="Visa" BorderColor="White" BorderStyle="Solid" />
                <asp:Image ID="MasterCardImage" runat="server" ImageUrl="~/cardnameimages/master.jpg" AlternateText="MasterCard" BorderColor="White" BorderStyle="Solid" />
                <asp:Image ID="AmexCardImage" runat="server" ImageUrl="~/cardnameimages/amex.jpg" AlternateText="American Express" BorderColor="White" BorderStyle="Solid" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="button-container">
            <asp:Button ID="SubmitButton" runat="server" Text="Confirm" OnClick="SubmitButton_Click" />
            <br />
            <br />
                <asp:Label ID="lbl_error" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>