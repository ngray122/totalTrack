<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="UTF-8">
        <title>View Product</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/css/style.css">
        <script type="text/javascript" src="/js/app.js"></script>
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
            <div class="col s2 z-depth-3" id="folderSidePanel_2">
              <ul class="inline-icon">
                <c:forEach items='${ listOfAllCategories }' var='category'>
                  <li id="folderListItem">
                    <i class="inline-icon material-icons" id="material-icon">
                      <a class="text-white" href="/category/detail/${category.id}">${category.categoryName}</a>
                    </i>
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
                    <form:input path="categoryName" class="form-control" />
                  </div>
                  <input type="submit" value="Submit" class="btn mt-3" />
                </form:form>
              </div>
   
            </div>
            <div class="col s1"></div>
            <!-- ************  Item Card   ************ -->
            <div class="container">
              <div class="col s9 z-depth-3 s12 m7" id="productForms">
                <div class="card large" id="itemCardInfo">
                  <div class="card-image">
                    <img src="/images/high-angle-view-image-half-empty-working-desk.jpg">
                    <span class="card-title black-text">Card Title</span>
                  </div>
                  <div class="card-body">
                    <h6 id="detailFolderHeader">Review the details for ${singleProduct.productName}'s and add to
                      corresponding folder.</h6>
  
                    <p class="card-text">Description: ${singleProduct.productDescription}</p>
                    <p class="card-text">${singleProduct.productName} Item Cost: ${singleProduct.productCostPrice}</p>
                    <p class="card-text">${singleProduct.productName} Retail: ${singleProduct.productRetailPrice}</p>
                    <p class="card-text">${singleProduct.productName} Quantity: ${singleProduct.productQuantity}</p>
                    <p class="card-text">Image: ${singleProduct.productImage}</p>
  
                  </div>
                  <h5>Add item to existing folder:</h5>
                  <form action="/addCategory/${singleProduct.id}" method="post">
                    <div class="input-field">
                      <select name="categoryId" id="">
                        <c:forEach items='${ listOfAllCategories }' var='category'>
                          <option value="${category.id}">${category.categoryName}</option>
                        </c:forEach>
                      </select>
                    </div>
                  
                    <input type="submit" value="Submit" class="btn btn-dark mt-3" />
                  </form>
                </div>
              </div>

            </div>
  
          </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

      </body>

      </html>