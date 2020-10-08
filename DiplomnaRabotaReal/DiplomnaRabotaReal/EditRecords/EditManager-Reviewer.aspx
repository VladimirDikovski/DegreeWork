<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditManager-Reviewer.aspx.cs" Inherits="DiplomnaRabotaReal.EditRecords.EditManager_Reviewer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleEditing.css" rel="stylesheet" />
</head

>
<body>
    <form id="form1" runat="server">
              <nav>
            <ul>     
                 <p>Редактиране Ръководител</p>
                 <li><a href="EditStudent.aspx">Студент(Edit)</a></li>
                 <li><a href="EditProtection.aspx">Защита(Edit)</a></li>
                 <li><a href="EditFiles.aspx">Дипломни Файлове(Edit)</a></li>
                <li><a href="EditManager-Reviewer.aspx">Ръководител-Рецензент(Edit)</a></li>
                <li><a href="/Data/NavigationBar.aspx">Онсовното Меню</a></li>             
                 
            </ul>          
        </nav>
        <br />
        <br />
        <br />
      
            <center>
           <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" CellSpacing="2" Width="1000px">
               <AlternatingRowStyle BackColor="PaleGoldenrod" />
               <Columns>
                   <asp:CommandField ShowEditButton="True" />
                   <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                   <asp:TemplateField HeaderText="Позиция" SortExpression="Position">
                       <EditItemTemplate>
                        <asp:DropDownList ID="ddlPossition" runat="server" Text='<%# Bind("Position") %>'  OnDataBinding="DropDownList1_DataBinding1" OnDataBound="FixDuplicateBinding">
                               <asp:ListItem Value="-1">Select </asp:ListItem>
                             <asp:ListItem>Външен</asp:ListItem>
                            <asp:ListItem>Доц.</asp:ListItem>
                            <asp:ListItem>Ас.</asp:ListItem>
                            <asp:ListItem>Гл.Ас.</asp:ListItem>                           
                            <asp:ListItem>Проф.</asp:ListItem>
                            <asp:ListItem>Пр.</asp:ListItem>
                            <asp:ListItem>Ст.Пр.</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPossition" runat="server" 
                            ErrorMessage="Моля въведете стойност" ControlToValidate="ddlPossition" ForeColor="Red" Display="Dynamic" 
                            InitialValue="-1">*</asp:RequiredFieldValidator>
                        </asp:DropDownList>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="LabelPossition" runat="server" Text='<%# Bind("Position") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Научна Степен" SortExpression="ScienceDegree">
                       <EditItemTemplate>
                            <asp:DropDownList ID="ddlScienceDegree" runat="server" Text='<%# Bind("ScienceDegree") %>'  OnDataBinding="DropDownList1_DataBinding1" OnDataBound="FixDuplicateBinding">
                               <asp:ListItem Value="-1">Select </asp:ListItem>                              
                            <asp:ListItem>Док.</asp:ListItem>
                            <asp:ListItem>Днн</asp:ListItem>
                            <asp:ListItem>Липсва</asp:ListItem>                        
                           </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorScienceDegree" runat="server" 
                            ErrorMessage="Моля въведете стойност" ControlToValidate="ddlScienceDegree" ForeColor="Red" Display="Dynamic" 
                            InitialValue="-1">*</asp:RequiredFieldValidator>
                        </asp:DropDownList>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="labelSciendeDegree" runat="server" Text='<%# Bind("ScienceDegree") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Име" SortExpression="Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" 
                       runat="server" ErrorMessage="Полето е задължително" ControlToValidate="txtName" 
                       Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>                  
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="labelName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Катедра" SortExpression="Department">
                       <EditItemTemplate>
                            <asp:DropDownList ID="ddlDepartment" runat="server" Text='<%# Bind("Department") %>'  OnDataBinding="DropDownList1_DataBinding1" OnDataBound="FixDuplicateBinding">
                               <asp:ListItem Value="-1">Select </asp:ListItem>
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
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlDepartment" runat="server" 
                            ErrorMessage="Моля въведете стойност" ControlToValidate="ddlDepartment" ForeColor="Red" Display="Dynamic" 
                            InitialValue="-1">*</asp:RequiredFieldValidator>
                           
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="LabelDepartment" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
               <FooterStyle BackColor="Tan" />
               <HeaderStyle BackColor="Tan" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Top" />
               <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
               <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
               <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
               <SortedAscendingCellStyle BackColor="#FAFAE7" />
               <SortedAscendingHeaderStyle BackColor="#DAC09E" />
               <SortedDescendingCellStyle BackColor="#E1DB9C" />
               <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView><br /><br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" DeleteCommand="DELETE FROM [Manager-Reviewer] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Manager-Reviewer] ([Position], [ScienceDegree], [Name], [Department]) VALUES (@Position, @ScienceDegree, @Name, @Department)" SelectCommand="SELECT * FROM [Manager-Reviewer]" UpdateCommand="UPDATE [Manager-Reviewer] SET [Position] = @Position, [ScienceDegree] = @ScienceDegree, [Name] = @Name, [Department] = @Department WHERE [ID] = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Position" Type="String" />
                        <asp:Parameter Name="ScienceDegree" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Department" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Position" Type="String" />
                        <asp:Parameter Name="ScienceDegree" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Department" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"></asp:ValidationSummary>
                      </center>
        
    </form>
</body>
</html>
