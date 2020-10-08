<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rating.aspx.cs" Inherits="DiplomnaRabotaReal.Data.Rating" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rating</title>
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body>
    
    <form id="form1" runat="server">
        
              <nav>
                  <p>Оценки</p>
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
                   <h2>Данни за Оценките</h2>
             
                        <asp:TextBox ID="txtRatingWork" runat="server" placeholder="Оценка на Разработка" Width="300px"></asp:TextBox>
                      <asp:RequiredFieldValidator 
                          ID="RequiredFieldValidatorRaitingWork" 
                          runat="server" 
                          ErrorMessage="Полето е задължително" 
                          ControlToValidate="txtRatingWork" 
                          Display="Dynamic" 
                          ForeColor="Red">*</asp:RequiredFieldValidator>
                       <asp:RangeValidator ID="RangeValidatorRaitingWork" 
                           runat="server"
                         ErrorMessage="Оценките трябва да бъдат между 2 и 6" 
                         ControlToValidate="txtRatingWork" 
                           ForeColor="Red" 
                           Display="Dynamic"
                          MinimumValue="2" MaximumValue="6" Type="Double">*</asp:RangeValidator><br />         
              
                         <asp:TextBox ID="txtRatingProtection" runat="server" placeholder="Оценка на Защита" Width="300px"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorRatingProtection" 
                              runat="server" 
                             ErrorMessage="Полето е задължително" 
                              ControlToValidate="txtRatingProtection" 
                              Display="Dynamic" 
                              ForeColor="Red">*</asp:RequiredFieldValidator>
                     <asp:RangeValidator ID="RangeValidatorRatingProtection"
                         runat="server"
                         ErrorMessage="Оценките трябва да бъдат между 2 и 6" 
                         ControlToValidate="txtRatingProtection" 
                         ForeColor="Red" 
                         Display="Dynamic"
                          MinimumValue="2" MaximumValue="6" Type="Double">*</asp:RangeValidator><br />
                               
                   <asp:DropDownList ID="ddlFakNumber" runat="server" DataSourceID="SqlDataSourceRating" DataTextField="GraduatedId" DataValueField="ID" AppendDataBoundItems="true" Width="300px">
                       <asp:ListItem Text="Студент Факултетен Номер" Value="-1"></asp:ListItem>
                   </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorFakNumber"
                            runat="server" 
                           ErrorMessage="Полето е задължително" 
                             ForeColor="Red" 
                             Display="Dynamic" 
                             ControlToValidate="ddlFakNumber" 
                             InitialValue="-1">*</asp:RequiredFieldValidator> <br />
                        <asp:SqlDataSource ID="SqlDataSourceRating" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT * FROM [DegreeWorks]"></asp:SqlDataSource>
                
                        <asp:Button ID="btnSet" runat="server" Text="Въведи" OnClick="btnSet_Click" />                
                        <asp:Button ID="btnClear" runat="server" Text="Изчисти" OnClick="btnClear_Click" CausesValidation="False" /><br />             
                        <asp:Label ID="lblMassanger" runat="server" Text=""></asp:Label><br />             
                   <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" DisplayMode="List" Font-Size="Larger"></asp:ValidationSummary>               
            </div>
          
        </section> 
            
    </form>
       
</body>
</html>
