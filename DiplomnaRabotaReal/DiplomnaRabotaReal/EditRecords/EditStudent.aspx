<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditStudent.aspx.cs" Inherits="DiplomnaRabotaReal.EditRecords.EditStudent" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleEditing.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager id="ScriptManager" runat="server">
   </asp:ScriptManager>
          <nav>
            <ul>     
                 <p>Редактиране Студент</p>
                 <li><a href="EditStudent.aspx">Студент(Edit)</a></li>
                 <li><a href="EditProtection.aspx">Защита(Edit)</a></li>
                 <li><a href="EditFiles.aspx">Дипломни Файлове(Edit)</a></li>
                <li><a href="EditManager-Reviewer.aspx">Ръководител-Рецензент(Edit)</a></li>
                <li><a href="/Data/NavigationBar.aspx">Онсовното Меню</a></li>             
                 
            </ul>          
        </nav>
        <br /><br /><br />
        <center>
               <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"></asp:ValidationSummary>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FakNumber" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" CellSpacing="2" Width="1000px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="FakNumber" HeaderText="Факултетен Номер" ReadOnly="True" SortExpression="FakNumber" />
                    <asp:TemplateField HeaderText="Име на Студент" SortExpression="NameStudent">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NameStudent") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("NameStudent") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Име на студент(English)" SortExpression="NameOfEnglish">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NameOfEnglish") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NameOfEnglish") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Специалност" SortExpression="Specialty">
                        <EditItemTemplate>
                           <asp:DropDownList ID="ddlSpeciality" runat="server" Text='<%# Bind("Specialty") %>'>
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
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Specialty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OKC" SortExpression="OKC">
                        <EditItemTemplate>
                           <asp:DropDownList ID="ddlOKS" runat="server" Text='<%# Bind("OKC") %>'>
                                <asp:ListItem>Бакалавър</asp:ListItem>
                               <asp:ListItem>Магистър</asp:ListItem>
                           </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("OKC") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Тип на Обучение" SortExpression="TypeOfLearning">
                        <EditItemTemplate>
                         <asp:DropDownList ID="ddlType" runat="server" Text='<%# Bind("TypeOfLearning") %>'>
                              <asp:ListItem>Редовно</asp:ListItem>
                               <asp:ListItem>Задочно</asp:ListItem>
                               <asp:ListItem>Специално</asp:ListItem>
                         </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("TypeOfLearning") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Дата Семестриално Завършване" SortExpression="DataOfSemesterFinish">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("DataOfSemesterFinish","{0:D}") %>'></asp:TextBox>
                             <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                                 TargetControlID="TextBox6" Format="dd/MM/yyyy">
                             </ajaxToolkit:CalendarExtender>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("DataOfSemesterFinish","{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#99FF66" ForeColor="Black" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" BorderStyle="Inset" HorizontalAlign="Center" VerticalAlign="Top" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

            </asp:GridView>
               <br />
               <br />
               <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CellSpacing="2" Width="1000px">
                   <Columns>
                       <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                       <asp:TemplateField HeaderText="Пореден Номер"  InsertVisible="False" SortExpression="ID">
                           <EditItemTemplate>
                               <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>' ></asp:Label>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label8" runat="server" Text='<%# Bind("ID") %>' ></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Тема" SortExpression="Theme">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Theme") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTheme" 
                                runat="server" ErrorMessage="Полето е задължително" ControlToValidate="TextBox1"  ForeColor="Red" Display="Dynamic">*
                            </asp:RequiredFieldValidator>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("Theme") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Факултетен Номер" SortExpression="GraduatedId">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GraduatedId") %>' ReadOnly="true"></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label9" runat="server" Text='<%# Bind("GraduatedId") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Ръководител" SortExpression="ManagerId">
                           <EditItemTemplate>
                              <asp:DropDownList ID="ddlManager"  runat="server"  Text='<%# Bind("ManagerId") %>' DataSourceID="SqlDataSourceManager" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                             <asp:SqlDataSource ID="SqlDataSourceManager" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [Manager-Reviewer]"></asp:SqlDataSource>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label2" runat="server" Text='<%# Bind("ManagerId") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Консултант" SortExpression="Consultant">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Consultant") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label3" runat="server" Text='<%# Bind("Consultant") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Дата на Задаване" SortExpression="DateOfSetting">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DateOfSetting", "{0:D}") %>'></asp:TextBox>
                                 <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" 
                                 TargetControlID="TextBox4" Format="dd/MM/yyyy">
                             </ajaxToolkit:CalendarExtender>

                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label4" runat="server" Text='<%# Bind("DateOfSetting", "{0:D}") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Срок на предаване" SortExpression="DeliveryTime">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DeliveryTime", "{0:D}") %>'></asp:TextBox>
                               <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" 
                                 TargetControlID="TextBox5" Format="dd/MM/yyyy">
                             </ajaxToolkit:CalendarExtender>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label5" runat="server" Text='<%# Bind("DeliveryTime", "{0:D}") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Дата на Предаване" SortExpression="DateOfSubmission">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("DateOfSubmission", "{0:D}") %>'></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" 
                                 TargetControlID="TextBox6" Format="dd/MM/yyyy">
                             </ajaxToolkit:CalendarExtender>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label6" runat="server" Text='<%# Bind("DateOfSubmission", "{0:D}") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Рецензент" SortExpression="ReviewerId">
                           <EditItemTemplate>
                          <asp:DropDownList ID="ddlReviewer" runat="server" Text='<%# Bind("ReviewerId") %>' DataSourceID="SqlDataSourceReviewer" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceReviewer" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [Manager-Reviewer]"></asp:SqlDataSource>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label7" runat="server" Text='<%# Bind("ReviewerId") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
                   <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                   <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" HorizontalAlign="Center" VerticalAlign="Top" />
                   <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                   <RowStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                   <SortedAscendingCellStyle BackColor="#EDF6F6" />
                   <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                   <SortedDescendingCellStyle BackColor="#D6DFDF" />
                   <SortedDescendingHeaderStyle BackColor="#002876" />
               </asp:GridView>
               <br />
            <table>
                <tr>
                    <td>
                         <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                   <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                   <EditRowStyle BackColor="#999999" />
                   <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                   <Fields>
                       <asp:BoundField DataField="ID" HeaderText="Пореден Номер" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                       <asp:TemplateField HeaderText="Оценка на Разработка" SortExpression="RatingOfDevelopment">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RatingOfDevelopment") %>'></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidatorRaitingWork" runat="server"
                                ErrorMessage="Оценките трябва да бъдат между 2 и 6" ControlToValidate="TextBox1" ForeColor="Red" Display="Dynamic"
                            MinimumValue="2" MaximumValue="6" Type="Double">*</asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRaitingWork" runat="server" 
                          ErrorMessage="Полето е задължително" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                           </EditItemTemplate>
                          
                           <ItemTemplate>
                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("RatingOfDevelopment") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Оценка на защита" SortExpression="RatingOfProtection">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RatingOfProtection") %>' ></asp:TextBox>
                              <asp:RangeValidator ID="RangeValidatorRaitingOFProtection" runat="server"
                                ErrorMessage="Оценките трябва да бъдат между 2 и 6" ControlToValidate="TextBox2" ForeColor="Red" Display="Dynamic"
                            MinimumValue="2" MaximumValue="6" Type="Double">*</asp:RangeValidator>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorRaitingOFProtection" runat="server" 
                          ErrorMessage="Полето е задължително" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                           </EditItemTemplate>        
                           <ItemTemplate>
                               <asp:Label ID="Label2" runat="server" Text='<%# Bind("RatingOfProtection") %>' Visible="true"></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Пореден Номер" SortExpression="DegreeWorkId">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("DegreeWorkId") %>' ReadOnly="true"  Visible="false"></asp:TextBox>
                           </EditItemTemplate>
                    
                           <ItemTemplate>
                               <asp:Label ID="Label3" runat="server" Text='<%# Bind("DegreeWorkId") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:CommandField ShowEditButton="True" />
                   </Fields>
                   <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                   <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
               </asp:DetailsView>
              </td>                     
            </table>
        </center>
      
         
            
            
              
               <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" DeleteCommand="DELETE FROM [Rating] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Rating] ([RatingOfDevelopment], [RatingOfProtection], [DegreeWorkId]) VALUES (@RatingOfDevelopment, @RatingOfProtection, @DegreeWorkId)" SelectCommand="SELECT * FROM [Rating] WHERE ([DegreeWorkId] = @DegreeWorkId)" UpdateCommand="UPDATE [Rating] SET [RatingOfDevelopment] = @RatingOfDevelopment, [RatingOfProtection] = @RatingOfProtection, [DegreeWorkId] = @DegreeWorkId WHERE [ID] = @ID">
                   <DeleteParameters>
                       <asp:Parameter Name="ID" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="RatingOfDevelopment" Type="Double" />
                       <asp:Parameter Name="RatingOfProtection" Type="Double" />
                       <asp:Parameter Name="DegreeWorkId" Type="Int32"/>
                   </InsertParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="GridView2" Name="DegreeWorkId" PropertyName="SelectedValue" Type="Int32" />
                   </SelectParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="RatingOfDevelopment" Type="Double" />
                       <asp:Parameter Name="RatingOfProtection" Type="Double" />
                       <asp:Parameter Name="DegreeWorkId" Type="Int32" />
                       <asp:Parameter Name="ID" Type="Int32" />
                   </UpdateParameters>
               </asp:SqlDataSource>
               <br />
               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" DeleteCommand="DELETE FROM [DegreeWorks] WHERE [ID] = @ID" InsertCommand="INSERT INTO [DegreeWorks] ([Theme], [GraduatedId], [ManagerId], [Consultant], [DateOfSetting], [DeliveryTime], [DateOfSubmission], [ReviewerId]) VALUES (@Theme, @GraduatedId, @ManagerId, @Consultant, @DateOfSetting, @DeliveryTime, @DateOfSubmission, @ReviewerId)" SelectCommand="SELECT * FROM [DegreeWorks] WHERE ([GraduatedId] = @GraduatedId)" 
                   UpdateCommand="UPDATE [DegreeWorks] SET [Theme] = @Theme, [GraduatedId] = @GraduatedId, [ManagerId] = @ManagerId, [Consultant] = @Consultant, [DateOfSetting] = @DateOfSetting, [DeliveryTime] = @DeliveryTime, [DateOfSubmission] = @DateOfSubmission, [ReviewerId] = @ReviewerId WHERE [ID] = @ID">
                   <DeleteParameters>
                       <asp:Parameter Name="ID" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="Theme" Type="String" />
                       <asp:Parameter Name="GraduatedId" Type="Int32" />
                       <asp:Parameter Name="ManagerId" Type="Int32" />
                       <asp:Parameter Name="Consultant" Type="String" />
                       <asp:Parameter DbType="Date" Name="DateOfSetting" />
                       <asp:Parameter DbType="Date" Name="DeliveryTime" />
                       <asp:Parameter DbType="Date" Name="DateOfSubmission" />
                       <asp:Parameter Name="ReviewerId" Type="Int32" />
                   </InsertParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="GridView1" Name="GraduatedId" PropertyName="SelectedValue" Type="Int32" />
                   </SelectParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="Theme" Type="String" />
                       <asp:Parameter Name="GraduatedId" Type="Int32" />
                       <asp:Parameter Name="ManagerId" Type="Int32" />
                       <asp:Parameter Name="Consultant" Type="String" />
                       <asp:Parameter DbType="Date" Name="DateOfSetting" />
                       <asp:Parameter DbType="Date" Name="DeliveryTime" />
                       <asp:Parameter DbType="Date" Name="DateOfSubmission" />
                       <asp:Parameter Name="ReviewerId" Type="Int32" />
                       <asp:Parameter Name="ID" Type="Int32" />
                   </UpdateParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT * FROM [Graduates]" DeleteCommand="DELETE FROM [Graduates] WHERE [FakNumber] = @FakNumber" InsertCommand="INSERT INTO [Graduates] ([FakNumber], [NameStudent], [NameOfEnglish], [Specialty], [OKC], [TypeOfLearning], [DataOfSemesterFinish]) VALUES (@FakNumber, @NameStudent, @NameOfEnglish, @Specialty, @OKC, @TypeOfLearning, @DataOfSemesterFinish)" 
                   UpdateCommand="UPDATE [Graduates] SET [NameStudent] = @NameStudent, [NameOfEnglish] = @NameOfEnglish, [Specialty] = @Specialty, [OKC] = @OKC, [TypeOfLearning] = @TypeOfLearning, [DataOfSemesterFinish] = @DataOfSemesterFinish WHERE [FakNumber] = @FakNumber">
                   <DeleteParameters>
                       <asp:Parameter Name="FakNumber" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="FakNumber" Type="Int32" />
                       <asp:Parameter Name="NameStudent" Type="String" />
                       <asp:Parameter Name="NameOfEnglish" Type="String" />
                       <asp:Parameter Name="Specialty" Type="String" />
                       <asp:Parameter Name="OKC" Type="String" />
                       <asp:Parameter Name="TypeOfLearning" Type="String" />
                       <asp:Parameter DbType="Date" Name="DataOfSemesterFinish" />
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="NameStudent" Type="String" />
                       <asp:Parameter Name="NameOfEnglish" Type="String" />
                       <asp:Parameter Name="Specialty" Type="String" />
                       <asp:Parameter Name="OKC" Type="String" />
                       <asp:Parameter Name="TypeOfLearning" Type="String" />
                       <asp:Parameter DbType="Date" Name="DataOfSemesterFinish" />
                       <asp:Parameter Name="FakNumber" Type="Int32" />
                   </UpdateParameters>
                
               </asp:SqlDataSource>       
        
    </form>
</body>
</html>
