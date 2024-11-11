<%-- 
    Document   : ShowDetail
    Created on : Jul 11, 2024, 3:35:22 PM
    Author     : nhhag
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <!-- Bootstrap CSS -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <!-- MDB CSS -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #fbfbfb;
            }
            img {
                width: 200px;
                height: 120px;
            }
            .table-custom {
                margin: 50px auto;
                width: 80%;
                border: 1px solid #dee2e6;
                background: #fff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
            }
            .table-custom th, .table-custom td {
                padding: 15px;
                text-align: left;
            }
            .table-custom th {
                background-color: #f8f9fa;
            }
            .table-custom tr:nth-child(even) {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <header>
            <jsp:include page="LeftAdmin.jsp"></jsp:include>
        </header>
        <div class="container mt-5" style="margin-left: 290px">
            <h2 class="text-center mb-4">${laptop.name} Specification</h2>
            <table class="table table-custom table-bordered">
                <thead>
                    <tr>
                        <th>Attribute</th>
                        <th>Details</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>CPU</td>
                        <td>${info.cpu}</td>
                    </tr>
                    <tr>
                        <td>Storage</td>
                        <td>${info.storage}</td>
                    </tr>
                    <tr>
                        <td>Graphic Card</td>
                        <td>${info.card}</td>
                    </tr>
                    <tr>
                        <td>RAM</td>
                        <td>${info.ram}</td>
                    </tr>
                    <tr>
                        <td>Battery Life</td>
                        <td>${info.battery}</td>
                    </tr>
                    <tr>
                        <td>Screen Size</td>
                        <td>${info.res}</td>
                    </tr>
                    <tr>
                        <td>Operating System</td>
                        <td>${info.os}</td>
                    </tr>
                    <tr>
                        <td>Weight</td>
                        <td>${info.weight}</td>
                    </tr>
                </tbody>
            </table>
                    <a href="manageproduct">
                        <button>
                            Return
                        </button>
                    </a>
        </div>
        <!-- Bootstrap JS, Popper.js, and jQuery -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
