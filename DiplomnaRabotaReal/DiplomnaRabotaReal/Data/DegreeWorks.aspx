<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DegreeWorks.aspx.cs" Inherits="DiplomnaRabotaReal.Data.DegreeWorks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DegreeWork</title>
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body style="height: 414px; margin-bottom: 18px">
    <form id="form1" runat="server">
         <nav>
               <p>Дипломни Работи</p>
              <ul>
                 <li><a href="../Default.aspx">Home</a></li>  
                 <li><a href="Student.aspx">Студент</a></li>
                 <li><a href="ManagerAndReviewer.aspx">Ръководител-Рецензент</a></li>
                 <li><a href="DegreeWorks.aspx">Дипломна работа</a></li>                        
                 <li><a href="Protections.aspx">Защити</a></li>
                 <li><a href="Rating.aspx">Оценки</a></li>
                 <li><a href="DegreeWorkFiles.aspx">Файлове</a></li>              
                 <li><a href="#">Справки</a>
                     <ul>
                         <li><a href="/ShowData/QueryNavigator.aspx">Търси Студент</a></li>
                           <li><a href="/Shablons/ProtectionShablons.aspx">Шаблон(ZAP-1)</a></li>
                          <li><a href="/Shablons/StudentsAndThemes.aspx">Шаблон(Теми)</a></li>
                          <li><a href="/Shablons/Razpredelenie.aspx">Шаблон(Разпределение)</a></li>
                          <li><a href="/Shablons/Ratings.aspx">Шаблон(Оценки)</a></li> 
                          <li><a href="AddCommandmentNumber.aspx">Добави Номер на Заповед</a></li>
                         <li><a href="AddDateOfSubmission.aspx">Дата на Предаване(Дипломна)</a></li>
                         <li><a href="/EditRecords/NavigationBarEdit.aspx">Редактиране на запис</a></li>
                     </ul>                   
                 </li>
            </ul>          
     </nav>
      <section>
             
             <div class="content">
                  <h2>Данни за дипомантата работа</h2><br />
                            
                <asp:TextBox ID="txtThema" runat="server" placeholder="Тема" Width="300"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Полето е задължително" 
                   ControlToValidate="txtThema" 
                   ForeColor="Red" 
                   Display="Dynamic">*</asp:RequiredFieldValidator><br />  
                          
                 <asp:TextBox ID="txtFakNomer" runat="server" placeholder="Факултетен Номер" Width="300"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtFakNomer" 
                  runat="server" 
                   ErrorMessage="Полето е задължително" 
                   ControlToValidate="txtFakNomer" 
                   ForeColor="Red" 
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidatortxtFakNomer" 
                    runat="server" 
                    ErrorMessage="Задължително цифри" 
                    ForeColor="Red" 
                    Display="Dynamic" 
                    ControlToValidate="txtFakNomer"
                   ValidationExpression="[0-9]+">*</asp:RegularExpressionValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidatortxtFakNomer2" runat="server" 
                           ErrorMessage="Факултетния номер трябва да е точно 8 цифри" ForeColor="Red"
                           ControlToValidate="txtFakNomer"
                           ValidationExpression=".{8}">*</asp:RegularExpressionValidator><br />                                  
                  
                        <asp:TextBox ID="txtDateOfSetting" placeholder="Дипломна работа (Дата на задаване)"  onfocus="(this.type='date')" runat="server" Width="300px"></asp:TextBox>                     
                           <asp:RequiredFieldValidator ID="RequiredFieldValidatorDateOfSetting"
                               runat="server" 
                               ErrorMessage="Полето е задължително" 
                               ControlToValidate="txtDateOfSetting" 
                               ForeColor="Red" 
                          Display="Dynamic">*</asp:RequiredFieldValidator><br />
                    
                  
                        <asp:TextBox ID="txtDateOfDeliveryTime" runat="server" placeholder="Дипломна работа (Срок за предаване)" onfocus="(this.type='date')" Width="300px"></asp:TextBox>                       
                           <asp:RequiredFieldValidator ID="RequiredFieldValidatorDeliveryTime" 
                               runat="server" 
                               ErrorMessage="Полето е задължително" 
                               ControlToValidate="txtDateOfDeliveryTime" 
                               ForeColor="Red" 
                              Display="Dynamic">*</asp:RequiredFieldValidator><br />
                                  
                    <asp:DropDownList ID="ddlManager" runat="server" 
                            DataSourceID="SqlDataSourceManager" 
                            DataTextField="Name" 
                            DataValueField="ID" 
                            AppendDataBoundItems="true" Width="300px">
                              <asp:ListItem Value="-1">Ръководител</asp:ListItem> 
                        </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlManager"
                     runat="server" 
                      ErrorMessage="Полето е задължително"
                     ControlToValidate="ddlManager" 
                     InitialValue="-1" Display="Dynamic"
                     ForeColor="Red">*</asp:RequiredFieldValidator><br />

                    <asp:SqlDataSource ID="SqlDataSourceManager" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>"
                        SelectCommand="SELECT [ID], [Name] FROM [Manager-Reviewer]"></asp:SqlDataSource>
                                
                        <asp:DropDownList ID="ddlReviewer" runat="server" 
                            DataSourceID="SqlDataSourceReviewer"
                            DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true" Width="300px">
                             <asp:ListItem Value="-1">Рецензент</asp:ListItem> 
                        </asp:DropDownList>
                       <asp:RequiredFieldValidator 
                           ID="RequiredFieldValidatorddlReviewer" 
                           runat="server" 
                        ErrorMessage="Полето е задължително" 
                           ControlToValidate="ddlReviewer" 
                           InitialValue="-1"
                           Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator><br />
                        <asp:SqlDataSource ID="SqlDataSourceReviewer" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" 
                            SelectCommand="SELECT [ID], [Name] FROM [Manager-Reviewer]"></asp:SqlDataSource>  
                 
                       <asp:DropDownList ID="ddlConsultant" 
                           runat="server" 
                           DataSourceID="SqlDataSourceConsultant" 
                           DataTextField="Name"
                           DataValueField="Name" 
                           AppendDataBoundItems="true" Width="300px">
                          <asp:ListItem Value="-1">Консултант</asp:ListItem> 
                       </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlConsultant" 
                            runat="server" 
                           ErrorMessage="Полето е задължително" 
                            ControlToValidate="ddlConsultant" 
                           InitialValue="-1" 
                            Display="Dynamic" 
                            ForeColor="Red">*</asp:RequiredFieldValidator><br />
                        <asp:SqlDataSource ID="SqlDataSourceConsultant" 
                            runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" 
                            SelectCommand="SELECT [Name] FROM [Manager-Reviewer]"></asp:SqlDataSource>

                     <asp:Button ID="btnSet" runat="server" Text="Въведи" OnClick="btnSet_Click" />            
                       <asp:Button ID="btnClear" runat="server" Text="Изчисти" OnClick="btnClear_Click" CausesValidation="False" /><br />
                     <asp:Label ID="lblMassanger" runat="server" Text=""></asp:Label><br />
                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" DisplayMode="List" Font-Size="Larger"></asp:ValidationSummary> 
                 </div>
        </section>
         
    </form>
</body>
</html>
