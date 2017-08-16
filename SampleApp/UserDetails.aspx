<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="SampleApp.UserDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="js/User.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <div align="center">
                        <br />
                        <br />

                        <div class="panel panel-default" style="width: 510px; padding: 5px; margin: 5px">
                            <div id="dvTab">


                                <ul class="nav nav-tabs" role="tablist">
                                    <li><a href="#Regtab" aria-controls="Regtab" role="tab" data-toggle="tab">Submit User Details</a></li>
                                    <li><a href="#Viewtab" aria-controls="Viewtab" role="tab" data-toggle="tab">View User Details</a></li>

                                </ul>

                                <div class="tab-content" style="padding-top: 10px">

                                    <div role="tabpanel" class="tab-pane active" id="Regtab">

                                        <div class="table-responsive">
                                            <table style="width: auto" class="table table-striped">

                                                <tr>
                                                    <td class="td-align-Right">
                                                        <asp:Label ID="Label1" CssClass="btn btn-labeled btn-default" runat="server" Text="Name"></asp:Label>
                                                    </td>
                                                    <td class="td-align-left">
                                                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server" ValidationGroup="reg"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="#FF0066" ValidationGroup="reg"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="td-align-Right">
                                                        <asp:Label ID="Label4" CssClass="btn btn-labeled btn-default" runat="server" Text="User Name"></asp:Label>
                                                    </td>
                                                    <td class="td-align-left">
                                                        <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUserName" ErrorMessage="*" ForeColor="#FF0066" ValidationGroup="reg"></asp:RequiredFieldValidator>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-align-Right">
                                                        <asp:Label ID="Label2" runat="server" CssClass="btn btn-labeled btn-default" Text="Mobile Number"></asp:Label>
                                                    </td>
                                                    <td class="td-align-left">
                                                        <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" ValidationGroup="reg"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobile" ErrorMessage="*" ForeColor="#FF0066" ValidationGroup="reg"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobile" ErrorMessage="Invalid Number" ForeColor="#CC3300" ValidationExpression="\d{10}" ValidationGroup="reg"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-align-Right">
                                                        <asp:Label ID="Label7" runat="server" CssClass="btn btn-labeled btn-default" Text="Password"></asp:Label>
                                                    </td>
                                                    <td class="td-align-left">
                                                        <asp:TextBox ID="Password" CssClass="form-control" runat="server" ValidationGroup="reg" TextMode="Password"></asp:TextBox>
                                                        </td> 
                                                </tr> 
                                                <tr>
                                                    <td class="td-align-Right">
                                                        <asp:Label ID="Label3" runat="server" CssClass="btn btn-labeled btn-default" Text="Email"></asp:Label>
                                                    </td>
                                                    <td class="td-align-left">
                                                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" ValidationGroup="reg"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="#FF0066" ValidationGroup="reg"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="#CC3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="reg"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-align-Right">&nbsp;</td>
                                                    <td>
                                                        <asp:Button runat="server" OnClick="CreateUser_Click" Text="Submit" CssClass="btn btn-default" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                    <div role="tabpanel" class="tab-pane" id="Viewtab">

                                        <div class="table-responsive">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                                <Columns>
                                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                                                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber"></asp:BoundField>
                                                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"></asp:BoundField>
                                                </Columns>
                                            </asp:GridView>

                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SampleConnectionString %>' SelectCommand="SELECT [Name], [Email], [PhoneNumber], [UserName] FROM [UserDetails]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Panel  End-->

                        <asp:HiddenField ID="HiddenTab" runat="server" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

       


    </form>

</body>
</html>
