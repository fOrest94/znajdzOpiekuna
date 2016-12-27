<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>

<!DOCTYPE HTML>
<head>

    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet"/>
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
                                        href="indexService">Witaj, ${user.firstName}</a></li>
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
                <a href="/indexService?username=user123&address=38-200&typeOfUser=2" style="color: white; font-size: 20px; padding-right: 20px;">Znajdź</a>
                <a href="/news/0" style="color: white; font-size: 16px; padding-right: 20px;">Aktualności</a>
                <a href="#" style="color: white; font-size: 16px; padding-right: 20px;">Forum</a>
            </div>
            <div class="col-lg-3 col-lg-offset-5" style="padding-left: 50px; padding-top: 10px;">
                <a href="/showMyProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
                <a href="/editMyProfile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
                <a href="/message/0" style="color: white; font-size: 13px;">Wiadomości</a>
            </div>
        </c:if>
    </div>
</div>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <div class="container" style="background-color: white;">
        <ul class="nav nav-tabs" style="font-size: 10px;" role="tablist">
            <li role="presentation" ><a style="font-size: 18px; "href="/showMyProfile">Profil</a></li>
            <li role="presentation" class="active"><a style="font-size: 18px; "href="/editMyProfile">Edycja</a></li>
            <c:if test="${user.role eq 'ADMINISTRATOR'}">
                <li role="presentation"><a style="font-size: 18px; "href="/newsManagement">Zarządzaj aktualnościami</a></li>
                <li role="presentation" ><a style="font-size: 18px; "href="/usersManagement">Zarządzaj użytkownikami</a></li>
            </c:if>

        </ul>
    </div>
