<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>

<!DOCTYPE HTML>
<head>

    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Aclonica|Open+Sans" rel="stylesheet">
    <title>znajdźOpiekuna</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>

<body>
<div class="navbar navbar-default" style="margin-bottom: 0px;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <div class="navbar-brand navbar-nav">
                <a href="/index">
                    <div class="logo">znajdźOpiekuna</div>
                </a>
            </div>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right" style="padding-right: 0px;">
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
                                        href="indexService">Witaj, ${userName}</a></li>
                                <li><a href="javascript:formSubmit()"> Wyloguj</a></li>
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
            <div class="col-lg-4" style="padding-left: 40px; padding-top: 22px;">
                <a href="/indexService?username=user123&address=38-200&typeOfUser=2"
                   style="color: white; font-size: 20px; padding-right: 20px;">Znajdź</a>
                <a href="/news/0" style="color: white; font-size: 16px; padding-right: 20px;">Aktualności</a>
                <a href="/ranking" style="color: white; font-size: 16px; padding-right: 20px;">Ranking</a>
            </div>
            <div class="col-lg-4 col-lg-offset-4" style="padding-left: 120px; padding-top: 10px;">
                <a href="/showMyProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
                <a href="/editMyProfile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
                <a href="/message/0" style="color: white; font-size: 13px;">Wiadomości
                    <c:if test="${unreadMess != 0}">
                        (${unreadMess})
                    </c:if></a>
            </div>
        </c:if>
    </div>
</div>
<c:if test="${pageContext.request.userPrincipal.name != null && whatShow == 1}">
    <div class="container" style="background-color: white;">
        <ul class="nav nav-tabs" style="font-size: 10px;" role="tablist">
            <li role="presentation" class="active"><a style="font-size: 18px; " href="/showMyProfile">Profil</a></li>
            <li role="presentation"><a style="font-size: 18px; " href="/editMyProfile">Edycja</a></li>
            <li role="presentation"><a style="font-size: 18px; " href="/advancedSettings">Zaawansowane</a></li>
            <c:if test="${userToShow.role eq 'ADMINISTRATOR'}">
                <li role="presentation"><a style="font-size: 18px; " href="/newsManagement">Zarządzaj aktualnościami</a>
                </li>
                <li role="presentation"><a style="font-size: 18px; " href="/usersManagement">Zarządzaj użytkownikami</a>
                </li>
            </c:if>

        </ul>
    </div>
