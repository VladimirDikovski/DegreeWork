<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditFiles.aspx.cs" Inherits="DiplomnaRabotaReal.EditRecords.EditFiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleEditing.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     
                 <nav>
            <ul>     
                 <p>Редактиране Файл</p>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" Width="600px">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:TemplateField HeaderText="Пореден Номер">
                        <ItemTemplate>
                           <asp:Label ID="lblId" runat="server" Text='<%# Eval("IDFiles") %>'></asp:Label>                                                
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:BoundField  DataField="GraduatedId" HeaderText="Факултетен Номер" ReadOnly="true"/>
                    <asp:TemplateField HeaderText="Задание (Име)" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("AssignmentName") %>' ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("AssignmentName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Задание (Файл)">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("AssignmentName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUploadAssigment" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Дипломна работа(Име)" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("DegreeWorkName") %> '></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("DegreeWorkName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Дипломна работа(файл)">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("DegreeWorkName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUploadDegreeWork" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Пореден номер" Visible="false">
                        <ItemTemplate>
                             <asp:Label ID="Label5" runat="server" Text='<%# Eval("DegreeWorkId") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("DegreeWorkId") %>'  Visible="false"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>  
                                <HeaderStyle CssClass="hdrow" />  
                                <ItemTemplate>  
                                    <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="Edit"  Height="30px" Width="60px"/>                                       
                                </ItemTemplate>  
                                <EditItemTemplate>  
                                    <asp:Button ID="btnupdate" runat="server" Text="Update" CommandName="Update"  />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" />                                   
                                </EditItemTemplate>  
                            </asp:TemplateField>  
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
                <table>
                    <tr>
                        <td>
                             <asp:Label ID="lblMassenger" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                  
                </table>
                </center>
       
    </form>
</body>
</html>
