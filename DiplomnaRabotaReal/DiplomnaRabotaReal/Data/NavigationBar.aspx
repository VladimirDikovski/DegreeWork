<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NavigationBar.aspx.cs" Inherits="DiplomnaRabotaReal.Data.NavigationBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NavigationPage</title>
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
          <nav>       
               <p>Навигация</p>
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
    </form>
</body>
</html>
