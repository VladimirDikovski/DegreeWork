<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DiplomnaRabotaReal.Login_and__Register.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="StyleForm.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/LoginAndRegister/img/hd_desktop_blue.jpg" />
        </section>
   <center>


        <div class="sec2">
         <div class="container">
      
             <div class="content">
                  <h2>Вход</h2>
                    <asp:TextBox ID="txtUserName"  placeholder="Потребителско Име" runat ="server"  Width="300" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" 
                        ErrorMessage="User Name is requare"
                         ControlToValidate="txtUserName" ForeColor="Red" Display="Dynamic" >*</asp:RequiredFieldValidator><br />

                    <asp:TextBox ID="txtPassword"  placeholder="Парола" runat="server" Width="300" TextMode="Password"></asp:TextBox> 
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" 
                         ErrorMessage="Password is requare" ControlToValidate="txtPassword" ForeColor="Red" 
                         Display="Dynamic" >*</asp:RequiredFieldValidator> <br />                 
                    <asp:Button ID="Submit" runat="server" Text="Влез" OnClick="Submit_Click" /><br />
                     <asp:Label ID="lblMassege" runat="server" Text=""></asp:Label><br />
                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" DisplayMode="List"></asp:ValidationSummary>
                    <p>Ако нямате регистрация <asp:HyperLink ID="hpReg" runat="server" NavigateUrl="~/LoginAndRegister/Register.aspx">Регистрация</asp:HyperLink></p>
                  <p>Към <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Начална Страница</asp:HyperLink></p> 
             </div>
         </div>                     
        </div>
          </center>
    </form>
</body>
</html>
