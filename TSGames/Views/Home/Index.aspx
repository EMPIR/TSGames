<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SetGame.Game>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Set Game
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Set Game</h2>

    <!-- <fieldset>
        <legend>Fields</legend>
    </fieldset> -->
    <p>
        <!-- <%=Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%=Html.ActionLink("Back to List", "Index") %> -->
        
        Color = <%=Model.Piece.Color.ToString() %><br />
        Fill  = <%=Model.Piece.Fill.ToString() %><br />
        Shape = <%=Model.Piece.Shape.ToString() %><br />
        Number = <%=Model.Piece.Number.ToString() %><br />
    </p>

</asp:Content>

