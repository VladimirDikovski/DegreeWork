<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="DiplomnaRabotaReal.Data.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student</title>
  
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">       
            <nav>
                <p>Студент</p>
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
                 <h2>Данни за Дипломанта</h2>
                  <asp:TextBox ID="txtFakNomer" runat="server" placeholder="Факултетен Номер" Width="300px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidatorFakNomer" runat="server" 
                 ErrorMessage="Полето е задължително" ControlToValidate="txtFakNomer" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidatortxtFakNomer" runat="server" 
                 ErrorMessage="Само цифри" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFakNomer"
                  ValidationExpression="[0-9]+">*</asp:RegularExpressionValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ErrorMessage="Факултетния номер трябва да е точно 8 цифри" ForeColor="Red"
                             ControlToValidate="txtFakNomer"
                             ValidationExpression=".{8}">*</asp:RegularExpressionValidator><br />

                 <asp:TextBox ID="txtNameBg" runat="server" placeholder="Три Имена" Width="300px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidatorNameBg" runat="server" 
                  ErrorMessage="Полето е задължително" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNameBg">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorNamesbg" runat="server" 
                            ErrorMessage="Моля ,въведете само букви на кирилица" ControlToValidate="txtNameBg" Display="Dynamic" ForeColor="Red" 
                        ValidationExpression="[А-Я a-я]+">*</asp:RegularExpressionValidator><br />

                  <asp:TextBox ID="txtNameEng" runat="server" placeholder="Три Имена(English)" Width="300px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidatorNameEn" runat="server" 
                  ErrorMessage="Полето е задължително" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNameEng">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatornameEn" runat="server" 
                            ErrorMessage="Моля ,въведете само букви на латиница" ControlToValidate="txtNameEng" Display="Dynamic" ForeColor="RED" 
                        ValidationExpression="[A-Z a-z]+">*</asp:RegularExpressionValidator><br />

                   <asp:TextBox ID="txtDataSemester" runat="server" placeholder ="Дата на Семестриално Завършване"  Width="300px"  onfocus="(this.type='date')"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDateSemestarFinish" 
                        ControlToValidate="txtDataSemester" 
                         runat="server" 
                        ErrorMessage="Полето е задължително"  
                        ForeColor="Red" 
                        Display="Dynamic">*</asp:RequiredFieldValidator><br />

                 
                  <asp:DropDownList ID="ddlSpciality" runat="server" Width="300px">
                      <asp:ListItem Value="-1">Специалност</asp:ListItem>
                      <asp:ListItem>Автоматика, роботика и компютърни управляващи системи</asp:ListItem>
                      <asp:ListItem>Автоматика, информационна и управляваща техника</asp:ListItem>
                      <asp:ListItem>Автомобилна електроника</asp:ListItem>
                      <asp:ListItem>Безопасност на труда</asp:ListItem>
                      <asp:ListItem>Вентилационна и климатична техника</asp:ListItem>
                      <asp:ListItem>Дигитална администрация</asp:ListItem>
                      <asp:ListItem>Дизайн, техника и технологии в текстила</asp:ListItem>
                      <asp:ListItem>Електроенергетика и електрообзавеждане</asp:ListItem>
                      <asp:ListItem>Електроника</asp:ListItem>
                      <asp:ListItem>Индустриален мениджмънт</asp:ListItem>
                      <asp:ListItem>Индустриално инженерство</asp:ListItem> 
                      <asp:ListItem>Индустриален мениджмънт - иновации и бизнес развитие</asp:ListItem>
                      <asp:ListItem>Иновационен и инвестиционен мениджмънт в индустрията</asp:ListItem>
                      <asp:ListItem>Индустриални, топлинни и газови системи</asp:ListItem>
                      <asp:ListItem>Компютърни системи и технологии </asp:ListItem>
                      <asp:ListItem>Компютърни технологии в машиностроенето</asp:ListItem>
                      <asp:ListItem>Компютърни методи и технологии в машиностроенето</asp:ListItem>
                      <asp:ListItem>Компютърен дизайн</asp:ListItem>
                      <asp:ListItem>Компютърен дизайн в индустрията</asp:ListItem>
                      <asp:ListItem>Комуникационни технологии и киберсигурност </asp:ListItem>
                      <asp:ListItem>Комуникационна техника и технологии</asp:ListItem>
                      <asp:ListItem>Мехатроника</asp:ListItem>
                      <asp:ListItem>Мениджмънт на индустриалното предприятие</asp:ListItem>
                      <asp:ListItem>Машиностроителна техника и технологии</asp:ListItem>
                      <asp:ListItem>Машиностроене и уредостроене</asp:ListItem>
                      <asp:ListItem>Отоплителна, вентилационна, климатична и газова техника</asp:ListItem>
                      <asp:ListItem>Отопление, вентилация и климатизация на индустриални обекти</asp:ListItem>
                      <asp:ListItem>Опазване на околната среда и устойчиво развитие</asp:ListItem>
                      <asp:ListItem>Промишлена и автомобилна електроника</asp:ListItem>
                      <asp:ListItem>Публична администрация</asp:ListItem>  
                      <asp:ListItem>Софтуерно и компютърно инженерство</asp:ListItem>
                      <asp:ListItem>Социални дейности</asp:ListItem>
                      <asp:ListItem>Стопанско управление</asp:ListItem>
                      <asp:ListItem>Социална работа и европейски политики</asp:ListItem>
                      <asp:ListItem>Техническа безопасност</asp:ListItem>
                      <asp:ListItem>Техника и технология за опазване на околната среда</asp:ListItem>       
                      <asp:ListItem>Tехнология на материалите и материалознание</asp:ListItem>
                      <asp:ListItem>Текстилна техника и технологии</asp:ListItem>
                      <asp:ListItem>Управление на проекти</asp:ListItem>
                      <asp:ListItem>Управление на бизнеса</asp:ListItem>
                      <asp:ListItem>Управление на човешките ресурси</asp:ListItem>                   
                      <asp:ListItem>Хидравлична и пневматична техника</asp:ListItem>                                                                                                                                                                                                                     
                    </asp:DropDownList>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorSpeciality" runat="server" 
                          ErrorMessage="Полето е задължително" 
                           ForeColor="Red" Display="Dynamic"
                           ControlToValidate="ddlSpciality" 
                           InitialValue="-1">*</asp:RequiredFieldValidator><br />

                  <asp:DropDownList ID="ddlOks" runat="server" Width="300px">
                               <asp:ListItem Value="-1">ОКС</asp:ListItem>
                               <asp:ListItem>Бакалавър</asp:ListItem>
                               <asp:ListItem>Магистър</asp:ListItem>
                                 </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorOKS" runat="server" 
                       ErrorMessage="Полето е задължително" 
                      ForeColor="red" Display="Dynamic" 
                      ControlToValidate="ddlOks"
                      InitialValue="-1">*</asp:RequiredFieldValidator><br />

                  <asp:DropDownList ID="ddlTypeOfLearning" runat="server" Width="300px">
                               <asp:ListItem Value="-1">Обучение</asp:ListItem>
                               <asp:ListItem>Редовно</asp:ListItem>
                               <asp:ListItem>Задочно</asp:ListItem>
                               <asp:ListItem>Специално</asp:ListItem>
                                 </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLearingType" runat="server" 
                         ErrorMessage="Полето е задължително" 
                        ForeColor="Red"
                        Display="Dynamic" 
                        ControlToValidate="ddlTypeOfLearning" 
                        InitialValue="-1">*</asp:RequiredFieldValidator><br />
                  <asp:Button ID="btnInsert" runat="server" Text="Въведи" OnClick="btnInsert_Click" />
                   <asp:Button ID="btnClear" runat="server" Text="Изчисти" OnClick="btnClear_Click" CausesValidation="False"/><br />
                 <asp:Label ID="lblMessanger" runat="server" Text=""></asp:Label><br />
                  <asp:ValidationSummary ID="ValidationSummaryStydents" 
                      runat="server" 
                      ForeColor="Red" 
                      DisplayMode="list" Font-Size="large"></asp:ValidationSummary><br />                    
             </div>
        
        </section>
              
          
    </form>
</body>
</html>
