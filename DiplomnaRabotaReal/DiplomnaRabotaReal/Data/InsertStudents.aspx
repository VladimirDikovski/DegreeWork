<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertStudents.aspx.cs" Inherits="DiplomnaRabotaReal.Data.InsertStudents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>InsertStudent</title>
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server"> 
      <nav>       
               <p>Студент към Защитата</p>
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
                        <h2>Въвежданe на студенти към Защитата</h2>             
                          <asp:TextBox ID="txtStudentFakNumber"  placeholder="Факултетен Номер на Студент " runat="server" Width="300px"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                          runat="server" 
                           ErrorMessage="Полето е задължително" 
                          ControlToValidate="txtStudentFakNumber"
                           Display="Dynamic"
                          ForeColor="Red">*</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidatortxtStudentFakNumber" 
                             runat="server" 
                               ErrorMessage ="Само цифри" 
                             ForeColor="Red" 
                             Display="Dynamic"
                             ControlToValidate="txtStudentFakNumber"
                    ValidationExpression="[0-9]+">*</asp:RegularExpressionValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidatorFakNumber" 
                      runat="server" 
                       ErrorMessage="Факултетния номер трябва да е точно 8 цифри" 
                       ForeColor="Red"
                       ControlToValidate="txtStudentFakNumber"
                       ValidationExpression=".{8}">*</asp:RegularExpressionValidator><br /> 
            
                      <asp:Button ID="btnInsert" runat="server" Text="Въведи" OnClick="btnInsert_Click" /><br />           
                        <asp:Label ID="lblMessenger" runat="server" Text=""></asp:Label><br />                  
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server"  DisplayMode="List" ForeColor="Red" Font-Size="Larger"></asp:ValidationSummary>            
               </div>
        </section>
 
    </form>
</body>
</html>
