<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ratings.aspx.cs" Inherits="DiplomnaRabotaReal.Shablons.Ratings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleShablons.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav>
            <p>Шаблони</p>
            <ul>

                <li><a href="#">Справки</a>
                    <ul>
                        <li><a href="/ShowData/QueryNavigator.aspx">Търси Студент</a></li>
                        <li><a href="/Shablons/ProtectionShablons.aspx">Шаблон(ZAP-1)</a></li>
                        <li><a href="/Shablons/StudentsAndThemes.aspx">Шаблон(Теми)</a></li>
                        <li><a href="/Shablons/Razpredelenie.aspx">Шаблон(Разпределение)</a></li>
                        <li><a href="/Shablons/Ratings.aspx">Шаблон(Оценки)</a></li>
                        <li><a href="/Data/AddCommandmentNumber.aspx">Добави Номер на Заповед</a></li>
                        <li><a href="/Data/AddDateOfSubmission.aspx">Дата на Предаване(Дипломна)</a></li>
                        <li><a href="/EditRecords/NavigationBarEdit.aspx">Редактиране на запис</a></li>
                        <li><a href="/Data/NavigationBar.aspx">Oсновни Меню</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <section>
            <div class="content">
                <asp:Button ID="Button1" runat="server" Text="Настройки" OnClick="Button1_Click" /><br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Font-Bold="True" Width="1000px">
                    <Columns>
                        <asp:TemplateField HeaderText="Натисни">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%#Eval("ID") %>' OnClick="Unnamed_Click">LinkButton</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Председател" DataField="CommisionChairman" />
                        <asp:BoundField HeaderText="Член 1" DataField="CommisionMember1" />
                        <asp:BoundField HeaderText="Член 2" DataField="CommisionMember2" />
                        <asp:BoundField HeaderText="Член 3" DataField="CommisionMember3" />
                        <asp:BoundField HeaderText="Член 4" DataField="CommisionMember4" />
                        <asp:BoundField HeaderText="Зала" DataField="Hall" />
                        <asp:BoundField HeaderText="Час" DataField="Time" />
                        <asp:BoundField HeaderText="Дата на Защита" DataField="DataOfProtection" DataFormatString="{0:dd-M-yyyy}" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" HorizontalAlign="Center" VerticalAlign="Top" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
            </div>
        </section>

    </form>
</body>
</html>
