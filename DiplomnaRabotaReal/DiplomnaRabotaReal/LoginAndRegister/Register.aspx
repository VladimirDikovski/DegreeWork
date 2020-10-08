<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DiplomnaRabotaReal.Login_and__Register.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="StyleForm.css" rel="stylesheet" />
    <style>
         p {color:white;}
           a {color:red;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <section>
            <img src="img//coffee_book_windows.jpg" alt="Alternate Text" class="panel"/>
     </section>
              <div class="sec2">
            <center>
  
            <div class="container">
                
                <div class="content">
                    <h2>Регистрация</h2>
                   <asp:TextBox ID="txtFirstName" placeholder="Първо Име" runat="server" Width="300"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" 
                             ErrorMessage="Pls enter User Name"
                             ControlToValidate="txtFirstName"
                             Display="Dynamic" 
                             ForeColor="Red">*</asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ErrorMessage="FirstName Must be between 5 and 15 symbols" ForeColor="Red"
                             ControlToValidate="txtFirstName"
                             ValidationExpression=".{5,15}">*</asp:RegularExpressionValidator><br />
                                      
                    <asp:TextBox ID="txtLastName" placeholder="Фамилия" runat="server" Width="300"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" 
                             ErrorMessage="Pls enter Last Name"
                             ControlToValidate="txtLastName"
                             Display="Dynamic" 
                             ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ErrorMessage="LastName Must be between 5 and 15 symbols" ForeColor="Red"
                             ControlToValidate="txtLastName"
                             ValidationExpression=".{5,15}">*</asp:RegularExpressionValidator><br />                                    
                 
                    <asp:TextBox ID="txtUserName" placeholder="Потребителско Име" runat="server" Width="300"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" 
                             ErrorMessage="Pls enter User Name"
                             ControlToValidate="txtUserName"
                             Display="Dynamic" 
                             ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="UserName Must be between 5 and 15 symbols" ForeColor="Red"
                             ControlToValidate="txtUserName"
                             ValidationExpression=".{5,15}">*</asp:RegularExpressionValidator><br />
                              
                
                    <asp:TextBox ID="txtPassword" placeholder="Парола" runat="server" Width="300" TextMode="Password"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" 
                             ErrorMessage="Pls enter Password"
                             ControlToValidate="txtPassword"
                             Display="Dynamic" 
                             ForeColor="Red">*</asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="Password Must be between 5 and 15 symbols" ForeColor="Red"
                             ControlToValidate="txtPassword"
                             ValidationExpression=".{5,15}">*</asp:RegularExpressionValidator><br />
                                       
                    <asp:TextBox ID="txtConfirmPassword" placeholder="Потвърди Парола" runat="server" Width="300" TextMode="Password"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" 
                             ErrorMessage="Pls enter Confrim Password"
                             ControlToValidate="txtConfirmPassword"
                             Display="Dynamic" 
                             ForeColor="Red">*</asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="CompareValidatorRePassword" runat="server" 
                         ErrorMessage="Password and ConfrimPasswod must be the same"
                          ControlToValidate="txtConfirmPassword"
                          ControlToCompare="txtPassword"
                          ForeColor="Red"
                          Display="Dynamic">*</asp:CompareValidator><br />

                        <asp:DropDownList ID="ddlGender" runat="server"  Width="300px" 
                       DataSourceID="SqlDataSource1" 
                       DataTextField="Gender" DataValueField="ID"
                       AppendDataBoundItems="true">
                       <asp:ListItem Value="-1">Пол</asp:ListItem> 
                   </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                 ErrorMessage="Pls Enter a Gender"  
                 Display="Dynamic" 
                 ForeColor="Red" InitialValue="-1" 
                 ControlToValidate="ddlGender">*</asp:RequiredFieldValidator>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegisterUserConnectionString %>" 
                       SelectCommand="SELECT * FROM [Gender]"></asp:SqlDataSource><br />
                  
                    <asp:Button ID="btnSet" runat="server" Text="Въведи" OnClick="btnSet_Click"></asp:Button>
                     <asp:Button ID="btnClear" runat="server" Text="Изчисти" OnClick="btnClear_Click"></asp:Button><br />
                      <asp:Label ID="lblMassege" runat="server" Text="" Font-Bold="true"></asp:Label>
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="white" DisplayMode="List"></asp:ValidationSummary><br />
                    <p>Aко имате регистрация,моля натиснете <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="~/LoginAndRegister/Login.aspx">Login</asp:HyperLink></p> 
                    <p>Към <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Начална Страница</asp:HyperLink></p> 
                </div>
            </div>
               
                  </center>
        </div>
    </form>
</body>
</html>
