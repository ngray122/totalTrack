<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Login</title>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
                <link rel="stylesheet" href="/css/style.css">
            </head>

            <body>
                <nav>
                    <div class="nav-wrapper">
                        <a href="/dashboard" class="brand-logo">Tally</a>
                        <ul class="right hide-on-med-and-down">
                            <li><a href="/user/register" class="waves-effect waves-light btn">Register</a></li>
                        </ul>
                    </div>
                </nav>
                    <div class="container">
                        <div class="row">

                            <div class="col s4"></div>
                            <div class="col s4">
                                <h4>Login</h4>
                                <form:form action="/login" method="post" modelAttribute="newLogin">
                                    <div class="input-field">
                                        <form:label path="email">Email</form:label>
                                        <form:errors path="email" class="text-danger" />
                                        <form:input path="email" type="email" />
                                    </div>
                                    <div class="input-field">
                                        <form:label path="password">Password</form:label>
                                        <form:errors path="password" class="text-danger" />
                                        <form:input path="password" type="password" />
                                    </div>
                                    <input type="submit" value="Submit" class="btn mt-3" />
                                </form:form>
                            </div>
                            <div class="col s4">
                            </div>
                        </div>
                    </div>
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            </body>

            </html>