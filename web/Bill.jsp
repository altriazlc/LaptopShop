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
        <style>
            .btn {
                padding: 5px 10px;
                margin: 2px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 14px;
            }

            .btn-cancel {
                background-color: #f44336; /* Red */
                color: white;
            }

            .btn-complete {
                background-color: #4CAF50; /* Green */
                color: white;
            }

            .btn-detail {
                background-color: #008CBA; /* Blue */
                color: white;
            }

            .flex-row {
                display: flex;
                flex-direction: row;
                gap: 10px;
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.acc.role == 1}">
            <jsp:include page="Menu.jsp"></jsp:include>
        </c:if>
        <section>

            <c:if test="${sessionScope.acc.role == 0}">
                <jsp:include page="LeftAdmin.jsp"></jsp:include>
                <c:set value="200px" var="mar"/>
            </c:if>

            <div class="shopping-cart" style="margin-left: ${mar}">
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
                                                        <div class="p-2 px-3 text-uppercase">Order ID</div>
                                                    </th>
                                                    <th scope="col" class="border-1 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">Order Date</div>
                                                    </th>
                                                    <th scope="col" class="border-1 bg-light">
                                                        <div class="py-2 text-uppercase">Total</div>
                                                    </th>
                                                    <th scope="col" class="border-1 bg-light">
                                                        <div class="py-2 text-uppercase">Status</div>
                                                    </th>
                                                    <th scope="col" class="border-1 bg-light">
                                                        <div class="py-2 text-uppercase">Action</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set value="0" var="price"/>
                                                <c:forEach items="${requestScope.listO}" var="o">
                                                    <tr >
                                                        <td class="align-middle"><strong>${o.oid}</strong></td>
                                                        <td class="align-middle"><strong>${o.odate}</strong></td>
                                                        <td class="align-middle"><strong>${o.total}$</strong></td>
                                                        <td class="align-middle">
                                                            <strong>${o.status}</strong>
                                                        </td>
                                                        <td class="flex-row">
                                                            <c:if test="${o.status != 'Complete' && o.status != 'Cancel'}"> 
                                                                <form action="cancelbill" method="post" style="display: inline-block;">
                                                                    <input type="hidden" name="orderId" value="${o.oid}">
                                                                    <input type="submit" name="status" value="Cancel" class="btn btn-cancel">
                                                                </form>
                                                                <c:if test="${o.status != 'Processing'}">
                                                                    <form action="cancelbill" method="post" style="display: inline-block;">
                                                                        <input type="hidden" name="orderId" value="${o.oid}">
                                                                        <input type="submit" name="status" value="Complete" class="btn btn-complete">
                                                                    </form>
                                                                </c:if>
                                                            </c:if>
                                                            <a href="billdetail?oid=${o.oid}">
                                                                <button class="btn btn-detail">Detail</button>
                                                            </a>
                                                        </td>


                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- End -->
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>

