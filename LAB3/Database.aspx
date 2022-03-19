<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Database.aspx.cs" Inherits="LAB3.Database" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .class1{
            min-width:83px;
        }
        .class2{
            min-width:200px;
        }
        .class3{
            min-width:20px;
        }
        .class4{
            min-width:100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="Заказчики" runat="server" ConnectionString='<%$ ConnectionStrings:ASP.NET%>'  InsertCommand="INSERT INTO Заказчики([Фамилия], [Имя], [Отчество], [Компания], [Адрес], [Телефон], [Почта]) VALUES ( @Фамилия, @Имя, @Отчество, @Компания, @Адрес, @Телефон, @Почта)" DeleteCommand="DELETE FROM Заказчики WHERE ID_Заказчика=@ID_Заказчика " SelectCommand="SELECT ID_Заказчика, Фамилия, Имя, Отчество, Компания, Адрес, Телефон, Почта FROM Заказчики " UpdateCommand="UPDATE Заказчики SET Фамилия=@Фамилия, Имя=@Имя, Отчество=@Отчество, Компания=@Компания, Адрес=@Адрес, Телефон=@Телефон, Почта=@Почта WHERE ID_Заказчика = @ID_Заказчика">
                
                <UpdateParameters>
                    <asp:Parameter  Name="Фамилия" Type="String" />
                    <asp:Parameter  Name="Имя" Type="String" />
                    <asp:Parameter  Name="Отчество" Type="String" />
                    <asp:Parameter  Name="Компания" Type="String" />
                    <asp:Parameter  Name="Адрес" Type="String" />
                    <asp:Parameter  Name="Телефон" Type="String" />
                    <asp:Parameter  Name="Почта" Type="String" />
                    <asp:Parameter  Name="ID_Заказчика" Type="String" />
                </UpdateParameters>

                <InsertParameters>
                    <asp:Parameter  Name="Фамилия" Type="String" />
                    <asp:Parameter  Name="Имя" Type="String" />
                    <asp:Parameter  Name="Отчество" Type="String" />
                    <asp:Parameter  Name="Компания" Type="String" />
                    <asp:Parameter  Name="Адрес" Type="String" />
                    <asp:Parameter  Name="Телефон" Type="String" />
                    <asp:Parameter  Name="Почта" Type="String" />
                </InsertParameters>

            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Заказы" runat="server" ConnectionString='<%$ ConnectionStrings:ASP.NET%>' SelectCommand="SELECT ID_Заказа, ID_Заказчика, Сумма_заказа FROM Заказы " UpdateCommand="UPDATE Заказы SET ID_Заказчика=@ID_Заказчика , Сумма_заказа=@Сумма_заказа WHERE ID_Заказа = @ID_Заказа" DeleteCommand="DELETE FROM Заказы WHERE ID_Заказа=@ID_Заказа" InsertCommand="INSERT INTO Заказы([ID_Заказчика], [Сумма_заказа]) VALUES (@ID_Заказчика, @Сумма_заказа )" FilterExpression="[ID_Заказчика] = {0}">
                
                <DeleteParameters>
                    <asp:Parameter Name="ID_Заказа"></asp:Parameter>
                </DeleteParameters>

                <FilterParameters>
                    <asp:ControlParameter Name="ID_Заказа" ControlID="Таблица_заказчиков" PropertyName="SelectedValue" DefaultValue="0" />
                </FilterParameters>

                <InsertParameters>
                    <asp:Parameter Name="ID_Заказчика"></asp:Parameter>
                    <asp:Parameter Name="Сумма_заказа"></asp:Parameter>
                </InsertParameters>

                <UpdateParameters>
                    <asp:Parameter Name="ID_Заказа"></asp:Parameter>
                    <asp:Parameter Name="Сумма_заказа"></asp:Parameter>
                    <asp:Parameter Name="ID_Заказчика"></asp:Parameter>
                </UpdateParameters>

            </asp:SqlDataSource>


            <p><b>Заказчики</b></p>

            <asp:GridView ID="Таблица_заказчиков" ShowHeaderWhenEmpty="true"  BorderWidth="1" Width="800" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Заказчика" DataSourceID="Заказчики" AllowPaging="True" CellPadding="6" CellSpacing="10"  >
                
                <Columns>

                     <asp:TemplateField ShowHeader="True" HeaderStyle-BorderWidth="0" FooterStyle-BorderWidth="0"   HeaderStyle-CssClass="class1"  >
                         <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Выбор" CommandName="Select" CausesValidation="False" ID="Select" Width="70" ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="True" HeaderText="Управление" HeaderStyle-BorderWidth="0" FooterStyle-BorderWidth="0" HeaderStyle-CssClass="class4" ItemStyle-HorizontalAlign="Center">
                        <EditItemTemplate>
                            <asp:LinkButton runat="server" Text="Обновить" CommandName="Update" CausesValidation="True" ID="Update" Width="70" ></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Отмена" CommandName="Cancel" CausesValidation="False" ID="LinkButton4"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Правка" CommandName="Edit" CausesValidation="False" ID="Edit" Width="70" ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="true" HeaderStyle-BorderWidth="0" FooterStyle-BorderWidth="0"   HeaderStyle-CssClass="class1">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Удалить" CommandName="Delete" CausesValidation="False" ID="Delete" Width="70"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ID_Заказчика" InsertVisible="False" SortExpression="Id" HeaderStyle-CssClass="class3">
                        <EditItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("ID_Заказчика") %>' ID="Label1"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ID_Заказчика") %>' ID="Label1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Фамилия" SortExpression="Фамилия" HeaderStyle-CssClass="class2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Фамилия") %>' ID="Фамилия"  Width="100"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Фамилия") %>' ID="Фамилия"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Имя" SortExpression="Имя" HeaderStyle-CssClass="class2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Имя") %>' ID="Имя"  Width="100"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Имя") %>' ID="Имя"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Отчество" SortExpression="Отчество" HeaderStyle-CssClass="class2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Отчество") %>' ID="Отчество"  Width="100"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Отчество") %>' ID="Отчество"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Компания" SortExpression="Компания" HeaderStyle-CssClass="class2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Компания") %>' ID="Компания"  Width="100"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Компания") %>' ID="Компания"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Адрес" SortExpression="Адрес" HeaderStyle-CssClass="class2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Адрес") %>' ID="Адрес"  Width="100"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Адрес") %>' ID="Адрес"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Телефон" SortExpression="Телефон" HeaderStyle-CssClass="class2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Телефон") %>' ID="Телефон"  Width="100"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Телефон") %>' ID="Телефон"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Почта" SortExpression="Почта" HeaderStyle-CssClass="class2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Почта") %>' ID="Почта"  Width="100"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Почта") %>' ID="Почта"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
                <SelectedRowStyle BackColor="Gray" />
                
            </asp:GridView>

            <asp:Label runat="server" ID="Lable"></asp:Label>
            <asp:Table runat="server" ID="AddCustomer" Width="800"  GridLines="Both"  CellPadding="6" CellSpacing="10" >
                      
                        <asp:TableRow>  

                            <asp:TableCell CssClass="class1" BorderWidth="0"></asp:TableCell>
                            <asp:TableCell   HorizontalAlign="Center" VerticalAlign="Top" CssClass="class4" BorderWidth="0">
                                <asp:LinkButton runat="server" Text="Добавить" CommandName="Insert" OnCommand="Add_customer"   ValidationGroup="Insertion" CausesValidation="True" ID="LinkButton1" ></asp:LinkButton>       
                            </asp:TableCell>

                            <asp:TableCell CssClass="class1" BorderWidth="0"></asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="class3">
                            </asp:TableCell>   

                            <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="class2">
                                <asp:TextBox runat="server" ID="Фамилия" Width="100" ></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="SurnameValidator" Width="100" runat="server" ValidationGroup="Insertion"  ForeColor="Red" ControlToValidate="Фамилия" Display="Dynamic"  ErrorMessage="Поле не должно быть пустым">Поле не должно<br/>быть пустым</asp:RequiredFieldValidator>
                            </asp:TableCell>   

                            <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="class2">
                                <asp:TextBox runat="server" ID="Имя" Width="100" ></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="NameValidator" Width="100" runat="server" ForeColor="Red" ValidationGroup="Insertion" ControlToValidate="Имя" Display="Dynamic" ErrorMessage="Поле не должно быть пустым">Поле не должно<br/>быть пустым</asp:RequiredFieldValidator>
                            </asp:TableCell>

                            <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="class2">
                                <asp:TextBox runat="server" Id="Отчество"  Width="100"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="PatronymicValidator" Width="100" runat="server" ForeColor="Red" ValidationGroup="Insertion" ControlToValidate="Отчество" Display="Dynamic" ErrorMessage="Поле не должно быть пустым">Поле не должно<br/>быть пустым</asp:RequiredFieldValidator>
                            </asp:TableCell> 

                            <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="class2">
                                <asp:TextBox runat="server" Id="Компания" Width="100" CausesValidation="true"   ></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="CompanyValidator" runat="server" Width="100" ForeColor="Red" ValidationGroup="Insertion"  ControlToValidate="Компания" Display="Dynamic" ErrorMessage="Поле не должно быть пустым">Поле не должно<br/>быть пустым</asp:RequiredFieldValidator>
                            </asp:TableCell>

                             <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="class2">
                                <asp:TextBox runat="server" Id="Адрес" Width="100" CausesValidation="true"   ></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="AddressValidator" runat="server" Width="100" ForeColor="Red" ValidationGroup="Insertion"  ControlToValidate="Адрес" Display="Dynamic" ErrorMessage="Поле не должно быть пустым">Поле не должно<br/>быть пустым</asp:RequiredFieldValidator>
                            </asp:TableCell>

                             <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="class2">
                                <asp:TextBox runat="server" Id="Телефон" Width="100" CausesValidation="true"   ></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="PhoneValidator" runat="server" Width="100" ForeColor="Red" ValidationGroup="Insertion"  ControlToValidate="Телефон" Display="Dynamic" ErrorMessage="Поле не должно быть пустым">Поле не должно<br/>быть пустым</asp:RequiredFieldValidator>
                            </asp:TableCell>

                             <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="class2">
                                <asp:TextBox runat="server" Id="Почта" Width="100" CausesValidation="true"   ></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="EmailValidator" runat="server" Width="100" ForeColor="Red" ValidationGroup="Insertion"  ControlToValidate="Почта" Display="Dynamic" ErrorMessage="Поле не должно быть пустым">Поле не должно<br/>быть пустым</asp:RequiredFieldValidator>
                            </asp:TableCell>

                        </asp:TableRow>
            </asp:Table>


            <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insertion" runat="server" />
            <asp:Label runat="server" ID="Orders"></asp:Label>

            <p><b>Заказы</b></p>
        
            <asp:DetailsView runat="server" AutoGenerateDeleteButton="true" AutoGenerateEditButton="true" AutoGenerateInsertButton="true" ID="Таблица_заказов"  DataSourceID="Заказы" AutoGenerateRows="False" DataKeyNames="ID_Заказа" AllowPaging="true"  CellPadding="6" CellSpacing="10">
               
                <Fields>
                    <asp:BoundField DataField="ID_Заказа" HeaderText="ID_Заказа" ReadOnly="True" InsertVisible="False" SortExpression="ID_Заказа"></asp:BoundField>
                    <asp:BoundField DataField="ID_Заказчика" HeaderText="ID_Заказчика" SortExpression="ID_Заказчика" ></asp:BoundField>
                    <asp:BoundField DataField="Сумма_заказа" HeaderText="Сумма_заказа" SortExpression="Сумма_заказа"></asp:BoundField>     
                </Fields>

                <EmptyDataTemplate>
                    <asp:LinkButton runat="server" Text="Создать" CommandName="New" CausesValidation="False" ID="LinkButton3"></asp:LinkButton>
                </EmptyDataTemplate>

            </asp:DetailsView>

        </div>
    </form>
</body>
</html>
