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
    <div class="container d-flex justify-content-center border border-5 mt-5">
        <!-- <c:out value="${name}" ></c:out> -->
        <!-- Survey part -> Form -->
        <div class="card">
            <div class="card-body">
                <h1 class="text-center">Add a Burger</h1>
                <!--                 
                    -> will send to where ever declared as action key
                    -> must create that route
                -->
                <form action="/burgers" method="POST">
                    <div>
                        <label>Name:</label>
                        <input type="text" class="form-control" name="name">
                    </div>

                    <div>
                        <label>Restaurant Name:</label>
                        <input type="text" class="form-control" name="restaurantName">
                    </div>
                    
                    <div>
                        <label>Rating (out of 5):</label>
                        <input type="number" class="form-control" name="rating">
                    </div>

                    <div>
                        <label>Notes:</label>
                        <input type="textera" name="notes"> 
                        <textarea name="notes" class="form-control" id="notes" cols="10" rows="3"></textarea>
                    </div>

                    <input type="submit" value="Add a New Burger">
                </form>
            </div>
        </div class="card">

        <div class="card">
            <div class="card-body">
                <!-- ~to use the model attribute
                    -> form:form tags
                    -> built into jsp
                    -> prepopulate forms when editing
                    -> access the actual object itself when creating an instance
                    -> leveraging the power of jsp and jpa to be able to add forms using the sprinf framework resources we have
                -->
                <h2 class="text-center">New and Improved Form</h2>
                <form:form action="/burgers" method="post" modelAttribute="burger">
                    <div class="form-control">
                        <form:label path="name">Name:</form:label>
                        <form:input path="name"></form:input>
                    </div>
                    <div class="form-control">
                        <form:label path="restaurantName">Restaurant Name:</form:label>
                        <form:input path="restaurantName"></form:input>
                    </div>
                    <div class="form-control">
                        <form:label path="rating">Rating:</form:label>
                        <form:input path="rating"></form:input>
                    </div>
                    <div class="form-control">
                        <form:label path="notes">Notes:</form:label>
                        <form:input path="notes"></form:input>
                    </div>
                    <input class="btn btn-primary" type="submit" value="Add a New Burger">
                </form:form>
            </div>
        </div>

    </div>
</body>
</html>