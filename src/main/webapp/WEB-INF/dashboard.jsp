<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <title>Dashboard</title>
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
                            <li><a id="navBtn" href="/product/new" class="waves-effect waves-light btn">Add New</a>
                            </li>
                            <li><a id="navBtn" href="/logout" class="waves-effect waves-light btn">Logout</a></li>
                        </ul>
                    </div>
                </nav>
                <div class="container">
                    <div class="row">
                        <!-- <h3>${loggedInUser.firstName}'s Dashboard</h3> -->
                        <!-- ********* LEFT SIDEBAR COLUMN ************ -->
                        <div class="col s2 z-depth-3" id="folderSidePanel">
                            <div class="container">
                                <ul class="inline-icon">
                                    <c:forEach items='${ listOfAllCategories }' var='category'>
                                        <li class=""id="folderListItem">
                                              <i id="materialIcon" class="inline-icon material-icons">folder</i>
                                                <a id="folderLink" href="/category/detail/${category.id}">${category.categoryName}</a>
                                            <!-- <a class="" href="/category/delete/${category.id}">
                                                <i id="materialIcon" class="material-icons inline-icon">delete</i> -->
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                          <div class="container">
                              <!-- CREATE FOLDER -->
                            <form:form action="/category/create" method="post" modelAttribute="categoryForm" class="">
                                <form:input type="hidden" path="products" value="${id}"/>
                                <div class="input-field white-text">
                                    <form:label  path="categoryName">Add Folder:</form:label>
                                    <form:errors path="categoryName" class="text-danger" />
                                    <form:input path="categoryName"/>
                                </div>
                                <input type="submit" value="Submit" id="navBtn" class="btn-small" />
                            </form:form>

                          </div>
                          
                        </div>
                        <div class="col s1"></div>
                        <!--************ All Products Table   ************-->
                        <div class="col s9 z-depth-3" id="allProductsDashboard">
                            <div class="container">
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
                                                    <td><a href="/products/edit/${product.id}"><i
                                                                class="material-icons" id="materialIcon">edit</i></a></td>
                                                    <td><a href="/product/delete/${product.id}">
                                                            <i class="material-icons" id="materialIcon">delete</i>
                                                        </a></td>
                                                </c:if>
                                            </tr>
    
                                        </c:forEach>
    
                                    </tbody>
                                </table>

                            </div>
                           
                            <div class="flex-container">
                                <div>1</div>
                                <div>2</div>
                                <div>3</div>
                            </div>

                        </div>
                    </div>
                </div>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            </body>

            </html>