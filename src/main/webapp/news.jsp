<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="pl_PL">
<head>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="resources/css/style.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Aclonica|Open+Sans" rel="stylesheet">
    <title>znajdźOpiekuna</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>

<body>
<div class="navbar navbar-default " style="margin-bottom: 0px;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand navbar-nav">
                <a href="#">
                    <div class="logo">znajdźOpiekuna</div>
                </a>
            </div>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <c:url value="/logout" var="logoutUrl"/>
                        <form action="${logoutUrl}" method="post" id="logoutForm">
                            <input type="hidden" name="${_csrf.parameterName}"
                                   value="${_csrf.token}"/>
                        </form>
                        <li>
                            <ol class="breadcrumb" style="float: left;">
                                <li class="active" style="color: #c09e6b;"><a
                                        href="indexService">Witaj, ${user.firstName}</a></li>
                                <li><a href="javascript:formSubmit();"> Wyloguj</a></li>
                            </ol>
                        </li>
                    </sec:authorize>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li><a href="login">Zaloguj się</a></li>
                    <li><a href="registration" style="color: #c09e6b;">Zarejestruj się</a></li>

                </c:if>
            </ul>
        </div>
    </div>
</div>
<div class="profile-navbar">
    <div class="container">
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <div class="col-lg-3" style="padding-left: 50px; padding-top: 22px;">
                <a href="news" style="color: white; font-size: 20px; padding-right: 20px;">Aktualności</a>
            </div>
            <div class="col-lg-3 col-lg-offset-6" style="padding-left: 50px; padding-top: 10px;">
                <a href="showMyProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
                <a href="editMyProfile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
                <a href="messages" style="color: white; font-size: 13px;">Wiadomości</a>
            </div>
        </c:if>
    </div>
</div>
<div class="container" style="min-height: 800px; background-color: white; padding-top: 30px;">
    <div class="row">
        <div class="col-lg-8">

            <h1 style="text-align: left">${newsList[0].title}</h1>
            <hr>
            <p style="text-align: left"><span class="glyphicon glyphicon-time"></span> Opublikowany: ${newsList[0].data}</p>

            <hr>

            <img class="img-responsive" src="/resources/img/img_news/${newsList[0].id}.jpg" width="900" height="300">

            <hr>
            <p>${newsList[0].description}</p>
            <!-- Post Content
            <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut,
                error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae
                laborum minus inventore?</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste
                ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus,
                voluptatibus.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde
                eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis.
                Enim, iure!</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error, nostrum, aliquid, animi, ut quas placeat
                totam sunt tempora commodi nihil ullam alias modi dicta saepe minima ab quo voluptatem obcaecati?</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum, dolor quis. Sunt, ut, explicabo, aliquam
                tenetur ratione tempore quidem voluptates cupiditate voluptas illo saepe quaerat numquam recusandae?
                Qui, necessitatibus, est!</p>-->

            <hr>

            <!-- Blog Comments -->

            <!-- Comments Form -->
            <div class="well">
                <h4>Leave a Comment:</h4>
                <form role="form">
                    <div class="form-group">
                        <textarea class="form-control" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <hr>

            <!-- Posted Comments -->

            <!-- Comment -->
            <div class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="http://placehold.it/64x64" alt="">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">Start Bootstrap
                        <small>August 25, 2014 at 9:30 PM</small>
                    </h4>
                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo.
                    Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
                    vulputate fringilla. Donec lacinia congue felis in faucibus.
                </div>
            </div>

            <!-- Comment -->
            <div class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="http://placehold.it/64x64" alt="">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">Start Bootstrap
                        <small>August 25, 2014 at 9:30 PM</small>
                    </h4>
                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo.
                    Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
                    vulputate fringilla. Donec lacinia congue felis in faucibus.
                    <!-- Nested Comment -->
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img class="media-object" src="http://placehold.it/64x64" alt="">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">Nested Start Bootstrap
                                <small>August 25, 2014 at 9:30 PM</small>
                            </h4>
                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin
                            commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce
                            condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                        </div>
                    </div>
                    <!-- End Nested Comment -->
                </div>
            </div>

        </div>

        <!-- Blog Sidebar Widgets Column -->
        <div class="col-md-4">

            <!-- Blog Search Well -->
            <div class="well">
                <h4>Blog Search</h4>
                <div class="input-group">
                    <input type="text" class="form-control">
                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="glyphicon glyphicon-search"></span>
                        </button>
                        </span>
                </div>
                <!-- /.input-group -->
            </div>

            <!-- Blog Categories Well -->
            <div class="well">
                <h4>Blog Categories</h4>
                <div class="row">
                    <div class="col-lg-6">
                        <ul class="list-unstyled">
                            <li><a href="#">Category Name</a>
                            </li>
                            <li><a href="#">Category Name</a>
                            </li>
                            <li><a href="#">Category Name</a>
                            </li>
                            <li><a href="#">Category Name</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <ul class="list-unstyled">
                            <li><a href="#">Category Name</a>
                            </li>
                            <li><a href="#">Category Name</a>
                            </li>
                            <li><a href="#">Category Name</a>
                            </li>
                            <li><a href="#">Category Name</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.row -->
            </div>

            <!-- Side Widget Well -->
            <div class="well">
                <h4>Side Widget Well</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus
                    laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
            </div>

        </div>

    </div>
    <!-- /.row -->

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; Your Website 2014</p>
            </div>
        </div>
        <!-- /.row -->
    </footer>

</div>
<!-- /.container -->

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
</div>

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/scrollReveal.js"></script>
<script src="resources/js/custom.js"></script>
<script src="resources/js/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
</body>
</html>