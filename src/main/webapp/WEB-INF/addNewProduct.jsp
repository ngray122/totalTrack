<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Add New Product</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                <link rel="stylesheet" href="/css/style.css">
                <script src="https://kit.fontawesome.com/bbdeaf9601.js" crossorigin="anonymous"></script>
            </head>

            <body>
                <div class="container flex">
                    <div class="row">
                        <!-- ************     NAVBAR    ************** -->

                        <nav class="navbar navbar-expand-lg navbar-light" id="navBar">
                            <a class="navbar-brand" href="/dashboard">APPLICATION NAME</a>
                            <div class="collapse navbar-collapse" id="">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="btn m-3" href="/dashboard">My
                                            Dashboard</a>
                                    </li>
                                    <li>
                                        <a class="btn m-3" href="/logout">Logout</a>
                                    </li>
                                </ul>
                            </div>

                        </nav>


                        <!-- ********* LEFT SIDEBAR COLUMNS ************ -->
                        <div class="col" id="folderSidePanel">
                            <ul class="">
                                <c:forEach items='${ listOfAllCategories }' var='category'>
                                    <li id="folderListItem">
                                        <i class="fa-regular fa-folder">
                                            <a class="text-white" href="/category/detail/${category.id}">${category.categoryName}</a>
                                        </i>
                                        <a class="m-4 text-white" href="/category/delete/${category.id}">
                                            <i class="fa-regular fa-trash-can"></i>
                                        </a>
                                    </li>
                                </c:forEach>

                            </ul>

                            <form:form action="/category/create" method="post" modelAttribute="categoryForm">
                                <form:input type="hidden" path="products" value="${id}" />
                                <div>
                                    <form:label path="categoryName">Add Folder:</form:label>
                                    <form:errors path="categoryName" class="text-danger" />
                                    <form:input path="categoryName" class="form-control" />
                                </div>


                                <input type="submit" value="Submit" class="btn mt-3" />
                            </form:form>





                        </div>
                             <!-- ********* Add Form ************ -->
                        <div class="col" id="productForms">

                            <form:form action="/product/create" method="post" modelAttribute="newProduct">
                                <form:input type="hidden" path="user" value="${id}" />

                                <h4>Add Item</h4>

                                <div>
                                    <form:label path="productName">Name:</form:label>
                                    <form:errors path="productName" class="text-danger" />
                                    <form:input path="productName" class="form-control" />
                                </div>
                                <div>
                                    <form:label path="productDescription">Description:</form:label>
                                    <form:errors path="productDescription" class="text-danger" />
                                    <form:textarea path="productDescription" class="form-control" />
                                </div>
                                <div>
                                    <form:label path="productRetailPrice">Retail Price:</form:label>
                                    <form:errors path="productRetailPrice" class="text-danger" />
                                    <form:input path="productRetailPrice" class="form-control" type="number"
                                        step="0.01" />
                                </div>
                                <div>
                                    <form:label path="productCostPrice">Cost Price:</form:label>
                                    <form:errors path="productCostPrice" class="text-danger" />
                                    <form:input path="productCostPrice" class="form-control" type="number"
                                        step="0.01" />
                                </div>
                                <div>
                                    <form:label path="productQuantity">Quantity:</form:label>
                                    <form:errors path="productQuantity" class="text-danger" />
                                    <form:input path="productQuantity" class="form-control" type="number" />
                                </div>
                                <div>
                                    <form:label path="productImage">Image:</form:label>
                                    <form:errors path="productImage" class="text-danger" />
                                    <form:input path="productImage" class="form-control" />
                                </div>

                                <input type="submit" value="Submit" class="btn btn-dark mt-3" />
                            </form:form>


                        </div>

            </body>

            </html>