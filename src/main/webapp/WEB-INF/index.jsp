<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Burger Tracker</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
        <!-- Minty cdn -->
        <link 
        rel="stylesheet" 
        href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" 
        integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" 
        crossorigin="anonymous"
        >
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <!-- want to add a list of all the burgers -->
    <h1 class="text-center">Burger Tracker</h1>
        <!-- make a table here -->
    <table class="table container table-hover text-center table-striped">
        <thead>
            <th>Name</th>
            <th>Restaurant Name</th>
            <th>Rating (out of 5)</th>
            <!-- these are going to be my actions -> edit & delete -->
            <th>Actions</th>
        </thead>
        <tbody>
            <!-- 
                ~ Java equivalent of Jinja ~
                -> take data from controller and have it render on my view
                -> give it a value attribute
                -> then what we want to render on page
            -->
            <!-- 
                -> var is the variable for iteration -> the variable of iteration can be anything but the items have to be named after the array 
                -> items is the artray name 
                -> naming variable conventions -> want someone after you to look at your code and understand what you were trying to do 
                -> make title an <a> tag so when click it all the info for that burger will show 
            -->
            <c:forEach var="burger" items="${burgers}">
                <tr>
                    <td>
                        <a href="/burgers/${book.id}">${burger.name}</a>
                    </td>
                    <td>${burger.restaurantName}</td>
                    <td>${burger.rating}</td>
                    <!--  
                        -> add'tl table data that will be my actions 
                        -> need to make route where link will go 
                        -> /burgers/edit/id
                    -->
                    <td class="d-flex gap-2">
                        <a class="btn btn-primary" href="/burgers/edit/${burger.id}">Edit</a>
                        <!-- this is for the delete 
                            -> we have to include the hidden input which is why the <form> tag is needed
                            -> the work around if we want to use put
                            -> must follow the restful routing 
                            -> need to create a route for delete
                            -> must create a a method for delete
                        -->
                        <form action="/burgers/${burger.id}" method="post">
                            <input type="hidden" name="_method" value="delete">
                            <input class="btn btn-danger" type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    

    <!--  
    -> follow restful routing of wireframe 
    -> using form:form we need to add modelAttribute
    -> for validations form:form works better
    -> need to send it an empty burger to create -> modelAttribute in controllers
    -->
    <form:form class="container center" action="/burgers" method="post" modelAttribute="burger">
        <!-- now need everthing burger has -->
        <div class="gap-2 mb-2 col-8 d-flex">
            <form:label path="name">Name: </form:label>
            <form:errors class="text-danger" path="name"></form:errors>
            <form:input class="form-control" path="name"></form:input>
        </div>

        <div class="gap-1 mb-2 col-8 d-flex">
            <form:label path="restaurantName">Restaurant Name</form:label>
            <form:errors class="text-danger" path="restaurantName"></form:errors>
            <form:input class="form-control" path="restaurantName"></form:input>
        </div>
        <div class="gap-2 mb-2 col-8 d-flex">
            <form:label path="rating">Rating</form:label>
            <form:errors class="text-danger" path="rating"></form:errors>
            <form:input class="form-control" path="rating"></form:input>
        </div>
        <div class="gap-2 mb-2 col-8 d-flex">
            <form:label path="notes">Notes</form:label>
            <form:errors class="text-danger" path="notes"></form:errors>
            <form:input class="form-control" path="notes"></form:input>
        </div>

        <input type="submit" value="Create A Burger" >
    </form:form>
</body>
</html>