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
        <!-- <div class="card">
            <div class="card-body">
                <h1 class="text-center">Add a Burger</h1> -->
                <!--                 
                    -> will send to where ever declared as action key
                    -> must create that route
                -->
                <!-- <form action="/burgers" method="POST">
                    <div>
                        <label>Title:</label>
                        <input type="text" class="form-control" name="title">
                    </div>

                    <div>
                        <label>Restaurant name:</label>
                        <input type="text" class="form-control" name="restaurant name">
                    </div>
                    
                    <div>
                        <label>Number of Rating:</label>
                        <input type="number" class="form-control" name="rating">
                    </div>

                    <div>
                        <label>Note:</label>
                        <input type="textera" name="note"> 
                        <textarea name="note" class="form-control" id="note" cols="10" rows="3"></textarea>
                    </div>

                    <input type="submit" value="Add a New Burger">
                </form>
            </div>
        </div class="card"> -->

        <div class="card">
            <div class="card-body">
                <!-- ~to use the model attribute
                    -> form:form tags
                    -> built into jsp
                    -> prepopulate forms when editing
                    -> access the actual object itself when creating an instance
                    -> leveraging the power of jsp and jpa to be able to add forms using the sprinf framework resources we have
                -->
                <h1>Edit a Burger</h1>
                <h2 class="text-center">New and Improved Form</h2>
                <form:form action="/burgers/${burger.id}" method="post" modelAttribute="burger">
                    <input type="hidden" name="_method" value="put">
                    <div class="form-control">
                        <form:label path="name">Name:</form:label>
                        <form:input path="name"></form:input>
                    </div>
                    <div class="form-control">
                        <form:label path="restaurantName">Restaurant name:</form:label>
                        <form:input path="restaurantName"></form:input>
                    </div>
                    <div class="form-control">
                        <form:label path="rating">Rating (out of 5):</form:label>
                        <form:input path="rating"></form:input>
                    </div>
                    <div class="form-control">
                        <form:label path="notes">Note:</form:label>
                        <form:input path="notes"></form:input>
                    </div>
                    <input class="btn btn-primary" type="submit" value="Edit Burger">
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>