<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Login Form</title>
        <style>
            body {
                background-color: #f7f7f7;
                font-family: 'Arial', sans-serif;
            }
            #logreg-forms {
                width: 100%;
                max-width: 380px;
                padding: 15px;
                margin: auto;
                margin-top: 100px;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            }
            .form-signin {
                width: 100%;
                margin: auto;
            }
            .form-signin .btn {
                border-radius: 50px;
            }
            .form-signin .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                font-size: 16px;
            }
            .form-signin .form-control:focus {
                z-index: 2;
            }
            .form-signin input[type="text"], .form-signin input[type="password"] {
                margin-bottom: 10px;
            }
            .form-signin .btn-primary a {
                color: white;
                text-decoration: none;
            }
            .form-signin .btn-primary a:hover {
                text-decoration: none;
            }
            .form-signin .error-message {
                color: red;
                text-align: center;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div id="logreg-forms">
            <form class="form-signin" action="login" method="get">
                <h1 class="h3 mb-3 font-weight-normal text-center">Sign in</h1>
                <p class="error-message">${error}</p>
                <input name="user" type="text" id="inputEmail" class="form-control" placeholder="Username" required autofocus>
                <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                <hr>
                <button class="btn btn-primary btn-block" type="button"><a href="signup">Sign up New Account</a></button>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
