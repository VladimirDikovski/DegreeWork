<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="DiplomnaRabotaReal.Shablons.Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleShablons.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server">
        </asp:ScriptManager>
        <nav>
            <p>Настройки</p>
            <ul>
                <li><a href="#">Шаблони</a>
                    <ul>
                        <li><a href="/Shablons/ProtectionShablons.aspx">Шаблон(ZAP-1)</a></li>
                        <li><a href="/Shablons/StudentsAndThemes.aspx">Шаблон(Теми)</a></li>
                        <li><a href="/Shablons/Razpredelenie.aspx">Шаблон(Разпределение)</a></li>
                        <li><a href="/Shablons/Ratings.aspx">Шаблон(Оценки)</a></li>
                        <li><a href="/Data/NavigationBar.aspx">Основно Меню</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <br />
        <br />
        <br />

         <center>

                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="500px">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="false" />
                        <asp:TemplateField HeaderText="Ректор(Име)" SortExpression="Rector_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Rector_name") %>' Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Полето е задължително" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red">     
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rector_name") %>' Width="300"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Р-Л Катедра" SortExpression="Department_Head">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Department_Head") %>' Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="Полето е задължително" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red">     
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Department_Head") %>' Width="300"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Р-Л Факултет" SortExpression="Faculty_Head">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Faculty_Head") %>' Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="Полето е задължително" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="Red">     
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Faculty_Head") %>' Width="300"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Път(Файл)" SortExpression="Directory_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Directory_name") %>' Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ErrorMessage="Полето е задължително" ControlToValidate="TextBox4" Display="Dynamic" ForeColor="Red">     
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Directory_name") %>' Width="300"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Име(Файл)" SortExpression="Name_File">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Name_File") %>' Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ErrorMessage="Полето е задължително" ControlToValidate="TextBox5" Display="Dynamic" ForeColor="Red">     
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Name_File") %>' Width="300"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Катедра" SortExpression="Department_Name">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlDepartment" runat="server" AppendDataBoundItems="true" SelectedValue='<%#Bind("Department_Name") %>'>
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
                                    InitialValue="-1"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Department_Name") %>' Width="300"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />

                </asp:DetailsView>
         </center>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" DeleteCommand="DELETE FROM [Additional_Information] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Additional_Information] ([Rector_name], [Department_Head], [Faculty_Head], [Directory_name], [Name_File], [Department_Name]) VALUES (@Rector_name, @Department_Head, @Faculty_Head, @Directory_name, @Name_File, @Department_Name)" SelectCommand="SELECT * FROM [Additional_Information]" UpdateCommand="UPDATE [Additional_Information] SET [Rector_name] = @Rector_name, [Department_Head] = @Department_Head, [Faculty_Head] = @Faculty_Head, [Directory_name] = @Directory_name, [Name_File] = @Name_File, [Department_Name] = @Department_Name WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Rector_name" Type="String" />
                <asp:Parameter Name="Department_Head" Type="String" />
                <asp:Parameter Name="Faculty_Head" Type="String" />
                <asp:Parameter Name="Directory_name" Type="String" />
                <asp:Parameter Name="Name_File" Type="String" />
                <asp:Parameter Name="Department_Name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Rector_name" Type="String" />
                <asp:Parameter Name="Department_Head" Type="String" />
                <asp:Parameter Name="Faculty_Head" Type="String" />
                <asp:Parameter Name="Directory_name" Type="String" />
                <asp:Parameter Name="Name_File" Type="String" />
                <asp:Parameter Name="Department_Name" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
      
    </form>
</body>
</html>
