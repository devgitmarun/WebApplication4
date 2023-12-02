<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication4._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  <div>
      <div style="font-size:x-large" align="center">Job Fair Form<table class="w-100">
          <tr>
              <td style="width: 102px">&nbsp;</td>
              <td style="width: 113px">Name</td>
              <td>
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="TextBox1"
    ErrorMessage="Name is required." ValidationGroup="validationGroup"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr>
              <td style="width: 102px; height: 31px"></td>
              <td style="width: 113px; height: 31px">Gender</td>
              <td style="height: 31px">
                 

                  <asp:RadioButtonList ID="radioButtonListOptions" runat="server">
    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
</asp:RadioButtonList>

<asp:RequiredFieldValidator ID="requiredFieldValidatorOptions" runat="server" 
    ControlToValidate="radioButtonListOptions" ErrorMessage="Please select an gender"
    InitialValue="0" Display="Dynamic">
</asp:RequiredFieldValidator>



              </td>
          </tr>
          <tr>
              <td style="width: 102px">&nbsp;</td>
              <td style="width: 113px">Email</td>
              <td>
                  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
    ErrorMessage="Email is required." ValidationGroup="validationGroup"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TextBox2"
                ErrorMessage="Invalid email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                Display="Dynamic"></asp:RegularExpressionValidator>
              </td>
          </tr>
          <tr>
              <td style="width: 102px">&nbsp;</td>
              <td style="width: 113px">&nbsp;</td>
              <td>
                  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Clear" Width="87px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
          </tr>
          <tr>
              <td style="width: 102px">&nbsp;</td>
              <td style="width: 113px">&nbsp;</td>
              <td>
                  <asp:GridView ID="GridView1" runat="server">
                  </asp:GridView>
              </td>
          </tr>
          </table>
      </div>
      <br/>
  </div>

</asp:Content>
