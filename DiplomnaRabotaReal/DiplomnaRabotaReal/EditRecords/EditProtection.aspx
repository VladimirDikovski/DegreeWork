<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProtection.aspx.cs" Inherits="DiplomnaRabotaReal.EditRecords.EditProtection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleEditing.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server">
        </asp:ScriptManager>
       <nav>
            <ul>     
                 <p>Редактиране Защита</p>
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
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="1000px" CellSpacing="2" AllowPaging="True">
               <Columns>
                   <asp:CommandField ShowEditButton="True" />
                   <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="ID" />
                   <asp:TemplateField HeaderText="Дата на Защита" SortExpression="DataOfProtection">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtDateOfProtection" runat="server" Text='<%# Bind("DataOfProtection","{0:D}") %>'></asp:TextBox>
                           <ajaxToolkit:CalendarExtender ID="CalendarExtenderDateOfProtection" runat="server" 
                                 TargetControlID="txtDateOfProtection" Format="dd/MM/yyyy">
                             </ajaxToolkit:CalendarExtender>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="LabelDateOfProtection" runat="server" Text='<%# Bind("DataOfProtection","{0:D}") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Заповед Номер" SortExpression="CommandmentNumber">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtComandmentNumber" runat="server" Text='<%# Bind("CommandmentNumber") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorComandmentNumber" runat="server" 
                         ErrorMessage="Полето е задължително"
                         ControlToValidate="txtComandmentNumber"  ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="LabelComandmentNumber" runat="server" Text='<%# Bind("CommandmentNumber") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Комисия Прецедател" SortExpression="CommisionChairman">
                       <EditItemTemplate>                       
                           <asp:DropDownList ID="ddlChairman" runat="server" 
                               OnDataBinding="DropDownList1_DataBinding1" OnDataBound="FixDuplicateBinding" 
                               DataSourceID="SqlDataSource4" DataTextField="Column1" DataValueField="Column1" Text='<%# Bind("CommisionChairman") %>' AppendDataBoundItems="True" >                              
                           </asp:DropDownList>                                               
                           <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" 
                               SelectCommand="SELECT [Position]+' '+ [ScienceDegree] +' ' + [Name] FROM [Manager-Reviewer]">
                           </asp:SqlDataSource>                        
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%# Bind("CommisionChairman") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Член 1" SortExpression="CommisionMember1">
                       <EditItemTemplate>
                           <asp:DropDownList ID="ddlMember1" runat="server"  
                               OnDataBinding="DropDownList1_DataBinding1" OnDataBound="FixDuplicateBinding" 
                               DataSourceID="SqlDataSource4" DataTextField="Column1" DataValueField="Column1" Text='<%# Bind("CommisionMember1") %>' AppendDataBoundItems="True" >                              
                           </asp:DropDownList>                                               
                           <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                               ConnectionString="<%$ ConnectionStrings:TestConnectionString %>"
                               SelectCommand="SELECT [Position]+' '+ [ScienceDegree] +' ' + [Name] FROM [Manager-Reviewer]">
                           </asp:SqlDataSource> 
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="LabelMember1" runat="server" Text='<%# Bind("CommisionMember1") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Член 2" SortExpression="CommisionMember2">
                       <EditItemTemplate>
                            <asp:DropDownList ID="ddlMember2" runat="server"  OnDataBinding="DropDownList1_DataBinding1" 
                                OnDataBound="FixDuplicateBinding"  DataSourceID="SqlDataSource4" 
                                DataTextField="Column1" DataValueField="Column1" Text='<%# Bind("CommisionMember2") %>' AppendDataBoundItems="True" >                              
                           </asp:DropDownList>                                               
                           <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" 
                               SelectCommand="SELECT [Position]+' '+ [ScienceDegree] +' ' + [Name] FROM [Manager-Reviewer]">
                           </asp:SqlDataSource>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="LabelMember2" runat="server" Text='<%# Bind("CommisionMember2") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Член 3" SortExpression="CommisionMember3">
                       <EditItemTemplate>
                         <asp:DropDownList ID="ddlMember3" runat="server"  OnDataBinding="DropDownList1_DataBinding1" OnDataBound="FixDuplicateBinding"  DataSourceID="SqlDataSource4" DataTextField="Column1" 
                             DataValueField="Column1" Text='<%# Bind("CommisionMember3") %>' AppendDataBoundItems="True" >                              
                           </asp:DropDownList>                                               
                           <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                               ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" 
                               SelectCommand="SELECT [Position]+' '+ [ScienceDegree] +' ' + [Name] FROM [Manager-Reviewer]">
                           </asp:SqlDataSource> 
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="LabelMember3" runat="server" Text='<%# Bind("CommisionMember3") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Член 4" SortExpression="CommisionMember4">
                       <EditItemTemplate>
                            <asp:DropDownList ID="ddlMember4" runat="server"  OnDataBinding="DropDownList1_DataBinding1" OnDataBound="FixDuplicateBinding"  DataSourceID="SqlDataSource4" DataTextField="Column1" 
                             DataValueField="Column1" Text='<%# Bind("CommisionMember4") %>' AppendDataBoundItems="True" >                              
                           </asp:DropDownList>                                               
                           <asp:SqlDataSource ID="SqlDataSource8" runat="server"
                               ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" 
                               SelectCommand="SELECT [Position]+' '+ [ScienceDegree] +' ' + [Name] FROM [Manager-Reviewer]">
                           </asp:SqlDataSource> 
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="LabelMember4" runat="server" Text='<%# Bind("CommisionMember4") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="Hall" HeaderText="Зала" SortExpression="Hall" />
                   <asp:TemplateField HeaderText="Час" SortExpression="Time">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtTime"   TextMode="Time" runat="server" Text='<%# Bind("Time") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="LabelTime" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
               
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
               
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
               <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center" VerticalAlign="Top" />
               <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
               <RowStyle BackColor="White" ForeColor="#330099" HorizontalAlign="Center" VerticalAlign="Middle" />
               <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
               <SortedAscendingCellStyle BackColor="#FEFCEB" />
               <SortedAscendingHeaderStyle BackColor="#AF0101" />
               <SortedDescendingCellStyle BackColor="#F6F0C0" />
               <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView><br /><br />
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" DeleteCommand="DELETE FROM [Protection] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [Protection] ([DataOfProtection], [CommandmentNumber], [CommisionChairman], [CommisionMember1], [CommisionMember2], [CommisionMember3], [CommisionMember4], [Hall], [Time]) VALUES (@DataOfProtection, @CommandmentNumber, @CommisionChairman, @CommisionMember1, @CommisionMember2, @CommisionMember3, @CommisionMember4, @Hall, @Time)" SelectCommand="SELECT * FROM [Protection]" UpdateCommand="UPDATE [Protection] SET [DataOfProtection] = @DataOfProtection, [CommandmentNumber] = @CommandmentNumber, [CommisionChairman] = @CommisionChairman, [CommisionMember1] = @CommisionMember1, [CommisionMember2] = @CommisionMember2, [CommisionMember3] = @CommisionMember3, [CommisionMember4] = @CommisionMember4, [Hall] = @Hall, [Time] = @Time WHERE [ID] = @original_ID" OldValuesParameterFormatString="original_{0}">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter DbType="Date" Name="DataOfProtection" />
                        <asp:Parameter Name="CommandmentNumber" Type="String" />
                        <asp:Parameter Name="CommisionChairman" Type="String" />
                        <asp:Parameter Name="CommisionMember1" Type="String" />
                        <asp:Parameter Name="CommisionMember2" Type="String" />
                        <asp:Parameter Name="CommisionMember3" Type="String" />
                        <asp:Parameter Name="CommisionMember4" Type="String" />
                        <asp:Parameter Name="Hall" Type="String" />
                        <asp:Parameter DbType="Time" Name="Time" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter DbType="Date" Name="DataOfProtection" />
                        <asp:Parameter Name="CommandmentNumber" Type="String" />
                        <asp:Parameter Name="CommisionChairman" Type="String" />
                        <asp:Parameter Name="CommisionMember1" Type="String" />
                        <asp:Parameter Name="CommisionMember2" Type="String" />
                        <asp:Parameter Name="CommisionMember3" Type="String" />
                        <asp:Parameter Name="CommisionMember4" Type="String" />
                        <asp:Parameter Name="Hall" Type="String" />
                        <asp:Parameter DbType="Time" Name="Time" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>    
                 <asp:ValidationSummary runat="server"  ForeColor="Red"></asp:ValidationSummary>          
            </center>


    </form>
</body>
</html>
