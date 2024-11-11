<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ministore</title>
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
        
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
        <link href="css/manager.css" rel="stylesheet" type="text/css"/><link href="demo-4.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <!-- script -->
        <script src="js/modernizr.js"></script>
        <style>
            .main-body {
                padding: 15px;
            }
            .card {
                box-shadow: 0 1px 3px rgba(0,0,0,0.2);
                border: none;
                border-radius: 8px;
                margin-bottom: 1.5rem;
            }
            .card-body {
                padding: 1.5rem;
            }
            .rounded-circle {
                border: 2px solid #ddd;
                padding: 5px;
            }
            .breadcrumb {
                background: none;
                padding: 0;
                margin-bottom: 1rem;
            }
            .breadcrumb-item a {
                color: #007bff;
                text-decoration: none;
            }
            .breadcrumb-item.active {
                color: #6c757d;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }
            .form-control {
                border-radius: 5px;
            }
        </style>
    </head>
    <body>

        <c:if test="${sessionScope.acc.role == 1}">
            <jsp:include page="Menu.jsp"></jsp:include>
        </c:if>
        <section>

            <c:if test="${sessionScope.acc.role == 0}">
                <a href="manageaccount"><button class="btn btn-primary">Return</button></a>
            </c:if>
            <h1 class="text-center my-4">${account.name} Profile</h1>
        </section>
        <div class="container">
            <div class="main-body">
                <!-- Breadcrumb -->
                <!-- /Breadcrumb -->
                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                                    <div class="mt-3">
                                        <h4>${account.name}</h4>
                                        <p class="text-secondary mb-1">Phone: ${account.phone}</p>
                                        <p class="text-muted font-size-sm">Email: ${account.email}</p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <form action="edituser" method="post">
                                <input type="hidden" name="id" class="form-control" value="${account.userID}">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="name" class="form-control" value="${account.name}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="email" class="form-control" value="${account.email}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="phone" class="form-control" value="${account.phone}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Role</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <c:choose>
                                                <c:when test="${account.role == 1}">
                                                    <input readonly="" class="form-control" type="text" value="Admin" />
                                                </c:when>
                                                <c:otherwise>
                                                    <input readonly="" class="form-control" type="text" value="Normal user" />
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="address" class="form-control" value="${account.address}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <button class="btn btn-primary" type="submit">Save Changes</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h6 class="d-flex align-items-center mb-3">Change Password</h6>
                                <form action="edituser" method="post" id="passwordForm" >
                                    <input type="hidden" id="givenPassword" value="${account.pass}"> <!-- replace with actual password value -->
                                    <div class="form-group">
                                        <label>Current Password</label>
                                        <input type="password" name="currentPassword" class="form-control" id="currentPassword" >
                                    </div>
                                    <div class="form-group">
                                        <label>New Password</label>
                                        <input type="password" name="newPassword" class="form-control" id="newPassword">
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm New Password</label>
                                        <input type="password" name="confirmNewPassword" class="form-control" id="confirmNewPassword">
                                    </div>
                                    <button class="btn btn-primary" type="submit">Change Password</button>
                                    <input type="hidden" name="id" class="form-control" value="${account.userID}">
                                    <input type="hidden" name="name" class="form-control" value="${account.name}">
                                    <input type="hidden" name="email" class="form-control" value="${account.email}">
                                    <input type="hidden" name="phone" class="form-control" value="${account.phone}">
                                    <input type="hidden" name="address" class="form-control" value="${account.address}">

                                </form>

                                <script>
                                    document.getElementById('passwordForm').addEventListener('submit', function (event) {
                                        const givenPassword = document.getElementById('givenPassword').value;
                                        const currentPassword = document.getElementById('currentPassword').value;
                                        const newPassword = document.getElementById('newPassword').value;
                                        const confirmNewPassword = document.getElementById('confirmNewPassword').value;

                                        if (currentPassword !== givenPassword) {
                                            alert('Current password does not match the given password.');
                                            event.preventDefault(); // Prevent form submission
                                        } else if (newPassword !== confirmNewPassword) {
                                            alert('New password and confirm new password do not match.');
                                            event.preventDefault(); // Prevent form submission
                                        } else if (newPassword == givenPassword) {
                                            alert('New password must be difference current password.');
                                            event.preventDefault(); // Prevent form submission
                                        }
                                    });
                                </script>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