</c:if>
<div class="container" style="min-height: 800px; background-color: white; padding-top: 70px;">

    <div class="col-lg-5" style="height: 420px;">

        <div class="col-lg-12" style=" text-align: center;">
            <div class="col-lg-9 col-lg-offset-1" style="height: 500px;">

                <img src="resources/pictures/profileImages/${user.id}.jpg"
                     width="300" height="300">
                <form:form method="POST" modelAttribute="fileBucket"
                           enctype="multipart/form-data" class="form-horizontal">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <div class="col-md-7">
                                <form:input type="file" path="file" class="upload" />
                                <div class="has-error">
                                    <form:errors path="file" class="help-inline"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-actions floatRight">
                            <input type="submit" value="Zapisz"
                                   class="btn btn-danger btn-sm">
                        </div>
                    </div>
                </form:form>
                File <strong>${fileName}</strong> uploaded successfully.
            </div>
        </div>
    </div>
    <div class="col-lg-7" style="height: 420px">
        <div class="row">
            <h1 style="text-align: left; font-size: 35px; color: #FF4F4F;">${user.firstName} ${user.lastName}</h1>
            <hr>
            <div class="col-lg-6">
                <h3 style="text-align: left; "><c:choose>
                    <c:when test="${user.sex == false}">
                        Kobieta
                    </c:when>
                    <c:otherwise>
                        Mężczyzna
                    </c:otherwise>
                </c:choose>lat</h3>
                <h3 style="text-align: left; ">Lokalizacja: ${user.zipCode}</h3>
                <h3 style="text-align: left; ">Ocena: 4.5</h3>
            </div>


        </div>
    </div>
    <div class="col-lg-7 col-lg-offset-4" style="min-height: 500px; padding-bottom: 100px;">

        <c:if test="${user.userType eq 1 }">
            <form:form method="post" action="/editMyProfile" modelAttribute="searchCare" class="form-horizontal">
                <div class="panel-body">

                    <div id="signupalert" style="display:none" class="alert alert-danger">
                        <p>Error:</p>
                        <span></span>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: left">Szukasz opieki dla:</label>
                        <div class="col-lg-9" style="padding-top: 1px">
                            <div class="col-md-4" style="padding-left: 30px;">
                                <spring:bind path="whatWannaCare">
                                <form:checkbox path="whatWannaCare" id="checkbox1" value="nanny"/>
                                <form:errors path="whatWannaCare" cssClass="error"/>
                                <label for="checkbox1">Dziecka</label>
                                <form:hidden path="userId" value="${user.id}"/>
                            </div>
                            </spring:bind>
                            <div class="col-md-4" style="padding-left: 10px;">
                                <spring:bind path="whatWannaCare">
                                    <form:checkbox path="whatWannaCare" id="checkbox2" value="old"/>
                                    <form:errors path="whatWannaCare" cssClass="error"/>
                                    <label for="checkbox2">Osoby starszej</label>
                                </spring:bind>
                            </div>
                            <div class="col-md-4">
                                <spring:bind path="whatWannaCare">
                                    <form:checkbox path="whatWannaCare" id="checkbox3" value="home"/>
                                    <form:errors path="whatWannaCare" cssClass="error"/>
                                    <label for="checkbox3">Domu</label>
                                </spring:bind>
                            </div>
                        </div>
                    </div>
                    <hr/>


                    <div class="form-group" style="margin-top: 20px;">
                        <spring:bind path="writeSthAboutYou">
                            <label class="col-md-3 control-label" style="text-align: left">Napisz coś o
                                sobie</label>
                            <div class="col-md-8 ">
                                <form:textarea path="writeSthAboutYou" rows="8" cols="53"
                                               style="margin-left: 20px; border-radius: 3px;"/>
                                <form:errors path="writeSthAboutYou" cssClass="error"/>
                            </div>
                        </spring:bind>

                    </div>
                    <hr/>

                    <div class="form-group" style="margin-top: 20px; ">
                        <label class="col-md-3 control-label" style="text-align: left">Cena za godzinę
                            opieki</label>
                        <div class="col-md-2 " style="padding-left: 35px;">
                            <spring:bind path="moneyPerHour">
                                <form:input path="moneyPerHour" class="form-control" placeholder="zł/h"
                                            style="margin-top: 5px; "/>
                                <form:errors path="moneyPerHour" cssClass="error"/>
                            </spring:bind>
                        </div>
                        <div class="col-md-7 " style="margin-top: 10px; padding-right: 20px;">
                            <p style="font-size: 17px; text-align: left; padding-top: 2px;">zł/h</p>
                        </div>
                    </div>
                    <hr/>
                    <div class="form-group">
                        <div class="col-md-offset-8 col-md-4">
                            <input type="submit" value="Aktualizuj" class="btn btn-danger"
                                   style="font-size: 14px;">
                        </div>
                    </div>
                </div>
            </form:form>
        </c:if>

        <c:if test="${user.userType eq 2 }">
            <form:form method="post" action="/editMyProfile" modelAttribute="offerCare" class="form-horizontal">
                <div class="panel panel-danger" style="border-color: #fcb2ab;  margin-top: 200px;">
                    <div class="panel-heading">
                        <div class="panel-title"><p>${user.firstName}, uzupełnij swój profil</p></div>

                    </div>
                    <div class="panel-body">

                        <div id="signupalert" style="display:none" class="alert alert-danger">
                            <p>Error:</p>
                            <span></span>
                        </div>

                        <div class="form-group" style="border-bottom: 12px; ">
                            <label class="col-md-3 control-label" style="text-align: left">Kim chcesz się
                                opiekować</label>
                            <div class="col-md-4">
                                <div class="col-md-4" style="padding-left: 10px;">
                                    <spring:bind path="whatWannaCare">
                                        <form:checkbox path="whatWannaCare" id="checkbox1" value="nanny"/>
                                        <form:errors path="whatWannaCare" cssClass="error"/>
                                        <label for="checkbox1">Dzieci</label>
                                    </spring:bind>
                                    <form:hidden path="userId" value="${user.id}"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <spring:bind path="whatWannaCare">
                                    <form:checkbox path="whatWannaCare" id="checkbox2" value="old"/>
                                    <form:errors path="whatWannaCare" cssClass="error"/>
                                    <label for="checkbox2">Osoby starsze</label>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>
                        <div class="form-group">
                            <label class="col-md-3 control-label" style="text-align: left">Jakie inne zajęcia jesteś w
                                stanie wykonywać</label>
                            <div class="col-md-4">
                                <spring:bind path="otherActivities">
                                    <form:checkbox path="otherActivities" id="checkbox1" value="shop"/>
                                    <form:errors path="otherActivities" cssClass="error"/>
                                    <label for="checkbox1">Zakupy</label>
                                </spring:bind>
                            </div>
                            <div class="col-md-4">
                                <spring:bind path="otherActivities">
                                    <form:checkbox path="otherActivities" id="checkbox3" value="clean"/>
                                    <form:errors path="otherActivities" cssClass="error"/>
                                    <label for="checkbox3">Sprzątanie</label>
                                </spring:bind>
                            </div>
                            <div class="col-md-4">
                                <spring:bind path="otherActivities">
                                    <form:checkbox path="otherActivities" id="checkbox4" value="vacum"/>
                                    <form:errors path="otherActivities" cssClass="error"/>
                                    <label for="checkbox4">Pranie</label>
                                </spring:bind>
                            </div>
                            <div class="col-md-4">
                                <spring:bind path="otherActivities">
                                    <form:checkbox path="otherActivities" id="checkbox2" value="cook"/>
                                    <form:errors path="otherActivities" cssClass="error"/>
                                    <label for="checkbox2">Gotowanie</label>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="margin-top: 20px;">
                            <spring:bind path="otherSkills">
                                <label for="otherSkills" class="text-left col-md-3 control-label "
                                       style="text-align: left">Inne
                                    umiejętności</label>
                                <div class="col-md-8">
                                    <form:input path="otherSkills" class="form-control"
                                                style="margin-left: 20px; border-radius: 3px;" placeholder=""/>
                                    <form:errors path="otherSkills" cssClass="error"/>
                                </div>
                            </spring:bind>
                        </div>
                        <hr/>

                        <hr class="form-group" style="margin-top: 20px;">
                        <spring:bind path="writeSthAboutYou">
                            <label class="col-md-3 control-label" style="text-align: left">Napisz coś o
                                sobie</label>
                            <div class="col-md-8 ">
                                <form:textarea path="writeSthAboutYou" rows="8" cols="62"
                                               style="margin-left: 20px; border-radius: 3px;"/>
                                <form:errors path="writeSthAboutYou" cssClass="error"/>
                            </div>
                        </spring:bind>
                        </hr>

                        <div class="form-group">
                            <label class="col-md-3 control-label" style="text-align: left">Posiadam doświadczenie w
                                opiece
                                nad</label>
                            <div class="col-md-4">
                                <div class="col-md-4" style="padding-left: 10px;">
                                    <spring:bind path="careExperience">
                                        <form:checkbox path="careExperience" id="checkbox5" value="kids"/>
                                        <form:errors path="careExperience" cssClass="error"/>
                                        <label for="checkbox5">Dziećmi</label>
                                    </spring:bind>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <spring:bind path="careExperience">
                                    <form:checkbox path="careExperience" id="checkbox6" value="old"/>
                                    <form:errors path="careExperience" cssClass="error"/>
                                    <label for="checkbox6">Osobami starszymi</label>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="margin-top: 20px;">
                            <label class="col-md-3 control-label" style="text-align: left">Wymiar pracy w jakim możesz
                                pracować</label>
                            <div class="col-md-8 ">
                                <spring:bind path="timeJobTime">
                                    <div class="col-md-5 ">
                                        <div class="radio">
                                            <label style="font-size: 1.2em">
                                                <form:radiobutton path="timeJobTime" value="half"/>Pełny etaty
                                                <span class="cr"><i
                                                        class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-5 ">
                                        <div class="radio">
                                            <label style="font-size: 1.2em">
                                                <form:radiobutton path="timeJobTime" value="full"/>Pół etatu
                                                <span class="cr"><i
                                                        class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-5 ">
                                        <div class="radio">
                                            <label style="font-size: 1.2em">
                                                <form:radiobutton path="timeJobTime" value="casual"/>Dorywczo
                                                <span class="cr"><i
                                                        class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                            </label>
                                        </div>
                                    </div>
                                    <form:errors path="timeJobTime" cssClass="error"/>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="margin-top: 20px;">
                            <label for="nanny-experience" class="text-left col-md-3 control-label "
                                   style="text-align: left">Doświadczenie przy pracy z dziećmi</label>
                            <div class="col-md-5" style="padding-top: 5px;">
                                <spring:bind path="experienceKidsTime">
                                    <path:select path="experienceKidsTime" id="nanny-experience"
                                                 style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;">
                                        <path:option value="brak">brak</path:option>
                                        <path:option value="pół roku">pół roku</path:option>
                                        <path:option value="rok">rok</path:option>
                                        <path:option value="dwa lata">dwa lata</path:option>
                                        <path:option value="więcej niż 2 lata">więcej niż 2 lata</path:option>
                                    </path:select>
                                    <form:errors path="experienceKidsTime" cssClass="error"/>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="margin-top: 20px;">
                            <label for="nanny-experience" class="text-left col-md-3 control-label "
                                   style="text-align: left">Doświadczenie przy pracy ze starszymi</label>
                            <div class="col-md-5" style="padding-top: 5px;">
                                <spring:bind path="experienceOldTime">
                                    <form:select path="experienceOldTime" id="nanny-experience"
                                                 style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;">
                                        <path:option value="brak">brak</path:option>
                                        <path:option value="pół roku">pół roku</path:option>
                                        <path:option value="rok">rok</path:option>
                                        <path:option value="dwa lata">dwa lata</path:option>
                                        <path:option value="więcej niż 2 lata">więcej niż 2 lata</path:option>
                                    </form:select>
                                    <form:errors path="experienceOldTime" cssClass="error"/>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="border-bottom: 12px; ">
                            <div class="col-md-12 ">
                                <h4 style="text-align: left;">Miejsce pracy</h4>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="margin-top: 20px;">
                            <label class="col-md-3 control-label" style="text-align: left">Miejsce opieki nad
                                dzieckiem</label>
                            <div class="col-md-8 ">
                                <spring:bind path="placeOfTakeCare">
                                    <div class="col-md-5 ">
                                        <div class="radio">
                                            <label style="font-size: 1.2em">
                                                <form:radiobutton path="placeOfTakeCare" value="Dowolne"/>Dowolne
                                                <span class="cr"><i
                                                        class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-5 ">
                                        <div class="radio">
                                            <label style="font-size: 1.2em">
                                                <form:radiobutton path="placeOfTakeCare" value="U rodziców"/>U rodziców
                                                <span class="cr"><i
                                                        class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-5 ">
                                        <div class="radio">
                                            <label style="font-size: 1.2em">
                                                <form:radiobutton path="placeOfTakeCare" value="U niani"/>U niani
                                                <span class="cr"><i
                                                        class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                            </label>
                                        </div>
                                    </div>
                                    <form:errors path="placeOfTakeCare" cssClass="error"/>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="margin-top: 20px;">
                            <label class="col-md-3 control-label" style="text-align: left">Praca z
                                mieszkaniem</label>
                            <div class="col-md-8 ">
                                <spring:bind path="workWithHome">
                                    <div class="col-md-5 ">
                                        <div class="radio">
                                            <label style="font-size: 1.2em">
                                                <form:radiobutton path="workWithHome" value="Tak"/>Tak
                                                <span class="cr"><i
                                                        class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-5 ">
                                        <div class="radio">
                                            <label style="font-size: 1.2em">
                                                <form:radiobutton path="workWithHome" value="Nie"/>Nie
                                                <span class="cr"><i
                                                        class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                            </label>
                                        </div>
                                    </div>
                                    <form:errors path="workWithHome" cssClass="error"/>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="border-bottom: 12px; ">
                            <div class="col-md-12 ">
                                <h4 style="text-align: left;">Wynagrodzenie</h4>
                            </div>
                        </div>

                        <div class="form-group" style="margin-top: 20px; ">
                            <label class="col-md-3 control-label" style="text-align: left">Cena za godzinę
                                opieki</label>
                            <div class="col-md-2 " style="padding-left: 35px;">
                                <spring:bind path="moneyPerHour">
                                    <form:input path="moneyPerHour" class="form-control" placeholder="zł/h"
                                                style="margin-top: 5px; "/>
                                    <form:errors path="moneyPerHour" cssClass="error"/>
                                </spring:bind>
                            </div>
                            <div class="col-md-7 " style="margin-top: 10px; padding-right: 20px;">
                                <p style="font-size: 17px;">zł/h</p>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="border-bottom: 12px; ">
                            <div class="col-md-12 ">
                                <h4 style="text-align: left;">Informacje o wykształceniu</h4>
                            </div>
                        </div>

                        <div class="form-group" style="margin-top: 20px;">
                            <label for="nanny-experience" class="text-left col-md-3 control-label "
                                   style="text-align: left">Wykształcenie</label>
                            <div class="col-md-5" style="padding-top: 5px;">
                                <spring:bind path="education">
                                    <form:select path="education" id="nanny-experience"
                                                 style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;">
                                        <path:option value="brak">brak</path:option>
                                        <path:option value="podstawowe">podstawowe</path:option>
                                        <path:option value="zawodowe">zawodowe</path:option>
                                        <path:option value="średnie">średnie</path:option>
                                        <path:option value="wyższe">wyższe</path:option>
                                    </form:select>
                                    <form:errors path="education" cssClass="error"/>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group" style="margin-top: 20px;">
                            <label class="col-md-3 control-label" style="text-align: left">Języki obce jakie
                                znasz</label>
                            <div class="col-md-8" style="padding-left: 35px; padding-top: 5px;">
                                <spring:bind path="foreignLanguages">
                                    <form:input path="foreignLanguages" class="form-control" placeholder="Języki obce"/>
                                    <form:errors path="foreignLanguages" cssClass="error"/>
                                </spring:bind>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group">
                            <div class="col-lg-6" style="padding-left: 50px;">
                                <a href="#signupbox1" onclick="slideSecond();"><img
                                        src="/resources/img/top-arrow.png"></a>
                            </div>
                            <div class="col-lg-offset-3 col-lg-2">
                                <div style="margin-top: 5px" class="form-group">
                                    <input type="submit" value="Zarejestruj" class="btn btn-danger"
                                           style="font-size: 18px; width: 130px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </c:if>
    </div>
</div>

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/scrollReveal.js"></script>
<script src="resources/js/custom.js"></script>
<script src="resources/js/script.js"></script>

</body>
</html>