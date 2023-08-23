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
    <title>Burgers</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container mt-5">
        <p>I really like these burgers</p>
        <table class="table table-hover border border-5">
            <tbody>
                <tr>
                    <th>Name</th>
                    <th>Restaurant Name</th>
                    <th>Rating (out of 5)</th>
                    <th>Notes</th>
                </tr>
                <!-- <td>${burger}</td> -->
                <!-- the list is working but now need to loop over it -->
                <!-- <c:out value="${burgers}"/> -->
                <!--
                ~ Java equivalent of Jinja ~
                -> take data from controller and have it render on my view
                -> give it a value attribute
                -> then what we want to render on page
                -->
                <!-- 
                    -> var is the variable for iteration -> the variable of iteration can be anything but the items have to be named after the array 
                    -> items is the array name 
                    -> naming variable conventions -> want someone after you to look at your code and understand what you were trying to do 
                    -> make title an <a> tag so when click it all the info for that burger will show 
                -->
                <!-- * do not need c:out when using Model model -->
                <tr>
                    <td>
                        <!-- 
                            ->want this to go to a page that will be /burgers/id 
                            -> iteration is burgers so burger.id
                        -->
                        ${burger.name}
                    </td>
                    <td>
                        ${burger.restaurantName}
                    </td>
                    <td>
                        ${burger.rating}
                    </td>
                    <td>
                        ${burger.notes}
                    </td>
                </tr>
            </tbody>
        </table>
        <a class="btn btn-primary" href="/burgers/new">Add a Burger</a>
    </div>
</body>
</html>
