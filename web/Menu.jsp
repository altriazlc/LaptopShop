<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="search-popup">
    <div class="search-popup-container">

        <form role="search" method="get" class="search-form" action="">
            <input type="search" id="search-form" class="search-field" placeholder="Type and press enter" value="" name="s" />
            <button type="submit" class="search-submit"><svg class="search"><use xlink:href="#search"></use></svg></button>
        </form>

        <h5 class="cat-list-title">Browse Categories</h5>

        <ul class="cat-list">
            <li class="cat-list-item"><a href="shop">All</a></li>
                <c:forEach items="${requestScope.cat}" var="c">
                <li class="cat-list-item"><a href="catcontent?id=${c.catid}">${c.catname}</a></li>
                </c:forEach>

        </ul>

    </div>
</div>

<header id="header" class="site-header header-scrolled position-fixed text-black bg-light">
    <nav id="header-nav" class="navbar navbar-expand-lg px-3 mb-3">
        <div class="container-fluid">
            <a class="navbar-brand" href="home">
                <h1>HOANGANHTECH</h1>
            </a>
            <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <svg class="navbar-icon">
                <use xlink:href="#navbar-icon"></use>
                </svg>
            </button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel">
                <div class="offcanvas-header px-4 pb-0">
                    <a class="navbar-brand" href="home">
                        <img src="images/main-logo.png" class="logo">
                    </a>
                    <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas" aria-label="Close" data-bs-target="#bdNavbar"></button>
                </div>
                <div class="offcanvas-body">
                    <ul id="navbar" class="navbar-nav text-uppercase justify-content-end align-items-center flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link me-4 active" href="home">Home</a>
                        </li>
                        <c:if test="${sessionScope.acc.role != 0}">
                            <li class="offcanvas-body">
                                <a href="cartshow?uid=${sessionScope.acc.userID}" class="dropdown-item">Cart(${requestScope.cartnumber})</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="showbill?id=${sessionScope.acc.userID}">Bill</a>
                            </li>
                        </c:if>
                        <li class="offcanvas-body">
                            <a href="shop" class="dropdown-item">Shop</a>
                        </li>

                        <c:if test="${sessionScope.acc.role == 0}">
                            <li class="nav-item">
                                <a class="nav-link" href="manageproduct">Manager</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc != null }">
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="login">Login</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 1}">
                            <li class="nav-item" style="margin-left: 7px">
                                <a href="edituser?id=${sessionScope.acc.userID}">
                                    User ${sessionScope.acc.name}
                                </a>
                            </li> 
                        </c:if>
                        <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 0}">
                            <li class="nav-item" style="margin-left: 7px">
                                <a href="edituser?id=${sessionScope.acc.userID}">
                                    Admin ${sessionScope.acc.name}
                                </a>
                            </li> 
                        </c:if>

                        <li class="nav-item">
                            <div class="user-items ps-5">
                                <ul class="d-flex justify-content-end list-unstyled" >
                                    <li class="pe-3">
                                        <form action="search" method="post" class="form-inline my-2 my-lg-0">
                                            <div class="input-group input-group-sm">
                                                <input name="item" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" style="width: 50%" placeholder="Search...">
                                                <div class="input-group-append">
                                                    <button type="submit" class="btn btn-secondary btn-number">
                                                        Find
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </li>

                                </ul>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>
