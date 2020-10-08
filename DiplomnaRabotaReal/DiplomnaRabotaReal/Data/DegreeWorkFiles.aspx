
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DegreeWorkFiles.aspx.cs" Inherits="DiplomnaRabotaReal.Data.DegreeWorkFiles" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    
        <nav>
            <p>Дипломни Файлове</p>
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
                         
                  <h1>
                      Данни за Дипломните файлове
                  </h1>
                      
                  <asp:FileUpload ID="FileUploadFailAssigment" runat="server"  Width="300px"/>  
                     <asp:Label ID="Label1" runat="server" Text="Дипломна Работа" Font-Bold="True" Font-Size="X-Large" ForeColor="#66FF66"></asp:Label><br />
                    <asp:FileUpload ID="FileUploadFailDegreeWork" runat="server" Width="300px" /> 
                    <asp:Label ID="Label2" runat="server" Text="Задание (Дипломна Работа)" Font-Bold="True" Font-Size="X-Large" ForeColor="#66FF66"></asp:Label><br />
                        
                    <asp:DropDownList ID="ddlFakNumber" runat="server"
                        DataSourceID="SqlDataSource1" 
                        DataTextField="GraduatedId" 
                        DataValueField="ID" 
                        AppendDataBoundItems="true" Width="300px">
                           <asp:ListItem Text="Студент Факултетен Номер" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                          <asp:Label ID="Label3" runat="server" Text="Студент Факултетен Номер" Font-Bold="True" Font-Size="X-Large" ForeColor="#66FF66"></asp:Label><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFakNumber" 
                            runat="server" 
                            ErrorMessage="Полето е задължително" 
                            ForeColor="Red" Display="Dynamic"
                            ControlToValidate="ddlFakNumber" 
                            InitialValue="-1">*</asp:RequiredFieldValidator><br />                      
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT * FROM [DegreeWorks]"></asp:SqlDataSource>
         
                      <asp:Button ID="btnSet" runat="server" Text="Въведи" OnClick="InputData"></asp:Button>             
                        <asp:Button ID="btnClear" runat="server" Text="Изчисти" OnClick="btnClear_Click" CausesValidation="False"></asp:Button> <br />                             
                     <asp:Label ID="lblMassanger" runat="server" Text="" Font-Size="Larger"></asp:Label><br />           
                     <asp:ValidationSummary ID="ValidationSummaryFiles" runat="server" ForeColor="Red" DisplayMode="list" Font-Size="Larger"></asp:ValidationSummary>          
                     </div>
                 </section>           
    </form>
</body>
</html>
