<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Sign Up Form</title>
        <style>
            body {
                background-color: #f7f7f7;
                font-family: 'Arial', sans-serif;
            }
            .form-signup {
                max-width: 400px;
                margin: 50px auto;
                padding: 20px;
                background-color: #ffffff;
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .form-signup .btn {
                border-radius: 50px;
            }
            .form-signup .form-control {
                margin-bottom: 10px;
                padding: 10px;
                font-size: 16px;
            }
            .form-signup .error-message {
                color: red;
                text-align: center;
                margin-bottom: 15px;
            }
            .form-signup .success-message {
                color: green;
                text-align: center;
                margin-bottom: 15px;
            }
            .form-signup label {
                font-weight: bold;
            }
            .form-signup small {
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <form action="signup" id="signupForm" method="post" class="form-signup">
                <h1 class="h3 mb-3 font-weight-normal text-center">Sign up</h1>
                
                <c:if test="${acc.role == 0 && mess != null}">
                    <p class="success-message">Add successfully</p>
                </c:if>
                <c:if test="${acc == null}">
                    <p class="success-message">${mess}</p>
                </c:if>
                
                <div class="form-group">
                    <label for="user-name">User name</label>
                    <input name="user" type="text" id="user-name" class="form-control" placeholder="Enter user name" required>
                    <small>${uerror}</small>
                </div>

                <div class="form-group">
                    <label for="user-fullname">Full name</label>
                    <input name="fullname" type="text" id="user-fullname" class="form-control" placeholder="Enter full name" required>
                </div>

                <div class="form-group">
                    <label for="user-phone">Phone number</label>
                    <input name="phone" type="tel" id="user-phone" class="form-control" placeholder="Enter phone number" required>
                </div>
                
                <c:if test="${acc.role == 0}">
                    <div class="form-group">
                        <label for="user-role">User role</label>
                        <select name="role" class="form-control">
                            <option value="1">Normal user</option>
                            <option value="0">Admin</option>
                        </select>
                    </div>
                </c:if>
                
                <div class="form-group">
                    <label for="user-mail">Email address</label>
                    <input name="email" type="email" id="user-mail" class="form-control" placeholder="Enter email" required>
                    <small id="emailHelp" class="form-text text-muted"></small>
                    <small>${eerror}</small>
                </div>

                <div class="form-group">
                    <label for="user-address">Address</label>
                    <input name="address" type="text" id="user-address" class="form-control" placeholder="Enter address" required>
                </div>

                <div class="form-group">
                    <label for="user-pass">Password</label>
                    <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Enter password" required>
                    <small id="passwordError"></small>
                </div>

                <div class="form-group">
                    <label for="user-repeatpass">Repeat Password</label>
                    <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat password" required>
                </div>

                <button class="btn btn-lg btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
                
                <c:if test="${acc == null}">
                    <a href="Login.jsp" class="btn btn-lg btn-secondary btn-block"><i class="fas fa-angle-left"></i> Back to Login</a>
                </c:if>
                <c:if test="${acc.role == 0}">
                    <a href="manageaccount" class="btn btn-lg btn-secondary btn-block"><i class="fas fa-angle-left"></i> Back to User Manager</a>
                </c:if>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
            document.getElementById('signupForm').addEventListener('submit', function (event) {
                var emailInput = document.getElementById('user-mail');
                var email = emailInput.value;
                var emailHelp = document.getElementById('emailHelp');
                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                if (!emailPattern.test(email)) {
                    emailHelp.textContent = "Please enter a valid email address.";
                    emailHelp.style.color = "red";
                    event.preventDefault(); // Prevent form submission
                } else {
                    emailHelp.textContent = "";
                }

                var password = document.getElementById('user-pass').value;
                var repeatPassword = document.getElementById('user-repeatpass').value;
                var passwordError = document.getElementById('passwordError');

                if (password !== repeatPassword) {
                    passwordError.textContent = "Passwords do not match.";
                    passwordError.style.color = "red";
                    event.preventDefault(); // Prevent form submission
                } else {
                    passwordError.textContent = "";
                }
            });
        </script>
    </body>
</html>
