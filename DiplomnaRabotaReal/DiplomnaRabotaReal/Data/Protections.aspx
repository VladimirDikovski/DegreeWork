<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Protections.aspx.cs" Inherits="DiplomnaRabotaReal.Data.Protections" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Defeats</title>
    <link href="StyleData.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
         <nav>
               <p>Защита</p>
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
          <section> 
                 <div class="content">
                        <h2>Данни за Защитата</h2>              
               <asp:TextBox ID="txtDateOfProtection" runat="server" placeholder="Дата на Защита" onfocus="(this.type='date')" Width="300px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidatorDateOfProtecion" 
                  runat="server" 
                  ErrorMessage="Полето е задължително"
                  ControlToValidate="txtDateOfProtection"
                  Display="Dynamic" 
                  ForeColor="Red">*</asp:RequiredFieldValidator><br />

                 <asp:TextBox ID="txtHall" runat="server" placeholder="Зала" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" 
                        ErrorMessage="Полето е задължително" 
                            ControlToValidate="txtHall"
                            ForeColor="Red" 
                            Display="Dynamic">*</asp:RequiredFieldValidator><br />
               
                    <asp:TextBox ID="txtTime" runat="server" placeholder="Час"  onfocus="(this.type='Time')" Width="300px"></asp:TextBox><br />
                
                       <asp:DropDownList ID="ddlChairMan" runat="server" 
                           DataSourceID="SqlDataSource1" 
                           DataTextField="Column1" 
                           DataValueField="Column1"  
                           AppendDataBoundItems="true" Width="300px">
                            <asp:ListItem Value="-1">Председател</asp:ListItem>   
                       </asp:DropDownList> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlChairMan"
                        runat="server" 
                            ErrorMessage="Полето е задължително" 
                        ControlToValidate="ddlChairMan" 
                        InitialValue="-1" 
                        Display="Dynamic"
                        ForeColor="Red">*</asp:RequiredFieldValidator><br />             
                   
                    <asp:DropDownList ID="ddlMember1" runat="server"
                        DataSourceID="SqlDataSource1"
                        DataTextField="Column1" 
                        DataValueField="Column1"  
                        AppendDataBoundItems="True" Width="300px">
                      <asp:ListItem Value="-1">Член 1</asp:ListItem>             
                    </asp:DropDownList> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlMember1" 
                            runat="server" 
                            ErrorMessage="Полето е задължително" 
                            ControlToValidate="ddlMember1" 
                            InitialValue="-1" 
                            Display="Dynamic" 
                            ForeColor="Red">*</asp:RequiredFieldValidator><br />  
                 
                       <asp:DropDownList ID="ddlMember2" runat="server" 
                           DataSourceID="SqlDataSource1"
                           DataTextField="Column1"
                           DataValueField="Column1" 
                           AppendDataBoundItems="true" Width="300px">
                            <asp:ListItem Value="-1">Член 2</asp:ListItem>      
                       </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlMember2" 
                            runat="server" 
                            ErrorMessage="Полето е задължително" 
                            ControlToValidate="ddlMember2" 
                            InitialValue="-1" 
                            Display="Dynamic"
                            ForeColor="Red">*</asp:RequiredFieldValidator><br />
             
                        <asp:DropDownList ID="ddlMember3" runat="server"
                            DataSourceID="SqlDataSource1"
                            DataTextField="Column1" 
                            DataValueField="Column1" 
                            AppendDataBoundItems="true" Width="300px">
                             <asp:ListItem Value="-1">Член 3</asp:ListItem>      
                        </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlMember3"
                              runat="server" 
                            ErrorMessage="Полето е задължително" 
                              ControlToValidate="ddlMember3"
                              InitialValue="-1" 
                            Display="Dynamic" 
                              ForeColor="Red">*</asp:RequiredFieldValidator><br />
                
                        <asp:DropDownList ID="ddlmember4" 
                            runat="server" 
                            DataSourceID="SqlDataSource1" 
                            DataTextField="Column1" 
                            DataValueField="Column1" 
                            AppendDataBoundItems="true" Width="300px">
                        <asp:ListItem Value="-1">Член 4</asp:ListItem>  
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlmember4"
                             runat="server" 
                            ErrorMessage="Полето е задължително" 
                             ControlToValidate="ddlmember4" 
                             InitialValue="-1" 
                            Display="Dynamic" 
                             ForeColor="Red">*</asp:RequiredFieldValidator><br />
                                     
                        <asp:Button ID="btnSet" runat="server" Text="Въведи" OnClick="btnSet_Click1" />   
                        <asp:Button ID="btnClear" runat="server" Text="Изчисти" OnClick="btnClear_Click" CausesValidation="False" /><br />             
                        <asp:Label ID="lblMassanger" runat="server" Text="" Font-Size="Larger"></asp:Label><br />              
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"  DisplayMode="List" ForeColor="Red" Font-Size="Larger"/><br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" 
                            SelectCommand="SELECT [Position] +' ' + [ScienceDegree]+' ' +[Name] FROM [Manager-Reviewer]"></asp:SqlDataSource>            
                  <asp:Button ID="btnAddStudents" runat="server" Text="Добави Студент" OnClick="btnAddStudents_Click" CausesValidation="False"></asp:Button><br />                     
               <asp:HiddenField ID="HFid" runat="server"></asp:HiddenField> 
                     </div>
          </section>
     
    </form>
</body>
</html>
