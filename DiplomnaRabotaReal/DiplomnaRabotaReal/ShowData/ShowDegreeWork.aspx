<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowDegreeWork.aspx.cs" Inherits="DiplomnaRabotaReal.ShowData.ShowDegreeWork" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleShowData.css" rel="stylesheet" />
    <title></title>
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
        <section>
              <div class="content">
                    <h1>
            Данни за Дипломната работа
        </h1><br /><br /><br /> 
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" GridLines="None" CellSpacing="1" AllowSorting="True" Font-Bold="True" Width="1000px">
            <Columns>
                
                <asp:BoundField DataField="Consultant" HeaderText="Консултант" />
                <asp:BoundField DataField="DateOfSetting" HeaderText="Дата на задаване" DataFormatString="{0:D}"/>
                <asp:BoundField DataField="DeliveryTime" HeaderText="Срок за предаване" DataFormatString="{0:D}"/> 
                <asp:BoundField DataField="DateOfSubmission" HeaderText="Дата На Предаване" DataFormatString="{0:D}"/>                            
                <asp:TemplateField HeaderText="Ръководител">
                    <ItemTemplate>
                        <asp:LinkButton ID="ManagerId" runat="server" Text='<%# Eval("ManagerId") %>' OnClick="ManagerId_Click">LinkButton</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Рецензент">
                    <ItemTemplate>
                        <asp:LinkButton ID="ReviewerId" runat="server" Text='<%# Eval("ReviewerId") %>'  OnClick="ReviewerId_Click">LinkButton</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ИД(Оценки)">
                    <ItemTemplate>
                     <asp:LinkButton ID="linkButtonClickRating"  Text='<%# Eval("ID") %>' OnClick="linkButtonClickRating_Click" runat="server">LinkButton</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="ИД(Дилпомни файлове)">
                    <ItemTemplate>
                     <asp:LinkButton ID="linkButtonClickDegreeWorkFiles"  Text='<%# Eval("ID") %>'  OnClick="linkButtonClickDegreeWorkFiles_Click" runat="server">LinkButton</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>          
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />          
        </asp:GridView>
              </div>
        </section> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>          
    </form>
</body>
</html>
