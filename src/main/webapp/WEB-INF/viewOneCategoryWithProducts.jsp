<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <title>View Folder</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/style.css">
        <script src="https://kit.fontawesome.com/bbdeaf9601.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="/js/app.js"></script>
      </head>

      <body>
        <div class="container text-center flex">
          <div class="row">
            <!-- ************     NAVBAR    ************** -->
            <nav class="navbar navbar-expand-lg navbar-light" id="navBar">
              <a class="navbar-brand" href="/dashboard">APPLICATION NAME</a>
              <div class="collapse navbar-collapse" id="">
                <ul class="navbar-nav">
                  <li class="nav-item">
                  <a class="btn m-3" href="/product/new">Add new</a>
                  </li>
                  <li>
                    <a class="btn m-3" href="/logout">Logout</a>
                  </li>
                </ul>
              </div>
            </nav>
            <!-- ********* LEFT SIDEBAR COLUMNS ************ -->
            <div class="col" id="folderSidePanel_2">
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
            <!-- ************  Folder Card   ************ -->
            <div class="col" id="productForms">
              <div class="card p-3" id="itemCardInfo">
                <div class="card-body">
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
      </body>

      </html>