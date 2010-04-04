<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SetGame.Game>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ShowAll
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ShowAll</h2>
    
    <div id="AnswerContent" style="display:block">
            
          <%for (int i = 0; i < Model.Pieces.Count; ++i)
            { %>
            Color  = <%=Model.Pieces[i].ColorStr%><br />
            Fill   = <%=Model.Pieces[i].FillStr%><br />
            Shape  = <%=Model.Pieces[i].ShapeStr%><br />
            Number  = <%=Model.Pieces[i].NumberStr%><br />
            URL = <%=Model.Pieces[i].Color%><%=Model.Pieces[i].Fill%><%=Model.Pieces[i].Shape%><%=Model.Pieces[i].Number%>.jpg <br/>
            <img src="<%=Model.Pieces[i].URL%>" alt="<%=Model.Pieces[i].ColorStr%> <%=Model.Pieces[i].FillStr%> <%=Model.Pieces[i].ShapeStr%> <%=Model.Pieces[i].NumberStr%>" /> <br />
            <br />
            <%} %>
              
            
        </div>

</asp:Content>
