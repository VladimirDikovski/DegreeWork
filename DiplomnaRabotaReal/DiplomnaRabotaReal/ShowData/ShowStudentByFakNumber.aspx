<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowStudentByFakNumber.aspx.cs" Inherits="DiplomnaRabotaReal.ShowData.ShowStudentByFakNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SearchByName</title>
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
                  <h1>Данни За Студента</h1><br /><br />
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Търси по Факултетен Номер" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" Width="300px" BackColor="White" BorderColor="Black" BorderStyle="Solid" ForeColor="#CCCCCC"></asp:TextBox>                   
                <asp:Button ID="Button1" runat="server" Text="Refresh" OnClick="Button1_Click"></asp:Button><br /><br />
              
               
                <asp:Panel ID="Panel1" runat="server">
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="FakNumber" DataSourceID="SqlDataSource1" GridLines="Horizontal" AllowSorting="true" Width="1000px" CellSpacing="2">
              <AlternatingRowStyle BackColor="#F7F7F7" />
              <Columns>
                  <asp:TemplateField HeaderText="Факултетен Номер" SortExpression="FakNumber">
                      <EditItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# Eval("FakNumber") %>'></asp:Label>
                      </EditItemTemplate>
                      <ItemTemplate >
                          <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("FakNumber") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>                  
                  <asp:BoundField DataField="NameStudent" HeaderText="Име" SortExpression="NameStudent" />
                  <asp:BoundField DataField="NameOfEnglish" HeaderText="Име(English)" SortExpression="NameOfEnglish"/>
                  <asp:BoundField DataField="Specialty" HeaderText="Специалност" SortExpression="Specialty" />
                  <asp:BoundField DataField="OKC" HeaderText="OKC" SortExpression="OKC" />
                  <asp:BoundField DataField="TypeOfLearning" HeaderText="Вид на обучение" SortExpression="TypeOfLearning" />
                  <asp:BoundField DataField="DataOfSemesterFinish" HeaderText="Дата(Семестриално Завършване)" SortExpression="DataOfSemesterFinish"  DataFormatString="{0:D}"/>
              </Columns>
              <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
              <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
              <RowStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
              <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
              <SortedAscendingCellStyle BackColor="#F4F4FD" />
              <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
              <SortedDescendingCellStyle BackColor="#D8D8F0" />
              <SortedDescendingHeaderStyle BackColor="#3E3277" />
              </asp:GridView>
                    </asp:Panel>
                <asp:Panel ID="Panel2" runat="server">

                 <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="FakNumber" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="1000px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CellSpacing="2">
                     <AlternatingRowStyle BackColor="#DCDCDC" />
                     <Columns>
                         <asp:TemplateField HeaderText="Факултетен Номер" SortExpression="FakNumber">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("FakNumber") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("FakNumber") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>                         
                         <asp:BoundField DataField="NameStudent" HeaderText="Име" SortExpression="NameStudent" />
                         <asp:BoundField DataField="NameOfEnglish" HeaderText="Име(English)" SortExpression="NameOfEnglish" />
                         <asp:BoundField DataField="Specialty" HeaderText="Специалност" SortExpression="Specialty" />
                         <asp:BoundField DataField="OKC" HeaderText="OKC" SortExpression="OKC" />
                         <asp:BoundField DataField="TypeOfLearning" HeaderText="Вид на Обучение" SortExpression="TypeOfLearning" />
                         <asp:BoundField DataField="DataOfSemesterFinish" HeaderText="Дата(Семестриално Завършване)" SortExpression="DataOfSemesterFinish" DataFormatString="{0:D}" />
                     </Columns>
                     <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                     <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                     <RowStyle BackColor="White" ForeColor="Black"   HorizontalAlign="Center" VerticalAlign="Middle"/>
                     <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#0000A9" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                      </asp:Panel>
              </div>
        </section>
           
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT * FROM [Graduates]"></asp:SqlDataSource>
              
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT * FROM [Graduates] WHERE ([FakNumber] = @FakNumber)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="TextBox1" Name="FakNumber" PropertyName="Text" Type="Int32" />
                  </SelectParameters>
              </asp:SqlDataSource>
    
    </form>
</body>
</html>
