<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NestedGridView.aspx.cs" Inherits="NestedGridView.NestedGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nested Grid View</title>
    <script language="javascript" type="text/javascript">
        function expandcollapse(name) {
            var div = document.getElementById(name);
        
            var img = document.getElementById('img' + name);
            if (div.style.display == 'none') {
                div.style.display = "inline";
                img.src = "Images/minus.gif";
               
            } else {
                div.style.display = "none";
                img.src = "Images/plus.gif";
            }
        }

    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView runat="server" ID="parentgrid" AutoGenerateColumns="false" DataKeyNames="CountryId" GridLines="Both" HorizontalAlign="Center" Width="300" BorderColor="Thistle" OnRowDataBound="parentgrid_RowDataBound" BorderStyle="Solid" BorderWidth="1px">
                <HeaderStyle HorizontalAlign="Center" BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                <RowStyle BackColor="#E1E1E1" />
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField ItemStyle-Width="20px">
                        <ItemTemplate>
                            <a href="JavaScript:expandcollapse('div<%# Eval("CountryId") %>');">
                                <img id='imgdiv<%# Eval("CountryId") %>' width="9" border="0" <img src="Images/plus.gif" />
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CountryId" HeaderText="CountryId" HeaderStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="CountryName" HeaderText="CountryName" HeaderStyle-HorizontalAlign="Left" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <tr>
                                <td colspan="100%">
                                    <div id="div<%# Eval("CountryId") %>" style="display:table-row; position: relative; left: 15px; overflow: auto">
                                        <asp:GridView ID="gvChildGrid" runat="server" AutoGenerateColumns="false" GridLines="Both" Width="250px" BorderColor="#df5015" >
                                            <HeaderStyle  BackColor="#df5015" Font-Bold="true" ForeColor="White"/>
                                            <RowStyle BackColor="#E1E1E1" />
                                            <AlternatingRowStyle BackColor="White" />
                                            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="StateID" HeaderText="StateID" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField DataField="StateName" HeaderText="StateName" HeaderStyle-HorizontalAlign="Left" />
                                            </Columns>
                                            
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
