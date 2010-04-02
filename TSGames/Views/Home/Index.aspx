<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SetGame.Game>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Set Game
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Set Game</h2>

    <!-- <fieldset>
        <legend>Fields</legend>
    </fieldset> -->
        <!-- <%=Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%=Html.ActionLink("Back to List", "Index") %> -->
        Here are all of the pieces<br />
        <table>
        
        <!-- Row 1 -->
        <tr>
            <td>
                1<br />
                <%=Model.Pieces[0].ColorStr%><br />
                <%=Model.Pieces[0].FillStr%><br />
                <%=Model.Pieces[0].ShapeStr%><br />
                <%=Model.Pieces[0].NumberStr%><br />
            
            </td>
            <td>
                2<br />
                <%=Model.Pieces[1].ColorStr%><br />
                <%=Model.Pieces[1].FillStr%><br />
                <%=Model.Pieces[1].ShapeStr%><br />
                <%=Model.Pieces[1].NumberStr%><br />
            
            </td>
            <td>
                3<br />
                <%=Model.Pieces[2].ColorStr%><br />
                <%=Model.Pieces[2].FillStr%><br />
                <%=Model.Pieces[2].ShapeStr%><br />
                <%=Model.Pieces[2].NumberStr%><br />
            </td>
            <td>
                4<br />
                <%=Model.Pieces[3].ColorStr%><br />
                <%=Model.Pieces[3].FillStr%><br />
                <%=Model.Pieces[3].ShapeStr%><br />
                <%=Model.Pieces[3].NumberStr%><br />
            </td>
        </tr>
        
        <!-- Row 2 -->
        <tr>
            <td>
                5<br />
                <%=Model.Pieces[4].ColorStr%><br />
                <%=Model.Pieces[4].FillStr%><br />
                <%=Model.Pieces[4].ShapeStr%><br />
                <%=Model.Pieces[4].NumberStr%><br />
            
            </td>
            <td>
                6<br />
                <%=Model.Pieces[5].ColorStr%><br />
                <%=Model.Pieces[5].FillStr%><br />
                <%=Model.Pieces[5].ShapeStr%><br />
                <%=Model.Pieces[5].NumberStr%><br />
            
            </td>
            <td>
                 7<br />
                 <%=Model.Pieces[6].ColorStr%><br />
                 <%=Model.Pieces[6].FillStr%><br />
                 <%=Model.Pieces[6].ShapeStr%><br />
                 <%=Model.Pieces[6].NumberStr%><br />
            </td>
            <td>
                8<br />
                <%=Model.Pieces[7].ColorStr%><br />
                <%=Model.Pieces[7].FillStr%><br />
                <%=Model.Pieces[7].ShapeStr%><br />
                <%=Model.Pieces[7].NumberStr%><br />
            </td>
        </tr>
        
        
        <!-- Row 3 -->
        <tr>
            <td>
                9<br />
                <%=Model.Pieces[8].ColorStr%><br />
                <%=Model.Pieces[8].FillStr%><br />
                <%=Model.Pieces[8].ShapeStr%><br />
                <%=Model.Pieces[8].NumberStr%><br />
            
            </td>
            <td>
                10<br />
                <%=Model.Pieces[9].ColorStr%><br />
                <%=Model.Pieces[9].FillStr%><br />
                <%=Model.Pieces[9].ShapeStr%><br />
                <%=Model.Pieces[9].NumberStr%><br />
            
            </td>
            <td>
                11<br />
                <%=Model.Pieces[10].ColorStr%><br />
                <%=Model.Pieces[10].FillStr%><br />
                <%=Model.Pieces[10].ShapeStr%><br />
                <%=Model.Pieces[10].NumberStr%><br />
            </td>
            <td>
                12<br />
                <%=Model.Pieces[11].ColorStr%><br />
                <%=Model.Pieces[11].FillStr%><br />
                <%=Model.Pieces[11].ShapeStr%><br />
                <%=Model.Pieces[11].NumberStr%><br />
            </td>
        </tr>
        
        
        
        </table>
       
        <%if (Model.Match)
          { %>
          There was a match! <br /><br/>
          <%for (int i = 0; i < Model.Matches.Count; ++i)
            { %>
            Color <%=Model.Matches[i]%> = <%=Model.Pieces[Model.Matches[i]].ColorStr%><br />
            Fill  <%=Model.Matches[i]%> = <%=Model.Pieces[Model.Matches[i]].FillStr%><br />
            Shape <%=Model.Matches[i]%> = <%=Model.Pieces[Model.Matches[i]].ShapeStr%><br />
            Number <%=Model.Matches[i]%> = <%=Model.Pieces[Model.Matches[i]].NumberStr%><br />
            <br />
            <%} %>
          
        <%} //end if (Model.Match)%>
        
   

</asp:Content>

