<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowStudentByTheme.aspx.cs" Inherits="DiplomnaRabotaReal.ShowData.ShowStudentByTheme" %>

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
              <h1>
                    Данни за Студента
                </h1>
                         
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" Width="300px" Placeholder="Търси по Тема"></asp:TextBox>
               
           <asp:Button ID="Button1" runat="server" CausesValidation="False" Text="Refresh" OnClick="Button1_Click" /><br /><br /><br />
                
              <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FakNumber" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowSorting="true" Width="1000px">
                    <Columns>
                        <asp:TemplateField HeaderText="Факултетен Номер" SortExpression="FakNumber">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FakNumber") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("FakNumber") %>'  OnClick="LinkButton1_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                         <asp:BoundField DataField="Theme" HeaderText="Тема" SortExpression="Theme"/>
                        <asp:BoundField DataField="NameStudent" HeaderText="Име" SortExpression="NameStudent" />
                        <asp:BoundField DataField="NameOfEnglish" HeaderText="Име(English)" SortExpression="NameOfEnglish" />
                        <asp:BoundField DataField="Specialty" HeaderText="Специалност" SortExpression="Specialty" />
                        <asp:BoundField DataField="OKC" HeaderText="OKC" SortExpression="OKC" />
                        <asp:BoundField DataField="TypeOfLearning" HeaderText="Вид Обучение" SortExpression="TypeOfLearning" />
                        <asp:BoundField DataField="DataOfSemesterFinish" HeaderText="Дата(Семестриално Завършване)" SortExpression="DataOfSemesterFinish" DataFormatString="{0:D}" />                     
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="Black"  HorizontalAlign="Center" VerticalAlign="Middle"/>
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                  </asp:Panel>
              <asp:Panel ID="Panel2" runat="server">
              <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="FakNumber" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" ForeColor="Black" GridLines="Vertical" Width="1000px">
                  <AlternatingRowStyle BackColor="#CCCCCC" />
                  <Columns>
                      <asp:TemplateField HeaderText="Факултетен Номер" SortExpression="FakNumber">
                          <EditItemTemplate>
                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("FakNumber") %>'></asp:Label>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("FakNumber") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                          </ItemTemplate>
                      </asp:TemplateField>
                       <asp:BoundField DataField="Theme" HeaderText="Тема" SortExpression="Theme" />
                      <asp:BoundField DataField="NameStudent" HeaderText="Име" SortExpression="NameStudent" />
                      <asp:BoundField DataField="NameOfEnglish" HeaderText="Име(English)" SortExpression="NameOfEnglish" />
                      <asp:BoundField DataField="Specialty" HeaderText="Специалност" SortExpression="Specialty" />
                      <asp:BoundField DataField="OKC" HeaderText="OKC" SortExpression="OKC" />
                      <asp:BoundField DataField="TypeOfLearning" HeaderText="Вид на обучение" SortExpression="TypeOfLearning" />
                      <asp:BoundField DataField="DataOfSemesterFinish" HeaderText="Дата(Семестриално Завършване)" SortExpression="DataOfSemesterFinish" DataFormatString="{0:D}"/>
                     
                  </Columns>
                  <FooterStyle BackColor="#CCCCCC" />
                  <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                  <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                  <RowStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                  <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F1F1F1" />
                  <SortedAscendingHeaderStyle BackColor="#808080" />
                  <SortedDescendingCellStyle BackColor="#CAC9C9" />
                  <SortedDescendingHeaderStyle BackColor="#383838" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT Graduates.*, DegreeWorks.Theme FROM Graduates INNER JOIN DegreeWorks ON Graduates.FakNumber = DegreeWorks.GraduatedId"></asp:SqlDataSource>
              </asp:Panel>
          </div>
       </section>
                  
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" 
                    SelectCommand="SELECT Graduates.*, DegreeWorks.Theme FROM Graduates INNER JOIN DegreeWorks ON Graduates.FakNumber = DegreeWorks.GraduatedId WHERE ([Theme] LIKE '%' + @Theme + '%')">
                            <SelectParameters>
                          <asp:ControlParameter ControlID="TextBox1" Name="Theme" PropertyName="Text" Type="String" />
                        
                      </SelectParameters>
                </asp:SqlDataSource>
               
    </form>
</body>
</html>
