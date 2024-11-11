<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="shopping-cart">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                    <!-- Shopping cart table -->
                                    <div class="table-responsive" style="margin-top: 70px ">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="border-1 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">Products</div>
                                                    </th>
                                                    <th scope="col" class="border-1 bg-light">
                                                        <div class="py-2 text-uppercase">Price</div>
                                                    </th>
                                                    <th scope="col" class="border-1 bg-light">
                                                        <div class="py-2 text-uppercase">Quantities</div>
                                                    </th>
                                                    <th scope="col" class="border-1 bg-light">
                                                        <div class="py-2 text-uppercase">Total</div>
                                                    </th>
                                                    <th scope="col" class="border-1 bg-light">
                                                        <div class="py-2 text-uppercase">Delete Product</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:set value="0" var="price"/>
                                            <c:forEach items="${requestScope.listCI}" var="o">
                                                <tr  >
                                                    <th scope="row">
                                                        <div class="p-2">

                                                            <c:forEach items="${laptop}" var="l">
                                                                <c:if test="${o.laptopID == l.laptopid}">
                                                                    <c:set value="${l.name}" var="laptopname"/>
                                                                    <c:set value="${l.price}" var="laptopprice"/>
                                                                    <c:set value="${l.laptopid}" var="productid"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="detail?pid=${productid}" class="text-dark d-inline-block">${laptopname}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle"><strong>${laptopprice}$</strong></td>
                                                    <td class="align-middle">
                                                        <a href="changecart?pid=${o.laptopID}&quantity=${o.quantity-1}&uid=${sessionScope.acc.userID}">-</a> 
                                                        <strong >${o.quantity}</strong>
                                                        <a href="changecart?pid=${o.laptopID}&quantity=${o.quantity+1}&uid=${sessionScope.acc.userID}">+</a>
                                                    </td>
                                                    <td class="align-middle">
                                                        <strong>${laptopprice*o.quantity}$</strong>
                                                    </td>
                                                    <td class="align-middle"><a href="changecart?pid=${o.laptopID}&quantity=${0}&uid=${sessionScope.acc.userID}" class="text-dark" id="increase">
                                                            <button type="button" class="btn btn-danger">Delete</button>
                                                        </a>
                                                    </td>
                                                    <c:set value="${price + laptopprice * o.quantity}" var="price"/>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>
                        <form action="submit_order" method="post">
                            <div class="row py-5 p-4 bg-white rounded shadow-sm">
                                <div class="col-lg-6">
                                    <div class="card mb-4">
                                        <div class="card-header" >
                                            Shipping Address
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="fullName">Full Name</label>
                                                <input readonly="" class="form-control" name="fullName" value="${sessionScope.acc.name}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="address">Address</label>
                                                <input readonly="" class="form-control" name="address" value="${sessionScope.acc.address}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <input readonly="" class="form-control" name="email" value="${sessionScope.acc.email}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="phonenumber">Phone Number</label>
                                                <input readonly="" class="form-control" name="phonenumber" value="${sessionScope.acc.phone}" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Bill</div>
                                    <div class="p-4">
                                        <ul class="list-unstyled mb-4">
                                            <li class="d-flex justify-content-between py-3 border-bottom">
                                                <strong class="text-muted">Total Price</strong>
                                                <strong id="total-price">${price} $</strong>
                                            </li>
                                            <li class="d-flex justify-content-between py-3 border-bottom">
                                                <strong class="text-muted">Ship Fee</strong>
                                                <strong>Free ship</strong>
                                            </li>
                                            <li class="d-flex justify-content-between py-3 border-bottom">
                                                <strong class="text-muted">Total</strong>
                                                <h5 class="font-weight-bold" id="total-payment">${price}</h5>
                                            </li>
                                        </ul>
                                        <a href="checkout?pricebill=${price}&uid=${sessionScope.acc.userID}" 
                                           class="btn btn-dark rounded-pill py-2 btn-block" 
                                           onclick="return confirmCheckout()">Buy</a>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <script>
            function confirmCheckout() {
                // Display a confirmation dialog
                var confirmed = confirm('Are you sure you want to proceed to checkout?');

                // If user clicks OK, confirmed will be true and the link will proceed to checkout
                // If user clicks Cancel, confirmed will be false and the checkout action will be canceled
                return confirmed;
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>

