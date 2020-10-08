<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDateOfSubmission.aspx.cs" Inherits="DiplomnaRabotaReal.Data.AddDateOfSubmission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <nav>
            <p>Дaта Предаване</p>
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
               <center>

        <section>
                 <div class="content"> 
                    
                  <asp:TextBox ID="TextBox1" runat="server"  placeholder="Факултетен Номер на Студент" AutoPostBack="True" Width="300px"></asp:TextBox>
                
                 </div>
                                              
           </section>


   
              <asp:GridView ID="GridView2" runat="server"
                     AutoGenerateColumns="False" DataKeyNames="FakNumber,ID"
                     DataSourceID="SqlDataSource2" BackColor="#DEBA84" 
                     BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                     CellPadding="3" CellSpacing="2" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                         <asp:BoundField DataField="ID" HeaderText="Пореден Номер" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:TemplateField HeaderText="Дата На Предаване" SortExpression="DateOfSubmission">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDataOfSubmition" runat="server" Text='<%# Bind("DateOfSubmission","{0:D}") %>'  Width="300px"  onfocus="(this.type='date')"  placeholder="Дата На Предаване"></asp:TextBox>                             
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateOfSubmission","{0:D}") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FakNumber" HeaderText="Факултетен Номер" SortExpression="FakNumber" ReadOnly="true" />
                        <asp:BoundField DataField="NameStudent" HeaderText="Имена" SortExpression="NameStudent" ReadOnly="true" />                     
                    </Columns>
                     <EditRowStyle ForeColor="Black" BackColor="White" />
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="Black"  HorizontalAlign="Center"/>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
      
               
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" 
                    SelectCommand="SELECT DegreeWorks.DateOfSubmission, Graduates.FakNumber, Graduates.NameStudent, DegreeWorks.ID FROM DegreeWorks INNER JOIN Graduates ON DegreeWorks.GraduatedId = Graduates.FakNumber  WHERE Graduates.FakNumber = @FakNumber" 
                    UpdateCommand="UPDATE DegreeWorks SET DateOfSubmission = @DateOfSubmission WHERE [ID] = @ID">
                    <UpdateParameters>
                        <asp:Parameter Name="DateOfSubmission" />
                    </UpdateParameters>
                    <SelectParameters>
                      <asp:ControlParameter ControlID="TextBox1" Name="FakNumber" PropertyName="Text" Type="Int32" />
                  </SelectParameters>
                </asp:SqlDataSource>   
                      </center>
    </form>
</body>
</html>
