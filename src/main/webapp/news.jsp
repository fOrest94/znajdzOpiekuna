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
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/style.css" rel="stylesheet"/>
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
                <a href="#" style="color: white; font-size: 20px; padding-right: 20px;">Aktualności</a>
            </div>
            <div class="col-lg-3 col-lg-offset-6" style="padding-left: 50px; padding-top: 10px;">
                <a href="/showMyProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
                <a href="/editMyProfile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
                <a href="/messages" style="color: white; font-size: 13px;">Wiadomości</a>
            </div>
        </c:if>
    </div>
</div>
<div class="container" style="min-height: 800px; background-color: white; padding-top: 30px;">
    <div class="row">
        <div class="col-lg-8">
            <c:if test="${not empty mainNews}">
                <h1 style="text-align: left">${mainNews.title}</h1>
                <hr>
                <p style="text-align: left"><span class="glyphicon glyphicon-time"></span>
                    Opublikowany: ${mainNews.data}
                </p>
                <hr>
                <img class="img-responsive" src="/resources/img/img_news/${mainNews.id}.jpg" width="900" height="300">
                <hr>
                <p>${mainNews.description}</p>
                <hr>
                <div class="well">
                    <h4>Dodaj komentarz:</h4>
                    <form:form method="post" modelAttribute="commentForm">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <form:input type="hidden" path="userId" value="${user.id}"/>
                        <form:input type="hidden" path="newsId" value="${mainNews.id}"/>
                        <form:input type="hidden" path="firstName" value="${user.firstName}"/>
                        <form:input type="hidden" path="lastName" value="${user.lastName}"/>
                        <div class="form-group">
                            <form:textarea path="comment_description" class="form-control" rows="3"></form:textarea>
                        </div>
                        <button type="submit" class="btn btn-danger">Potwierdź</button>
                    </form:form>
                </div>
            </c:if>
            <hr>
            <c:if test="${not empty commentList}">
                <c:forEach var="commentView" items="${commentList}">
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img class="media-object" src="/resources/pictures/profileImages/${commentView.userId}.jpg"
                                 height="64"
                                 width="64">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">${commentView.firstName} ${commentView.lastName}
                                <small>${commentView.data}</small>
                            </h4>
                                ${commentView.comment_description}
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
        <div class="col-md-4">
            <div class="well">
                <h4>Szukaj</h4>
                <div class="input-group">
                    <input type="text" class="form-control">
                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="glyphicon glyphicon-search"></span>
                        </button>
                        </span>
                </div>
            </div>

            <div class="well">
                <h4>Inne aktualności</h4>
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="list-unstyled">
                            <c:if test="${not empty newsList}">
                                <c:forEach var="listView" items="${newsList}">
                                    <li><a href="/news/${listView.id}" style="font-size: 18px; color: #101010">${listView.title}</a></li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="well">
                <h4>Reklama</h4>
                <img class="img-responsive" src="/resources/img/ads.jpg" width="300" height="200">

            </div>
        </div>
    </div>

    <hr>
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; PK 2016</p>
            </div>
        </div>
    </footer>
</div>

<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/scrollReveal.js"></script>
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
</body>
</html>