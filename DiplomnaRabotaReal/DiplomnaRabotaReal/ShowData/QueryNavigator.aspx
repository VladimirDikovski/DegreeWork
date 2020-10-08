<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryNavigator.aspx.cs" Inherits="DiplomnaRabotaReal.ShowData.QueryNavigator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QueryNavigator</title>
    <link href="StyleShowData.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
       <nav>
            <ul>              
                 <li><a href="ShowStudent.aspx">Търси по Име</a></li>
                 <li><a href="ShowStudentByFakNumber.aspx">Търси по Номер</a></li>
                 <li><a href="ShowStudentByTheme">Търси по Тема</a></li>                        
                 <li><a href="ShowStudentByManager.aspx">Търси по Ръководител</a></li>
                 <li><a href="ShowStudentByComandmentNumber.aspx">Търси По Номер(Заповед)</a></li>
                 <li><a href="/Data/NavigationBar.aspx">Онсовното Меню</a></li>       
                  <li><a href="#">Справки</a>
                     <ul>                       
                           <li><a href="/Shablons/ProtectionShablons.aspx">Шаблон(ZAP-1)</a></li>
                          <li><a href="/Shablons/StudentsAndThemes.aspx">Шаблон(Теми)</a></li>
                          <li><a href="/Shablons/Razpredelenie.aspx">Шаблон(Разпределение)</a></li>
                          <li><a href="/Shablons/Ratings.aspx">Шаблон(Оценки)</a></li> 
                          <li><a href="/Data/AddCommandmentNumber.aspx">Добави Номер на Заповед</a></li>
                         <li><a href="/Data/AddDateOfSubmission.aspx">Дата на Предаване(Дипломна)</a></li>
                         <li><a href="/EditRecords/NavigationBarEdit.aspx">Редактиране на запис</a></li>
                     </ul>                   
                 </li>
            </ul>          
        </nav>
    </form>
</body>
</html>
