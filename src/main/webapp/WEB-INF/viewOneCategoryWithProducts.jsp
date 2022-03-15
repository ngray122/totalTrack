<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html>
        <head>
          <meta charset="UTF-8">
          <title>View Folder</title>
          <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
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
                      <i class="inline-icon material-icons" id="materialIcon">
                        <a class="text-white" href="/category/detail/${category.id}">${category.categoryName}</a>
                      </i>
                      <!-- <a class="m-4 text-white" href="/category/delete/${category.id}">
                      <i class="fa-regular fa-trash-can"></i> -->
                      </a>
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
              <!-- ************   CARD   ************ -->
              <div class="container">
                <div class="col s9 z-depth-3 s12 m7" id="productForms">
                  <div class="card large" id="itemCardInfo">
                    <div class="card-image">
                      <img src="/images/high-angle-view-image-half-empty-working-desk.jpg">
                      <span class="card-title black-text">Card Title</span>
                    </div>
                    <div class="card-content">
                      <h5 class="card-title">${singleCategory.categoryName}</h5>
                      <c:forEach items='${ singleCategory.products}' var='product'>
                        <div class="card">
                          <h6 class="card-title">${product.productName}
                          </h6>
                          <div class="card-body">
                            <p>Img: ${product.productImage}</p>
                            <p>Description: ${product.productDescription}</p>
                            <p>Cost: $${product.productCostPrice}</p>
                            <p>Retail: $${product.productRetailPrice}</p>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        </body>

        </html>