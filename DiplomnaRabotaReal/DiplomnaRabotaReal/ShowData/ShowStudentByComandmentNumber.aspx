<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowStudentByComandmentNumber.aspx.cs" Inherits="DiplomnaRabotaReal.ShowData.ShowStudentByComandmentNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <section>
             <div class="content">                    
                        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" placeholder="Търси по Номер на Заповед" AutoPostBack="True" Width="300px"></asp:TextBox>                 
                       <asp:Button ID="Button1" runat="server" Text="Refresh" OnClick="Button1_Click" /><br /><br /><br />         
            <asp:Panel ID="Panel1" runat="server">
               <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="1000px">
                   <Columns>
                       <asp:TemplateField HeaderText="Факултетен Номер" SortExpression="StudentFakNumber">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StudentFakNumber") %>' Width="300"></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("StudentFakNumber") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:BoundField DataField="NameStudent" HeaderText="Име" SortExpression="NameStudent" />
                       <asp:BoundField DataField="OKC" HeaderText="OKC" SortExpression="OKC" />
                       <asp:BoundField DataField="Specialty" HeaderText="Специалност" SortExpression="Specialty" />
                       <asp:BoundField DataField="TypeOfLearning" HeaderText="Вид На Обучение" SortExpression="TypeOfLearning" />
                       <asp:BoundField DataField="CommandmentNumber" HeaderText="Заповед Номер" SortExpression="CommandmentNumber" />
                   </Columns>
                   <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                   <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                   <RowStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                   <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                   <SortedAscendingCellStyle BackColor="#FFF1D4" />
                   <SortedAscendingHeaderStyle BackColor="#B95C30" />
                   <SortedDescendingCellStyle BackColor="#F1E5CE" />
                   <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server">
                 <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="1000px">

                     <AlternatingRowStyle BackColor="#CCCCCC" />

                     <Columns>
                         <asp:TemplateField HeaderText="Факултетен Номер" SortExpression="StudentFakNumber">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StudentFakNumber") %>' Width="300px"></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("StudentFakNumber") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:BoundField DataField="NameStudent" HeaderText="Име" SortExpression="NameStudent" />
                         <asp:BoundField DataField="OKC" HeaderText="OKC" SortExpression="OKC" />
                         <asp:BoundField DataField="Specialty" HeaderText="Специалност" SortExpression="Specialty" />
                         <asp:BoundField DataField="TypeOfLearning" HeaderText="Вид на Обучение" SortExpression="TypeOfLearning" />
                         <asp:BoundField DataField="CommandmentNumber" HeaderText="Заповед Номер" SortExpression="CommandmentNumber" />
                     </Columns>

                     <FooterStyle BackColor="#CCCCCC" />
                     <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                     <RowStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#808080" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#383838" />
                 </asp:GridView>
                     </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="showStudentByComandmentNumber" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="CommandmentNumber" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
      
             </div>
        </section>
             
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="showStudentByComandmentNumber2" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
               
    </form>
</body>
</html>
