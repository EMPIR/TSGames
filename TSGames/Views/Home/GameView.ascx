<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SetGame.Game>" %>
<script src="/Scripts/jquery-1.2.3.js" type="text/javascript"></script>
<script src="/Scripts/jquery-form" type="text/javascript"></script>
<script src="/Scripts/jquery.latest.js" type="text/javascript"></script>
<script type="text/javascript" src="/Scripts/jquery.bgiframe.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery.autocomplete.js"></script>   
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript" language="JavaScript">
        $.ajaxSetup({"error":function(XMLHttpRequest,textStatus, errorThrown) {   
              alert(textStatus);
              alert(errorThrown);
              alert(XMLHttpRequest.responseText);
          }});

        var mySel;
        var allPieces;
        var stateArray;
        var currentMove;
        var totalMoves;
        
        var startTime;
        var endTime;
        
        $(document).ready(function(){
            mySel = new Array();
            allPieces = new Array();
            stateArray = new Array();
            currentMove = 1;
            totalMoves = 10;
            var d = new Date();
            startTime = d.getTime();
            
            
            <%for (int i = 0; i < Model.Pieces.Count; ++i)
            { %>
                allPieces.push("<%=Model.Pieces[i].URL%>");
            <%} %>
            
            <%for (int i = 0; i < Model.State.Count; ++i)
            { %>
                stateArray.push("<%=Model.State[i]%>");
            <%} %>
            
            
        });
            
            
       
        
        function changePiece(state, value)
        {
            if(state == 0)
            {
                var v = document.getElementById("item1");
      
            }
            
            if(state == 1)
            {
                var v = document.getElementById("item2");
                
            }
            if(state == 2)
            {
                var v = document.getElementById("item3");
                
            }
            if(state == 3)
            {
                var v = document.getElementById("item4");
                
            }
            if(state == 4)
            {
                var v = document.getElementById("item5");
                
            }
            if(state == 5)
            {
                var v = document.getElementById("item6");
                
            }
            if(state == 6)
            {
                var v = document.getElementById("item7");
                
            }
            if(state == 7)
            {
                var v = document.getElementById("item8");
                
            }
            if(state == 8)
            {
                var v = document.getElementById("item9");
                
            }
            if(state == 9)
            {
                var v = document.getElementById("item10");
                
            }
            if(state == 10)
            {
                var v = document.getElementById("item11");
                
            }
            if(state == 11)
            {
                var v = document.getElementById("item12");
            }
            stateArray[state] = value;
            v.innerHTML = value + "<br/><img src=\'"+ allPieces[value] + "\' alt=\'"+allPieces[value]+"\' />";
            
        }
        function clickedFunc(val) {
            var v= document.getElementById("SelectedContent");
            if(mySel.length == 0)
            {
                v.innerHTML = ""
            }
            if(mySel.length < 2)
            {
                var index = $.inArray(val, mySel);
                if(-1 == index)
                {
                    mySel.push(val);
                    v.innerHTML += val + ',';
                    
                }
                else
                {
                       mySel =  jQuery.grep(mySel, function(value) {
                        return value != val;
                       });
                       if(mySel.length == 1)
                       v.innerHTML = mySel[0] +',';
                       else if(mySel.length == 0)
                       v.innerHTML = "";
                       
                }
                    
            }
            else
            {
                var index = $.inArray(val, mySel);
                if(-1 == index)
                {
                   v.innerHTML += val;
                mySel.push(val);
                var action = "/Home/NodeClicked/" + mySel[0] + "/" + mySel[1] + "/" + mySel[2];
               
                
                $.getJSON(action, null, function(data) {
                        if(data.response)
                        {
                            v.innerHTML = "You Found a Match! " + data.state1 + " "+ data.value1+ " "
                                                                + data.state2 + " "+ data.value2+ " "
                                                                + data.state3 + " "+ data.value3;
                            
                            changePiece(data.state1, data.value1);
                            changePiece(data.state2, data.value2);
                            changePiece(data.state3, data.value3);
                            
                            var answerContent = document.getElementById("AnswerContent");
                            answerContent.innerHTML = "<br/><img src=\'"+ allPieces[data.match1] + "\' alt=\'"+data.match1+"\' />"
                                                    + "<br/><img src=\'"+ allPieces[data.match2] + "\' alt=\'"+data.match2+"\' />"
                                                    + "<br/><img src=\'"+ allPieces[data.match3] + "\' alt=\'"+data.match3+"\' />";
                            currentMove ++;
                            var currentMoveDiv = document.getElementById("CurrentMove");
                            currentMoveDiv.innerHTML = "Move " + currentMove + " of " + totalMoves + "<br />";
                            if(currentMove >= totalMoves)
                            {
                                var d = new Date();
                                var endTime = d.getTime();
                                var gameTime = endTime - startTime;
                                var gameBoard = document.getElementById("GameBoard");
                                gameBoard.innerHTML = "You WIN! Here was time in milliseconds " + gameTime;
                            }                        
                         }
                         else
                         {
                            v.innerHTML ="Not a Match!";
                         }   

               
                           mySel.pop();mySel.pop();mySel.pop(); 
                
                        });   
                    
                }
                else
                {
                       mySel =  jQuery.grep(mySel, function(value) {
                        return value != val;
                       });
                       if(mySel.length == 2)
                       v.innerHTML = mySel[0] +',' + mySel[1] + ',';
                       else if(mySel.length == 1)
                       v.innerHTML = mySel[0] +',';
                       else if(mySel.length == 0)
                       v.innerHTML = "";
                       
                }
                  
            }
        }
    </script>
    <h2>Set Game</h2>
        <div id="CurrentMove"></div>
        <div id="GameBoard">
            <table cellpadding="20" cellspacing="0" border="0" onload="init();">
            <tr><td colspan="4">Here are all of the pieces</td></tr>
            <!-- Row 1 -->
            <tr>
                <td id="item1" onclick="clickedFunc(stateArray[0]);" style="cursor: pointer;">
                    <%=Model.State[0]%><br />
                    <img src="<%=Model.Pieces[Model.State[0]].URL %>" alt="<%=Model.Pieces[Model.State[0]].ColorStr%> <%=Model.Pieces[Model.State[0]].FillStr%> <%=Model.Pieces[Model.State[0]].ShapeStr%> <%=Model.Pieces[Model.State[0]].NumberStr%>" />
                </td>
                <td id="item2" onclick="clickedFunc(stateArray[1]);" style="cursor: pointer;">
                    <%=Model.State[1]%><br />
                    <img src="<%=Model.Pieces[Model.State[1]].URL %>" alt="<%=Model.Pieces[Model.State[1]].ColorStr%> <%=Model.Pieces[Model.State[1]].FillStr%> <%=Model.Pieces[Model.State[1]].ShapeStr%> <%=Model.Pieces[Model.State[1]].NumberStr%>" />
                </td>
                <td id="item3" onclick="clickedFunc(stateArray[2]);" style="cursor: pointer;">
                    <%=Model.State[2]%><br />
                    <img src="<%=Model.Pieces[Model.State[2]].URL %>" alt="<%=Model.Pieces[Model.State[2]].ColorStr%> <%=Model.Pieces[Model.State[2]].FillStr%> <%=Model.Pieces[Model.State[2]].ShapeStr%> <%=Model.Pieces[Model.State[2]].NumberStr%>" />
                </td>
                <td id="item4" onclick="clickedFunc(stateArray[3]);" style="cursor: pointer;">
                    <%=Model.State[3]%><br />
                    <img src="<%=Model.Pieces[Model.State[3]].URL %>" alt="<%=Model.Pieces[Model.State[3]].ColorStr%> <%=Model.Pieces[Model.State[3]].FillStr%> <%=Model.Pieces[Model.State[3]].ShapeStr%> <%=Model.Pieces[Model.State[3]].NumberStr%>" />      
                </td>
            </tr>
            
            <!-- Row 2 --> 
            <tr>
                <td id="item5" onclick="clickedFunc(stateArray[4]);" style="cursor: pointer;">
                   <%=Model.State[4]%><br />
                   <img src="<%=Model.Pieces[Model.State[4]].URL %>" alt="<%=Model.Pieces[Model.State[4]].ColorStr%> <%=Model.Pieces[Model.State[4]].FillStr%> <%=Model.Pieces[Model.State[4]].ShapeStr%> <%=Model.Pieces[Model.State[4]].NumberStr%>" />
                </td>
                <td id="item6" onclick="clickedFunc(stateArray[5]);" style="cursor: pointer;">
                    <%=Model.State[5]%><br />
                    <img src="<%=Model.Pieces[Model.State[5]].URL %>" alt="<%=Model.Pieces[Model.State[5]].ColorStr%> <%=Model.Pieces[Model.State[5]].FillStr%> <%=Model.Pieces[Model.State[5]].ShapeStr%> <%=Model.Pieces[Model.State[5]].NumberStr%>" />     
                </td>
                <td id="item7" onclick="clickedFunc(stateArray[6]);" style="cursor: pointer;">
                     <%=Model.State[6]%><br />
                     <img src="<%=Model.Pieces[Model.State[6]].URL %>" alt="<%=Model.Pieces[Model.State[6]].ColorStr%> <%=Model.Pieces[Model.State[6]].FillStr%> <%=Model.Pieces[Model.State[6]].ShapeStr%> <%=Model.Pieces[Model.State[6]].NumberStr%>" />    
                </td>
                <td id="item8" onclick="clickedFunc(stateArray[7]);" style="cursor: pointer;">
                    <%=Model.State[7]%><br />
                    <img src="<%=Model.Pieces[Model.State[7]].URL %>" alt="<%=Model.Pieces[Model.State[7]].ColorStr%> <%=Model.Pieces[Model.State[7]].FillStr%> <%=Model.Pieces[Model.State[7]].ShapeStr%> <%=Model.Pieces[Model.State[7]].NumberStr%>" />
                </td>
            </tr>
           
            
            <!-- Row 3 -->
            <tr>
                <td id="item9" onclick="clickedFunc(stateArray[8]);" style="cursor: pointer;">
                    <%=Model.State[8]%><br />
                    <img src="<%=Model.Pieces[Model.State[8]].URL %>" alt="<%=Model.Pieces[Model.State[8]].ColorStr%> <%=Model.Pieces[Model.State[8]].FillStr%> <%=Model.Pieces[Model.State[8]].ShapeStr%> <%=Model.Pieces[Model.State[8]].NumberStr%>" />
                </td>
                <td id="item10" onclick="clickedFunc(stateArray[9]);" style="cursor: pointer;">
                    <%=Model.State[9]%><br />
                    <img src="<%=Model.Pieces[Model.State[9]].URL %>" alt="<%=Model.Pieces[Model.State[9]].ColorStr%> <%=Model.Pieces[Model.State[9]].FillStr%> <%=Model.Pieces[Model.State[9]].ShapeStr%> <%=Model.Pieces[Model.State[9]].NumberStr%>" />
                </td>
                <td id="item11" onclick="clickedFunc(stateArray[10]);" style="cursor: pointer;">
                    <%=Model.State[10]%><br />
                    <img src="<%=Model.Pieces[Model.State[10]].URL %>" alt="<%=Model.Pieces[Model.State[10]].ColorStr%> <%=Model.Pieces[Model.State[10]].FillStr%> <%=Model.Pieces[Model.State[10]].ShapeStr%> <%=Model.Pieces[Model.State[10]].NumberStr%>" />
                    
                </td>
                <td id="item12" onclick="clickedFunc(stateArray[11]);" style="cursor: pointer;">
                    <%=Model.State[11]%><br />
                    <img src="<%=Model.Pieces[Model.State[11]].URL %>" alt="<%=Model.Pieces[Model.State[11]].ColorStr%> <%=Model.Pieces[Model.State[11]].FillStr%> <%=Model.Pieces[Model.State[11]].ShapeStr%> <%=Model.Pieces[Model.State[11]].NumberStr%>" />
                    
                </td>
            </tr>
            <tr>
                
            </tr>
            
            
            </table>
        </div>    
        <div id="SelectedContent">
        
        </div>
        <div id="AnswerContent" style="display:block">
            <%if (Model.Match)
              { %>
              There was a match! <br /><br/>
              <%for (int i = 0; i < Model.Matches.Count; ++i)
                { %>
                <%=Model.Matches[i]%><br />
                <img src="<%=Model.Pieces[Model.Matches[i]].URL%>" alt="<%=Model.Pieces[i].ColorStr%> <%=Model.Pieces[i].FillStr%> <%=Model.Pieces[i].ShapeStr%> <%=Model.Pieces[i].NumberStr%>" /> <br />
                <br />
                <%} %>
              
            <%} //end if (Model.Match)%>
        </div>

