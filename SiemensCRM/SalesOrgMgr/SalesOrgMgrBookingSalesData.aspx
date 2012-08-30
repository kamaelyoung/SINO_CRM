﻿<%@ Page Title="Bookings data" Language="C#" MasterPageFile="~/SalesOrgMgr/SalesOrgMgrMasterPage.master"
    AutoEventWireup="true" CodeFile="SalesOrgMgrBookingSalesData.aspx.cs" Inherits="SalesOrgMgr_SalesOrgBookingSalesDataReadonly"
    EnableEventValidation="false" %>
     <%@ MasterType VirtualPath="~/SalesOrgMgr/SalesOrgMgrMasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--by ryhang 20110513 item4 add start--%>
    <link href="../js/tableheadstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/fixtablehead.js"></script>

    <script language="javascript" type="text/javascript">
    $(document).ready(
        function()
        {
            var flowtab1=new flowThTable("outbox1",1);
	        flowtab1.creatTable(400);
	        var flowtab2=new flowThTable("outbox2",1);
	        flowtab2.creatTable(400);
        }
    );
    function showRSMData() {
        var SalesOrgID = document.getElementById('<%= this.ddlist_salesOrg.ClientID %>').value;
        var SegmentID = document.getElementById('<%= this.ddlist_segment.ClientID %>').value;
        var RSMID = document.getElementById('<%= this.ddlist_RSM.ClientID %>').value;
        var CountryID = document.getElementById('<%= this.ddlist_country.ClientID %>').value;
        var ConvertFlag = document.getElementById('<%= this.hidConvertFlag.ClientID %>').value;
        var UserID = '<%= Session["GeneralSalesOrgMgrID"] %>'
        paramStr = "&SalesOrgID=" + SalesOrgID + "&SegmentID=" + SegmentID + "&RSMID=" + RSMID + "&CountryID=" + CountryID + "&ConvertFlag=" + ConvertFlag + "&UserID=" + UserID;
        var date = new Date();
        var url = "../BookingBySalesOrgByUser.aspx?TimeFlag="+date.getFullYear()+date.getMonth()+date.getDate()+date.getHours()+date.getMinutes+date.getSeconds()+date.getMilliseconds() + paramStr;
        //window.showModalDialog(url, null, 'dialogHeight=550px;dialogWidth=900px;status=no;resizable=no;scroll=yes;help=no');
        window.open(url, "RSMData", "fullscreen=yes,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
    }
    
    function showSO() {
        var SegmentID = document.getElementById('<%= this.ddlist_segment.ClientID %>').value;
        var SalesOrgID = document.getElementById('<%= this.ddlist_salesOrg.ClientID %>').value;
        var ConvertFlag = document.getElementById('<%= this.hidConvertFlag.ClientID %>').value;
        paramStr = "&SegmentID=" + SegmentID + "&SalesOrgID=" + SalesOrgID + "&ConvertFlag=" + ConvertFlag;
        var date = new Date();
        var url = "SalesOrgMgrBookingBySalesOrgBySegment.aspx?TimeFlag="+date.getFullYear()+date.getMonth()+date.getDate()+date.getHours()+date.getMinutes+date.getSeconds()+date.getMilliseconds() + paramStr;
        //window.showModalDialog(url, null, 'dialogHeight=550px;dialogWidth=900px;status=no;resizable=no;scroll=yes;help=no');
        window.open(url, "SO", "fullscreen=yes,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
    }
    </script>

    <%--The parent of all gridview added attribute id!!!!!!!!!--%>
    <%--by ryhang 20110513 item4 add end--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hidBookingY" runat="server" />
    <asp:HiddenField ID="hidDeliverY" runat="server" />
    <asp:HiddenField ID="hidGVType" runat="server" />
    <asp:HiddenField ID="hidConvertFlag" runat="server" Value="false" />
    <table>
        <tr>
            <td colspan="20">
                <%--by yyan 20110523 itemW7 add start --%>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <contenttemplate>
                        <%--by yyan 20110523 itemW7 add end --%>
                        <asp:Label ID="label_salesOrg" runat="server" Text="SalesOrganization:"></asp:Label>&nbsp;
                        <%--By SJ 20110526 item43 Update start --%>
                        <%-- <asp:DropDownList ID="ddlist_salesOrg" runat="server" Width="350px" AutoPostBack="True"--%>
                        <asp:DropDownList ID="ddlist_salesOrg" runat="server" Width="80px" AutoPostBack="True"
                           >
                            <%--By SJ 20110526 item43 Update End --%>
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:Label ID="label_segment" runat="server" Text="Segment:"></asp:Label>&nbsp;
                        <asp:DropDownList ID="ddlist_segment" runat="server" Width="60px">
                        </asp:DropDownList>
                        <%--by yyan 20110523 itemW7 add start --%>
                    </contenttemplate>
                </asp:UpdatePanel>
                <%--by yyan 20110523 itemW7 add end --%>
            </td>
        </tr>
        <tr>
            <td colspan="20">
                <%--by yyan 20110523 itemW7 add start --%>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <contenttemplate>
                        <%--by yyan 20110523 itemW7 add end --%>
                        <asp:Label ID="label_country" runat="server" Text="SubRegion:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlist_country" runat="server" Width="350px">
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:Button ID="btn_search" runat="server" Text="Search" Width="60px" OnClick="btn_search_Click" />
                        <%--by yyan 20110523 itemW7 add start --%>
                    </contenttemplate>
                    <triggers>
                        <asp:PostBackTrigger ControlID="btn_search" />
                    </triggers>
                </asp:UpdatePanel>
                <%--by yyan 20110523 itemW7 add end --%>
            </td>
        </tr>
        <tr>
            <td colspan="20">
                *****************************************************************************************
            </td>
        </tr>
        <tr>
            <td colspan="20">
                <asp:Panel ID="panel_head" runat="server">
                    <asp:Label ID="label_salesorgAbbr" runat="server" Text="" Font-Bold="True" Font-Size="Large"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="label_headdescription" runat="server" Text="" Font-Bold="True" Font-Size="Medium"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="20">
                <asp:Panel ID="panel_search" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlist_RSM" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlist_RSM_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:DropDownList ID="ddlDataType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDataType_SelectedIndexChanged">
                                </asp:DropDownList>
                                &nbsp;&nbsp;
                                <asp:LinkButton ID="lbtn_editRSM" runat="server" Font-Bold="True" Font-Underline="False"
                                    OnClick="lbtn_editRSM_Click">Edit New Orders-></asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="label_currency" runat="server" Text="" Font-Bold="True"></asp:Label>
                                <br />
                                <asp:Button ID="btn_local" runat="server" Text="" OnClick="btn_local_Click" />
                                <asp:Button ID="btn_EUR" runat="server" Text="kEUR" OnClick="btn_EUR_Click" />
                            </td>
                            <td>
                                Traffic Light:<asp:ImageButton ID="ibtn_red" runat="server" ImageUrl="~/images/red.png"
                                    OnClick="ibtn_red_Click" onclientclick="return confirmS('red')" />
                                <asp:ImageButton ID="ibtn_orange" runat="server" ImageUrl="~/images/orange.png" OnClick="ibtn_orange_Click" onclientclick="return confirmS('yellow')"/>
                                <asp:ImageButton ID="ibtn_green" runat="server" ImageUrl="~/images/green.png" OnClick="ibtn_green_Click" onclientclick="return confirmS('green')"/>
                                |&nbsp;Current Status:<asp:Image ID="img_status" runat="server" /><br />
                                <br />
                                <asp:Label ID="label_sonote" runat="server" Text="To view sales org bookings data, click "></asp:Label>
                                <asp:LinkButton ID="lbtn_skipSO" runat="server" Width="71px" Font-Bold="True" Font-Underline="False"
                                    OnClientClick="showSO();return false;">-> SO </asp:LinkButton>
                                <br />
                                To view RSM bookings data, click <a id="aRSM" href="javascript:showRSMData();" style="font-weight: bold;">
                                    -> RSM Data </a>
                            </td>
                            <td>
                                <asp:Button ID="btn_export" runat="server" Text="Export To Excel" OnClick="btn_export_Click"
                                    BackColor="#66CCFF" Width="230px" Font-Bold="True" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="20" valign="center">
                *****************************************************************************************
            </td>
        </tr>
        <div runat="server" id="div_export">
            <tr>
                <td align="left" valign="top">
                    <div id="outbox1">
                        <asp:GridView ID="gv_bookingbydatebyproduct" runat="server" CellPadding="4" ForeColor="#333333"
                            GridLines="None">
                            <RowStyle BackColor="#EFF3FB" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </div>
                    <div id="outbox2">
                        <asp:GridView ID="gv_bookingTotalbydatebyproduct" runat="server" CellPadding="4"
                            ForeColor="#333333" GridLines="None">
                            <RowStyle BackColor="#EFF3FB" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </div>
                </td>
            </tr>
        </div>
    </table>
</asp:Content>
