<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCommandmentNumber.aspx.cs" Inherits="DiplomnaRabotaReal.Data.AddCommandmentNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server">
        </asp:ScriptManager>
        <nav>
            <p>Номер на Заповед</p>
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
        <br />
        <br />
        <br />
        <center>


       
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="600px">
                     

                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                     

               <Columns>
                   <asp:CommandField ShowSelectButton="True" />
                   <asp:BoundField DataField="ID" HeaderText="Пореден Номер" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                   <asp:BoundField DataField="DataOfProtection" HeaderText="Дата на защита" SortExpression="DataOfProtection" DataFormatString="{0:D}" />
               </Columns>
                        <FooterStyle BackColor="Tan" />
               <HeaderStyle CssClass="header" BackColor="Tan" Font-Bold="True" />
               <PagerStyle CssClass="pager" BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
               <RowStyle HorizontalAlign="Center" CssClass="rows" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                <br />
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="ID" DataSourceID="SqlDataSource2" GridLines="None" Height="50px" Width="470px" CssClass="auto-style1">
                    <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <Fields>
                      <asp:TemplateField HeaderText="Номер на Заповед" SortExpression="CommandmentNumber">
                      <EditItemTemplate>
                          <asp:TextBox ID="txtComanderNumber" runat="server" Text='<%# Bind("CommandmentNumber") %>' Width="300px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                     ErrorMessage="Полето не може да бъде празно" ControlToValidate="txtComanderNumber" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# Bind("CommandmentNumber") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                        <asp:BoundField DataField="CommisionChairman" HeaderText="Председател" SortExpression="CommisionChairman" ReadOnly="true" />
                        <asp:BoundField DataField="CommisionMember1" HeaderText="Член 1" SortExpression="CommisionMember1" ReadOnly="true" />
                        <asp:BoundField DataField="CommisionMember1" HeaderText="Член 1" SortExpression="CommisionMember1" ReadOnly="true" />
                        <asp:BoundField DataField="CommisionMember2" HeaderText="Член 2" SortExpression="CommisionMember2"  ReadOnly="true"/>
                        <asp:BoundField DataField="CommisionMember3" HeaderText="Член 3" SortExpression="CommisionMember3"  ReadOnly="true"/>
                        <asp:BoundField DataField="CommisionMember4" HeaderText="Член 4" SortExpression="CommisionMember4"  ReadOnly="true"/>
                        <asp:BoundField DataField="Hall" HeaderText="Зала" SortExpression="Hall"  ReadOnly="true"/>
                        <asp:BoundField DataField="Time" HeaderText="Час" SortExpression="Time"  ReadOnly="true"/>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                </asp:DetailsView>
            </center>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>"
            DeleteCommand="DELETE FROM [Protection] WHERE [ID] = @ID"
            InsertCommand="INSERT INTO [Protection] ([CommandmentNumber], [CommisionChairman], [CommisionMember1], [CommisionMember2], [CommisionMember3], [CommisionMember4], [Hall], [Time]) VALUES (@CommandmentNumber, @CommisionChairman, @CommisionMember1, @CommisionMember2, @CommisionMember3, @CommisionMember4, @Hall, @Time)"
            SelectCommand="SELECT [CommandmentNumber], [CommisionChairman], [CommisionMember1], [CommisionMember2], [CommisionMember3], [CommisionMember4], [Hall], [Time], [ID] FROM [Protection] WHERE ([ID] = @ID)"
            UpdateCommand="UPDATE [Protection] SET  [CommandmentNumber] = @CommandmentNumber  WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CommandmentNumber" Type="String" />
                <asp:Parameter Name="CommisionChairman" Type="String" />
                <asp:Parameter Name="CommisionMember1" Type="String" />
                <asp:Parameter Name="CommisionMember2" Type="String" />
                <asp:Parameter Name="CommisionMember3" Type="String" />
                <asp:Parameter Name="CommisionMember4" Type="String" />
                <asp:Parameter Name="Hall" Type="String" />
                <asp:Parameter DbType="Time" Name="Time" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CommandmentNumber" Type="String" />
                <asp:Parameter Name="CommisionChairman" Type="String" />
                <asp:Parameter Name="CommisionMember1" Type="String" />
                <asp:Parameter Name="CommisionMember2" Type="String" />
                <asp:Parameter Name="CommisionMember3" Type="String" />
                <asp:Parameter Name="CommisionMember4" Type="String" />
                <asp:Parameter Name="Hall" Type="String" />
                <asp:Parameter DbType="Time" Name="Time" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT [ID], [DataOfProtection] FROM [Protection]"></asp:SqlDataSource>


    </form>
</body>
</html>
