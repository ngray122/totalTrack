<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Login</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                <link rel="stylesheet" href="/css/style.css">

            </head>

            <body>
                <div class="container flex">

                    <div class="row">
                        <nav class="navbar navbar-expand-lg navbar-light" id="navHeader"> 

                            <a class="navbar-brand" href="/">Insert Name Here</a>

                            <div class="collapse navbar-collapse" id="">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page"
                                            href="/user/register">Register</a>
                                    </li>

                                </ul>

                            </div>

                        </nav>

                        <div class="col imgBk"></div>

                        <div class="col">

                        </div>
                        <div class="col">
                            <h4>Login</h4>
                            <form:form action="/login" method="post" modelAttribute="newLogin">
                                <div>
                                    <form:label path="email">Email</form:label>
                                    <form:errors path="email" class="text-danger" />
                                    <form:input path="email" type="email" class="form-control" />
                                </div>
                                <div>
                                    <form:label path="password">Password</form:label>
                                    <form:errors path="password" class="text-danger" />
                                    <form:input path="password" type="password" class="form-control" />
                                </div>

                                <input type="submit" value="Submit" class="btn btn-dark mt-3" />
                            </form:form>


                        </div>




                    </div>


                </div>



            </body>

            </html>