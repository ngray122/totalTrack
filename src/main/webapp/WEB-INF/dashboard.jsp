<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Dashboard</title>

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
                            <div class="collapse navbar-collapse">
                                <ul class="navbar-nav">
                                    <li class="nav-item mr-auto">
                                        <a class="btn m-3" href="/product/new">Add new</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="btn m-3" href="/logout">Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                        <!-- <h3>${loggedInUser.firstName}'s Dashboard</h3> -->

                        <!-- ********* LEFT SIDEBAR COLUMN ************ -->
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
                        <!--************ All Products Table   ************-->
                        <div class="col" id="allProductsDashboard">
                            <table class="table">
                                <thead>
                                    <h4 class="text-center">All Items</h4>
                                    <tr>
                                        <th scope="col">Image</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Total Quantity</th>
                                        <th scope="col">Retail</th>
                                        <th scope="col">Cost</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items='${ listOfAllProducts }' var='product'>
                                        <tr>
                                            <td>${product.productImage}</td>
                                            <td><a href="/products/detail/${product.id}">${product.productName}</a></td>
                                            <td>${product.productDescription}</td>
                                            <td>${product.productQuantity}</td>
                                            <td>${product.productRetailPrice}</td>
                                            <td>${product.productCostPrice}</td>

                                            <c:if test='${loggedInUser.id == product.user.id}'>
                                                <td><a class="m-4 text-dark" href="/products/edit/${product.id}"><i class="fa-solid fa-pen"></i></a></td>
                                                <td><a class="text-dark" href="/product/delete/${product.id}">
                                                    <i class="fa-regular fa-trash-can"></i>
                                                  </a></td>
                                            </c:if>
                                        </tr>

                                    </c:forEach>

                                </tbody>
                            </table>
                            <div class="flex-container">
                                <div>1</div>
                                <div>2</div>
                                <div>3</div>
                              </div>

                        </div>

                      

                    </div>
                </div>
            </body>

            </html>