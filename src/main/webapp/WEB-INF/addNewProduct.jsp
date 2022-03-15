<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Add New Product</title>
                <link rel="stylesheet" href="/css/style.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


            </head>

            <body>
                <!-- NAV BAR -->
                <nav>
                    <div class="nav-wrapper">
                        <a href="/dashboard" class="brand-logo">Tally</a>
                        <ul class="right hide-on-med-and-down">
                            <li><a id="navBtn" href="/dashboard" class="waves-effect waves-light btn">Dashboard</a>
                            </li>
                            <li><a id="navBtn" href="/logout" class="waves-effect waves-light btn">Logout</a></li>
                        </ul>
                    </div>
                </nav>
                <div class="container">
                    <div class="row">

                        <!-- ********* LEFT SIDEBAR COLUMNS ************ -->
                        <div class="col s2 z-depth-3" id="folderSidePanel">
                            <ul class="inline-icon">
                                <c:forEach items='${ listOfAllCategories }' var='category'>
                                    <li id="folderListItem">
                                        <i id="materialIcon" class="inline-icon material-icons">folder</i>
                                        <a id="folderLink"
                                            href="/category/detail/${category.id}">${category.categoryName}</a>
                                        <!-- <a class="m-4 text-white" href="/category/delete/${category.id}">
                                            <i class="fa-regular fa-trash-can"></i>
                                        </a> -->
                                    </li>
                                </c:forEach>
                            </ul>
                            <!-- CREATE FOLDER -->
                            <div class="container">
                                <form:form action="/category/create" method="post" modelAttribute="categoryForm">
                                    <form:input type="hidden" path="products" value="${id}" />
                                    <div class="input-field">
                                        <form:label path="categoryName">Add Folder:</form:label>
                                        <form:errors path="categoryName" class="text-danger" />
                                        <form:input path="categoryName" />
                                    </div>
                                    <input type="submit" value="Submit" class="btn mt-3" id="navBtn" />
                                </form:form>
                            </div>
                        </div>

                        <div class="col s1"></div>

                        <!-- ********* Add Form ************ -->
                        <div class="col s9 z-depth-3" id="productForms">
                            <div class="container">
                                <form:form action="/product/create" method="post" modelAttribute="newProduct">
                                    <form:input type="hidden" path="user" value="${id}" />

                                    <h4>Add Item</h4>

                                    <div class="input-field">
                                        <form:label path="productName">Name:</form:label>
                                        <form:errors path="productName" class="text-danger" />
                                        <form:input path="productName" class="validate" />
                                    </div>
                                    <div class="input-field">
                                        <form:label path="productDescription">Description:</form:label>
                                        <form:errors path="productDescription" class="text-danger" />
                                        <form:textarea path="productDescription" class="validate materialize-textarea"/>
                                    </div>
                                    <div class="input-field">
                                        <form:label path="productRetailPrice">Retail Price:</form:label>
                                        <form:errors path="productRetailPrice" class="text-danger" />
                                        <form:input path="productRetailPrice" class="validate" type="number"
                                            step="0.01" />
                                    </div>
                                    <div class="input-field">
                                        <form:label path="productCostPrice">Cost Price:</form:label>
                                        <form:errors path="productCostPrice" class="text-danger" />
                                        <form:input path="productCostPrice" class="validate" type="number"
                                            step="0.01" />
                                    </div>
                                    <div class="input-field">
                                        <form:label path="productQuantity">Quantity:</form:label>
                                        <form:errors path="productQuantity" class="text-danger" />
                                        <form:input path="productQuantity" class="validate" type="number" />
                                    </div>
                                    <div class="input-field">
                                        <form:label path="productImage">Image:</form:label>
                                        <form:errors path="productImage" class="text-danger" />
                                        <form:input path="productImage" class="validate" />
                                    </div>

                                    <input type="submit" value="Submit" class="btn mt-3" id="navBtn" />
                                </form:form>

                            </div>




                        </div>
                        <script
                            src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

            </body>

            </html>