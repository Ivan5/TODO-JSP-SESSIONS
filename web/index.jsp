<%-- 
    Document   : index
    Created on : 12/06/2018, 10:09:12 PM
    Author     : conve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TODO LIST</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" >
    </head>
    <body>
        <h1 class="text-center">TODO List</h1>
        <div class="container mt-4">
            <div class="row justify-content-center">
                <div clas="col-md-6 md-offset-3 ">
                    <!-- Create HTML Form-->
                    <form action="index.jsp">
                        <div class="form-group">
                            <label for="theItem">Add new Item</label>
                            <input type="text" name="theItem" class="form-control" />
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </form>
                </div>
            </div>
            <hr>
            <%
                //get the todo items from the session
                List<String> items = (List<String>) session.getAttribute("myTodoList");
                // if the todo items soesn't exsit, then create a new one
                if(items == null){
                    items = new ArrayList<String>();
                    session.setAttribute("myTodoList", items);
                }
                // see if there is form data to add
                String theItem = request.getParameter("theItem");
                if( theItem != null){
                    items.add(theItem);
                }
           %>
           <hr>
           <h2>To List Items:</h2><br>
           <ol class="list-group">
               <%
                    for (String item : items) {
                            out.println("<li class='list-group-item'>"+item+"</li>");
                        }
               %>
           </ol>
        </div>
    </body>
</html>