</c:if>
<div class="container" style="min-height: 800px; background-color: white; padding-top: 70px;">

    <div class="col-lg-5" style="height: 380px;">
        <div class="col-lg-12" style=" text-align: center;">
            <div class="col-lg-9 col-lg-offset-1" style="height: 340px;">
                <img src="/resources/pictures/profileImages/${userToShow.id}.jpg"
                     width="300" height="300">
            </div>
        </div>
    </div>
    <div class="col-lg-7" style="height: 380px;">
        <div class="row">
            <h1 style="text-align: left; font-size: 35px; color: #FF4F4F;">${userToShow.firstName} ${userToShow.lastName}</h1>
            <hr>
            <div class="col-lg-6">
                <h3 style="text-align: left; ">
                    ${userToShow.sex}, ${userToShow.age} lat</h3>
                <c:if test="${userToShow.userType eq 1 }">
                    <h3 style="text-align: left; ">Wynagrodzenie: ${userParent.moneyPerHour }zł/h</h3>
                </c:if>
                <c:if test="${userToShow.userType eq 2 }">
                    <h3 style="text-align: left; ">Wynagrodzenie: ${userNanny.moneyPerHour }zł/h</h3>
                </c:if>
                <h3 style="text-align: left; ">Lokalizacja: ${userToShow.town} ${userToShow.zipCode}</h3>
                <c:if test="${userToShow.userType eq 1 }">
                    <h3 style="text-align: left; ">Telefon: ${userParent.phoneNumber }</h3>
                </c:if>
                <c:if test="${userToShow.userType eq 2 }">
                    <h3 style="text-align: left; ">Telefon: ${userNanny.phoneNumber }</h3>
                </c:if>
                <h3 style="text-align: left; display: inline;">Ocena: 4.5</h3>
                <form  method="post" modelAttribute="commentForm" action="/showProfile/${userToShow.id}">
                    <fieldset style="background-color: white;">
                    <span class="star-cb-group">
                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                      <input type="radio" id="rating-5" name="radio" value="5" /><label for="rating-5">5</label>
                      <input type="radio" id="rating-4" name="radio" value="4" checked="checked" /><label for="rating-4">4</label>
                      <input type="radio" id="rating-3" name="radio" value="3" /><label for="rating-3">3</label>
                      <input type="radio" id="rating-2" name="radio" value="2" /><label for="rating-2">2</label>
                      <input type="radio" id="rating-1" name="radio" value="1" /><label for="rating-1">1</label>
                    </span>
                    </fieldset>
                    <input type="submit" />
                </form>
            </div>
            <div class="col-lg-6" style="padding-top: 30px;">
                <a href="/message/${userToShow.id}" class="btn btn-danger"
                   style="width: 180px; font-size: 19px; color: white;">Napisz
                    do mnie!</a>
                <div class="col-lg-12" style="padding-top: 60px; padding-right: 0px; ">
                    <c:if test="${userToShow.identity eq 0}">
                        <img style="padding: 0px;" src="/resources/img/smilee.png"> <strong>Tożsamość
                        potwierdzona</strong>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
    <div class="col-lg-7 col-lg-offset-5" style=" padding-bottom: 100px;">
        <div class="panel panel-default" style="width: 520px;">
            <div class="panel-heading">O mnie</div>
            <div class="panel-body" style="word-break:break-all;">
                <c:if test="${userToShow.userType eq 1 }">
                    ${userParent.writeSthAboutYou}
                </c:if>
                <c:if test="${userToShow.userType eq 2 }">
                    ${userNanny.writeSthAboutYou}
                </c:if>
            </div>
        </div>

        <c:if test="${userToShow.userType eq 2 }">
            <p style="font-size: 16px; text-align: left;">
            <div class="panel">
                <h3 style="text-align: left;">Prace których się podejmę:</h3>
            </div>
            <br>
            <img src="/resources/img/${userNanny.whoWannCareNanny}.png"> Opieka nad
            dziećmi<br>
            <img src="/resources/img/${userNanny.whoWannCareOld }.png"> Opieka nad
            starszymi<br>
            <br>
            <div class="panel">
                <h3 style="text-align: left;">Miejsce opieki:</h3>
            </div>
            <br>
            <c:choose>
                <c:when test="${userNanny.placeOfTakeCare == 1}">
                    <img src="/resources/img/1.png"> Dowolne<br>
                    <img src="/resources/img/0.png"> U rodziców<br>
                    <img src="/resources/img/0.png"> U niani <br>
                </c:when>
                <c:when test="${userNanny.placeOfTakeCare == 2}">
                    <img src="/resources/img/0.png"> Dowolne<br>
                    <img src="/resources/img/1.png"> U rodziców<br>
                    <img src="/resources/img/0.png"> U niani <br>
                </c:when>
                <c:otherwise>
                    <img src="/resources/img/0.png"> Dowolne<br>
                    <img src="/resources/img/0.png"> U rodziców<br>
                    <img src="/resources/img/1.png"> U niani <br>
                </c:otherwise>
            </c:choose><br>
            <div class="panel">
                <h3 style="text-align: left;">Zajęcia z podopiecznymi:</h3>
            </div>
            <br>
            <img src="/resources/img/${userNanny.otherActClean}.png"> Dowolne<br>
            <img src="/resources/img/${userNanny.otherActCook}.png"> U rodziców<br>
            <img src="/resources/img/${userNanny.otherActShop}.png"> U niani <br>
            <img src="/resources/img/${userNanny.otherActVac}.png"> U niani <br>
            <div class="panel">
                <h3 style="text-align: left;">Inne umiejętności:</h3>
            </div>
            ${userNanny.otherSkills}<br><br>
            <div class="panel">
                <h3 style="text-align: left;">Doświadczenie w pracy z dziećmi:</h3>
            </div>
            <img src="/resources/img/${userNanny.careExpKids}.png">
            <c:choose>
                <c:when test="${userNanny.careExpKids == true}">
                    Tak<br>Staż: ${userNanny.experienceKidsTime}<br>
                </c:when>
                <c:otherwise>
                    Nie<br>
                </c:otherwise>
            </c:choose><br>
            <div class="panel">
                <h3 style="text-align: left;">Doświadczenie w pracy ze starszymi:</h3>
            </div>
            <img src="/resources/img/${userNanny.careExpOld}.png">
            <c:choose>
                <c:when test="${userNanny.careExpOld == true}">
                    Tak<br>Staż: ${userNanny.experienceOldTime}<br>
                </c:when>
                <c:otherwise>
                    Nie<br>
                </c:otherwise>
            </c:choose><br>
            <div class="panel">
                <h3 style="text-align: left;">Wymiar etatu:</h3>
            </div>
            <br>
            <img src="/resources/img/${userNanny.timeJobHalf}.png"> Pół etatu<br>
            <img src="/resources/img/${userNanny.timeJobFull}.png"> Pełny etat<br>
            <img src="/resources/img/${userNanny.timeJobCasual}.png"> Dorywczo <br>
            <br>
            <div class="panel">
                <h3 style="text-align: left;">Praca z domem:</h3>
            </div>
            <br>
            <img src="${pageContext.request.contextPath}/resources/img/${userNanny.workWithHome}.png">
            <c:choose>
                <c:when test="${userNanny.workWithHome == true}">
                    Tak<br>
                </c:when>
                <c:otherwise>
                    Nie<br>
                </c:otherwise>
            </c:choose>
            <div class="panel">
                <h3 style="text-align: left;">Wykształcenie:</h3>
            </div>
            ${userNanny.education}<br><br>
            <div class="panel">
                <h3 style="text-align: left;">Języki obce:</h3>
            </div>
            ${userNanny.foreignLanguages}<br>
        </c:if>
        <c:if test="${userToShow.userType eq 1 }">
            <p style="font-size: 16px; text-align: left;">
            <div class="panel">
                <h3 style="text-align: left;">Poszukuję opieki dla:</h3>
            </div>
            <br>
            <img src="/resources/img/${userParent.whoWannCareNanny}.png"> Dziecka<br>
            <img src="/resources/img/${userParent.whoWannCareOld }.png"> Osoby starszej<br>
            <img src="/resources/img/${userParent.workWithHome}.png"> Domu<br>
            <br>
        </c:if>
        <br>
    </div>

        <c:if test="${not empty userName && whatShow == 0}">
            <div class="col-lg-12">
                <div class="well">
                <h4>Dodaj komentarz:</h4>
                <form:form method="post" modelAttribute="commentForm" action="/showProfile/${userToShow.id}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="radio" value="0"/>
                    <form:input type="hidden" path="commentedId" value="${userToShow.id}"/>
                    <form:input type="hidden" path="firstName" value="${userName}"/>
                    <div class="form-group">
                        <form:textarea path="comment_description" class="form-control" rows="3"></form:textarea>
                    </div>
                    <button type="submit" class="btn btn-danger">Potwierdź</button>
                </form:form></div>

        </c:if>

        <c:if test="${not empty commentsList}">
            <c:forEach var="commentView" items="${commentsList}">
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
        </c:if></div>

</div>

<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/scrollReveal.js"></script>
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/script.js"></script>

</body>
</html>