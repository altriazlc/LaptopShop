<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <script src="js/modernizr.js"></script> 
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <section class="jumbotron text-center bg-light">
                <div class="container" style="padding-top: 50px;">
                    <h1 class="jumbotron-heading display-4">The High Quality Laptop Shop</h1>
                    <p class="lead text-muted">Your one-stop shop for the latest and greatest laptops from top brands.</p>
                </div>
            </section>
            <div class="container">
            <c:forEach items="${requestScope.laptop}" var="l">
                <c:if test="${l.laptopid == info.laptopid}">
                    <c:set value="${l.name}" var="laptopname"/>
                    <c:set value="${l.price}" var="laptopprice"/>
                    <c:set value="${l.desc}" var="laptopdesc"/>
                    <c:set value="${l.stock}" var="laptopstock"/>
                    <c:set value="${l.laptopid}" var="lid"/>
                    <c:set value="${l.img}" var="laptopimg"/>
                </c:if>
            </c:forEach>
            <jsp:include page="LeftShop.jsp"></jsp:include>
                <div class="col-sm-9">
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-8 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                            <div> 
                                                <a href="#">
                                                    <img src="${laptopimg}" alt="Laptop Image" class="img-fluid"/>
                                            </a>
                                        </div>
                                    </div> <!-- img-big-wrap -->

                                    <h2 class="my-4">${laptopname} Specification:</h2>
                                    <table class="table table-striped">
                                        <tr>
                                            <td>CPU:</td>
                                            <td>${info.cpu}</td>
                                        </tr>
                                        <tr>
                                            <td>Storage:</td>
                                            <td>${info.storage}</td>
                                        </tr>
                                        <tr>
                                            <td>Graphic Card:</td>
                                            <td>${info.card}</td>
                                        </tr>
                                        <tr>
                                            <td>RAM:</td>
                                            <td>${info.ram}</td>
                                        </tr>
                                        <tr>
                                            <td>Battery Life:</td>
                                            <td>${info.battery}</td>
                                        </tr>
                                        <tr>
                                            <td>Screen Size:</td>
                                            <td>${info.res}</td>
                                        </tr>
                                        <tr>
                                            <td>Operating System:</td>
                                            <td>${info.os}</td>
                                        </tr>
                                        <tr>
                                            <td>Weight:</td>
                                            <td>${info.weight}</td>
                                        </tr>
                                    </table>
                                </article> <!-- gallery-wrap -->
                            </aside>

                            <aside class="col-sm-4">
                                <article class="card shadow-sm border-0">
                                    <div class="card-body p-5">
                                        <h3 class="card-title text-center mb-4">${laptopname}</h3>
                                        <p class="price-detail-wrap text-center mb-4"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">US $</span><span class="num">${laptopprice}</span>
                                            </span> 
                                        </p>
                                        <dl class="item-property">
                                            <dt class="text-muted">Description</dt>
                                            <dd><p>${laptopdesc}</p></dd>
                                        </dl>
                                        <hr>
                                        <div class="row mb-3">
                                            <div class="col-sm-5">
                                                <dl class="param param-inline">
                                                    <!-- Additional properties can go here -->
                                                </dl> <!-- item-property -->
                                            </div> <!-- col -->
                                        </div> <!-- row -->
                                        <div class="text-center">
                                            <a href="addcart?pid=${lid}&quantity=${quantity}" class="btn btn-lg btn-primary text-uppercase mb-2"> Buy Now </a>
                                            <a href="shop" class="btn btn-lg btn-secondary text-uppercase"> Return to Shop </a>
                                        </div>
                                    </div> <!-- card-body -->
                                </article> <!-- card -->
                            </aside> <!-- col -->

                        </div> <!-- row -->
                    </div> <!-- card -->
                </div> <!-- container -->
            </div> <!-- col -->

            <div class="row"> 

                <h3 style="margin-top: 150px">Same Product</h3>
                <c:forEach items="${requestScope.samelaptop}" var="l">
                    <div class="col-12 col-md-6 col-lg-4 mb-4">
                        <div class="card h-100 shadow-sm">
                            <img class="card-img-top" src="${l.img}" alt="Card image cap" style="width: 100%; height: 200px; object-fit: cover;">
                            <div class="card-body d-flex flex-column">
                                <h4 class="card-title"><a href="detail?pid=${l.laptopid}" title="View Product" class="text-decoration-none text-dark">${l.name}</a></h4>
                                    <c:forEach items="${requestScope.spec}" var="s">
                                        <c:if test="${s.laptopid==l.laptopid}">
                                        <h6 class="card-text text-muted">CPU: ${s.cpu}</h6>
                                        <h6 class="card-text text-muted">Ram ${s.ram}</h6>
                                        <h6 class="card-text text-muted"> Graphic card: ${s.card}</h6>     
                                        <h6 class="card-text text-muted"> Storage: ${s.storage}</h6>     

                                    </c:if>

                                </c:forEach>
                                <div class="mt-auto">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="btn btn-light border">${l.price} $</span>
                                        <a href="addcart?pid=${l.laptopid}&quantity=1" class="btn btn-primary">Add to cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
    <!-- Footer -->
    <footer class="text-light">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-lg-4 col-xl-3">
                    <h5>About</h5>
                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                    <p class="mb-0">
                        Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.
                    </p>
                </div>

                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                    <h5>Informations</h5>
                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                    <ul class="list-unstyled">
                        <li><a href="">Link 1</a></li>
                        <li><a href="">Link 2</a></li>
                        <li><a href="">Link 3</a></li>
                        <li><a href="">Link 4</a></li>
                    </ul>
                </div>

                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                    <h5>Others links</h5>
                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                    <ul class="list-unstyled">
                        <li><a href="">Link 1</a></li>
                        <li><a href="">Link 2</a></li>
                        <li><a href="">Link 3</a></li>
                        <li><a href="">Link 4</a></li>
                    </ul>
                </div>

                <div class="col-md-4 col-lg-3 col-xl-3">
                    <h5>Contact</h5>
                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                    <ul class="list-unstyled">
                        <li><i class="fa fa-home mr-2"></i> My company</li>
                        <li><i class="fa fa-envelope mr-2"></i> email@example.com</li>
                        <li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
                        <li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
                    </ul>
                </div>
                <div class="col-12 copyright mt-3">
                    <p class="float-left">
                        <a href="#">Back to top</a>
                    </p>
                    <p class="text-right text-muted">created with <i class="fa fa-heart"></i> by <a href="https://t-php.fr/43-theme-ecommerce-bootstrap-4.html"><i>t-php</i></a> | <span>v. 1.0</span></p>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
