﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="Online_Ticket_System.Account.ManageAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel2" runat="server" DefaultButton="EditLogSave">
        <table>
            <tr>
                <td id="LeftContent"></td>
                <td id="CenterContent">
                    <div id="ManContent">
                        <div id="ManTitle">Manage Account</div>
                        <table>
                            <tr id="DisLogInfo" runat="server">
                                <td>
                                    <table>
                                        <tr style="background-color: lightgray; color: black; font-size: x-large">
                                            <td style="text-align: left">Login Infomation</td>
                                            <td style="text-align: right">
                                                <div>
                                                    <asp:LinkButton ID="LoginEdit" runat="server" Font-Size="Small" OnClick="LoginEdit_Click">Edit</asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Username:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogUname" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Password:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogPass" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr id="EditLogInfo" runat="server">

                                <td>
                                    <table>
                                        <tr style="background-color: lightgray; color: black; font-size: x-large">
                                            <td style="text-align: left">Login Infomation</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div style="margin-bottom: 1px">
                                                    <asp:Label runat="server" Text="8-15 charater, uppercase, lowercase and number" Font-Size="Small" ForeColor="Gray"></asp:Label>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Old Password:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditLogOldPass" runat="server" CssClass="EditLogBox" ValidationGroup="EditLog" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditLogUnameValidator" runat="server" ErrorMessage="*" ControlToValidate="EditLogOldPass" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div style="margin-bottom: 1px">
                                                    <asp:Label runat="server" Text="8-15 charater, uppercase, lowercase and number" Font-Size="Small" ForeColor="Gray"></asp:Label>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>New Password:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditLogPass" runat="server" CssClass="EditLogBox" ValidationGroup="EditLog" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditLogPassValidator" runat="server" ErrorMessage="*" ControlToValidate="EditLogPass" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Label ID="EditLogMess" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div>
                                                    <asp:Button ID="EditLogSave" runat="server" Text="Save" CssClass="EditButt" ValidationGroup="EditLog" OnClick="EditLogSave_Click" />
                                                    <asp:Button ID="EditLogCancel" runat="server" Text="Cancel" CssClass="EditButt" OnClick="EditLogCancel_Click" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr id="DisAccInfor" runat="server">
                                <td>
                                    <table>
                                        <tr style="background-color: lightgray; color: black; font-size: x-large">
                                            <td style="text-align: left">Account Infomation</td>
                                            <td style="text-align: right">
                                                <div>
                                                    <asp:LinkButton ID="AccEdit" runat="server" Font-Size="Small" OnClick="AccEdit_Click">Edit</asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Last Name:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogLname" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>First Name:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogFname" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Address 1:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogAdd1" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Address 2:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogAdd2" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>City:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogCity" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>State:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogState" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>ZipCode:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogZip" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Phone Number:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogPhone" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Email:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label ID="LogEmail" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="EditAccInfo" runat="server">
                                <td>
                                    <table>
                                        <tr style="background-color: lightgray; color: black; font-size: x-large">
                                            <td style="text-align: left">Account Infomation</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Last Name:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditAccLname" runat="server" CssClass="EditLogBox" ValidationGroup="EditAcc"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditAccLnameValidator" runat="server" ErrorMessage="*" ControlToValidate="EditAccLname" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>First Name:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditAccFname" runat="server" CssClass="EditLogBox" ValidationGroup="EditAcc"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditAccFnameValidator" runat="server" ErrorMessage="*" ControlToValidate="EditAccFname" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Address 1:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditAccAdd1" runat="server" CssClass="EditLogBox" ValidationGroup="EditAcc"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditAccAdd1Validator" runat="server" ErrorMessage="*" ControlToValidate="EditAccAdd1" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Address 2:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditAccAdd2" runat="server" CssClass="EditLogBox" ValidationGroup="EditAcc"></asp:TextBox>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>City:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditAccCity" runat="server" CssClass="EditLogBox" ValidationGroup="EditAcc"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditAccCityValidator" runat="server" ErrorMessage="*" ControlToValidate="EditAccCity" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>State:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditAccState" runat="server" CssClass="EditLogBox" ValidationGroup="EditAcc"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditAccStateValidator" runat="server" ErrorMessage="*" ControlToValidate="EditAccState" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>ZipCode:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditAccZip" runat="server" CssClass="EditLogBox" ValidationGroup="EditAcc"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditAccZipValidator" runat="server" ErrorMessage="*" ControlToValidate="EditAccZip" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Phone Number:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditAccPhone" runat="server" CssClass="EditLogBox" ValidationGroup="EditAcc"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditAccPhoneValidator" runat="server" ErrorMessage="*" ControlToValidate="EditAccPhone" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Email:</div>
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:TextBox ID="EditAccEmail" runat="server" CssClass="EditLogBox" ValidationGroup="EditAcc"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="EditAccEmailValidator" runat="server" ErrorMessage="*" ControlToValidate="EditAccEmail" ForeColor="Red" ValidationGroup="EditAcc"></asp:RequiredFieldValidator>

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Label ID="EditAccMess" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button ID="EditAccSave" runat="server" Text="Save" CssClass="EditButt" ValidationGroup="EditAcc" OnClick="EditAccSave_Click" />
                                                <asp:Button ID="EditAccCancel" runat="server" Text="Cancel" CssClass="EditButt" OnClick="EditAccCancel_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </div>
                </td>
                <td id="RightContent"></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>