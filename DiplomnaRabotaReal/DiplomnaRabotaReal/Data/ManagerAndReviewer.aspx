<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerAndReviewer.aspx.cs" Inherits="DiplomnaRabotaReal.Data.ManagerAndReviewer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Managers</title>
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
          <nav>
               <p>Ръководители</p>
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
              
                        <h2> Данни за Ръководител</h2>
                      <h2> Данни за Рецензент</h2>
                     <h2> Данни за член на Комисята</h2>  
                 
                        <asp:TextBox ID="txtName" runat="server"  placeholder="Три Имена" Width="300"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNames"
                            runat="server" 
                            ErrorMessage="Полето е задължително" 
                            ControlToValidate="txtName" 
                            Display="Dynamic" 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorNames" 
                            runat="server" 
                            ErrorMessage="Моля ,въведете само букви" 
                            ControlToValidate="txtName" Display="Dynamic" 
                            ForeColor="Red" 
                            ValidationExpression="[А-Я,a-я A-Z,a-z,-]+">*
                        </asp:RegularExpressionValidator><br />
                
                        <asp:DropDownList ID="DropDownListDepartment" runat="server" Width="300px">
                            <asp:ListItem Value="-1">Катедра</asp:ListItem>
                            <asp:ListItem>Външен</asp:ListItem>
                            <asp:ListItem>Автоматика, информационна и управляваща техника</asp:ListItem>
                            <asp:ListItem>Езиково и специализирано обучение</asp:ListItem>
                            <asp:ListItem>Електроника</asp:ListItem>
                            <asp:ListItem>Електроснабдяване и електрообзавеждане</asp:ListItem>
                            <asp:ListItem>Енергийна техника</asp:ListItem>
                            <asp:ListItem>Икономика</asp:ListItem>
                            <asp:ListItem>Индустриален дизайн и текстилна техника</asp:ListItem>
                            <asp:ListItem>Индустриален мениджмънт</asp:ListItem>
                            <asp:ListItem>Компютьрни системи и технологии</asp:ListItem>
                            <asp:ListItem>Комуникационна техника и технологии</asp:ListItem>
                            <asp:ListItem>Математика</asp:ListItem>
                            <asp:ListItem>Математика и информатика</asp:ListItem>
                            <asp:ListItem>Материалознание и технология на материалите</asp:ListItem>
                            <asp:ListItem>Машинни елементи и техническо чертане</asp:ListItem>
                            <asp:ListItem>Машиностроене и уредостроене</asp:ListItem>
                            <asp:ListItem>Машиностроене, компютърни системи и електротехника</asp:ListItem>
                            <asp:ListItem>Машиностроителна техника и технологии</asp:ListItem>
                            <asp:ListItem>Мениджмънт</asp:ListItem>
                            <asp:ListItem>Основи на електротехниката и електроенергетиката</asp:ListItem>
                            <asp:ListItem>Приложна информатика</asp:ListItem>
                            <asp:ListItem>Публична администрация</asp:ListItem>
                            <asp:ListItem>Социални и стопански науки</asp:ListItem>
                            <asp:ListItem>Социални науки</asp:ListItem>
                            <asp:ListItem>Текстилна техника и технологии</asp:ListItem>
                            <asp:ListItem>Техническа механика</asp:ListItem>
                            <asp:ListItem>Управление и маркетинг</asp:ListItem>
                            <asp:ListItem>Физика</asp:ListItem>
                            <asp:ListItem>Физика, химия и екология</asp:ListItem>
                            <asp:ListItem>Физическо възпитание и спорт</asp:ListItem>
                            <asp:ListItem>Финанси</asp:ListItem>
                            <asp:ListItem>Химия и екология</asp:ListItem>                          
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatordepartment" 
                            runat="server" 
                            ErrorMessage="Моля въведете стойност"
                            ControlToValidate="DropDownListDepartment" 
                            ForeColor="Red"
                            Display="Dynamic" 
                            InitialValue="-1">*</asp:RequiredFieldValidator><br />
             
                        <asp:DropDownList ID="DropDownListPossition" runat="server" Width="300px">
                            <asp:ListItem Value="-1">Длъжност </asp:ListItem>
                             <asp:ListItem>Външен</asp:ListItem>
                            <asp:ListItem>Доц.</asp:ListItem>
                            <asp:ListItem>Ас.</asp:ListItem>
                            <asp:ListItem>Гл.Ас.</asp:ListItem>                           
                            <asp:ListItem>Проф.</asp:ListItem>
                            <asp:ListItem>Пр.</asp:ListItem>
                            <asp:ListItem>Ст.Пр.</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPossition" 
                            runat="server" 
                            ErrorMessage="Моля въведете стойност"
                            ControlToValidate="DropDownListPossition" 
                            ForeColor="Red" 
                            Display="Dynamic"
                            InitialValue="-1">*</asp:RequiredFieldValidator><br />
               
                        <asp:DropDownList ID="DropDownListScienceDegree" runat="server" Width="300px">
                             <asp:ListItem Value="-1">Научна Степен </asp:ListItem>
                            <asp:ListItem>Д-Р</asp:ListItem>
                            <asp:ListItem>Дн</asp:ListItem>
                            <asp:ListItem>Д.м.н</asp:ListItem>
                             <asp:ListItem>Д.т.н</asp:ListItem>
                            <asp:ListItem>д.ик.н</asp:ListItem>
                            <asp:ListItem>Липсва</asp:ListItem>                        
                           </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorDegree" 
                              runat="server" 
                            ErrorMessage="Моля въведете стойност" 
                              ControlToValidate="DropDownListScienceDegree" 
                              ForeColor="Red" 
                              Display="Dynamic" 
                            InitialValue="-1">*</asp:RequiredFieldValidator><br />
                 
                      <asp:Button ID="btnSet" runat="server" Text="Въведи" OnClick="btnSet_Click" />              
                      <asp:Button ID="btnClear" runat="server" Text="Изчисти" OnClick="btnClear_Click" CausesValidation="False" /><br />            
                       <asp:Label ID="lblMassaanger" runat="server" Text=""></asp:Label><br />               
                        <asp:ValidationSummary ID="ValidationSummaryMannager" runat="server"  DisplayMode="List" ForeColor="Red" Font-Size="Larger"/>               
          </div>           
         </section>      
    </form>
</body>
</html>
