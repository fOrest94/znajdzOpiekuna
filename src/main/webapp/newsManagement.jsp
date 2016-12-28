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
        <ul class="nav nav-tabs"  role="tablist" >
            <li role="presentation" ><a style="font-size: 18px; " href="/showMyProfile">Profil</a></li>
            <li role="presentation"><a style="font-size: 18px; " href="/editMyProfile">Edycja</a></li>
            <li role="presentation"><a style="font-size: 18px; " href="/advancedSettings">Zaawansowane</a></li>
            <c:if test="${user.role eq 'ADMINISTRATOR'}">
                <li role="presentation" class="active"><a href="/newsManagement" style="font-size: 18px; " >Zarządzaj aktualnościami</a></li>
                <li role="presentation" ><a href="/usersManagement" style="font-size: 18px; ">Zarządzaj użytkownikami</a></li>
            </c:if>
        </ul>
    </div>
</c:if>
<div class="container" style="min-height: 800px; background-color: white; padding-top: 70px;">
    <div class="row">
        <div class="col-md-5 " style="min-height: 800px;">

            <div class="panel panel-default">
                <div class="panel-heading" style="font-size: 20px;">Lista aktualności</div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th class="col-md-3">Data</th>
                        <th class="col-md-9">Tytuł</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="listView" items="${newsList}">
                    <tr>
                        <td class="col-md-3">${listView.data}</td>
                        <td  class="col-md-9">${listView.title}</td>
                    </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>

        </div>
        <div class="col-md-7 " style="min-height: 800px;">
            <div class="panel panel-default">
                <div class="panel-heading" style="font-size: 20px;">Zarządzaj</div>
                <div class="panel-body" style="margin-left: 0px;">
                    <div class="col-lg-12">
                        <form:form method="POST" modelAttribute="newsForm" enctype="multipart/form-data" class="form-horizontal">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <fieldset style="padding-right: 0px;">
                            <legend>Dodaj aktualność</legend>
                            <div class="form-group">
                                <label class="col-md-3" style="padding-top: 10px; margin-right: 20px;" for="title">Tytuł
                                    aktualności</label>
                                <div class="col-md-5">
                                    <spring:bind path="title">
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <form:input type="text" name="title" path="title"
                                                        class="form-control input-md"
                                                        placeholder="Tu wpisz tytuł aktualności"
                                                        autofocus="true"
                                                        required="true" value="${newsForm.title}"></form:input>
                                            <form:errors path="title"></form:errors>
                                        </div>
                                    </spring:bind>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3" style="padding-top: 10px;">Opis</label>
                                <div class="col-md-8">
                                    <spring:bind path="description">
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <form:textarea path="description" rows="18" cols="62"
                                                           class="form-control"
                                                           style="margin-left: 20px; border-radius: 3px;"
                                                           placeholder="Tu wpisz treść aktualności"
                                                           autofocus="true"
                                                           required="true" value="${newsForm.description}"/>
                                            <form:errors path="description"></form:errors>
                                        </div>
                                    </spring:bind>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4" >Tło wątku(3:1)</label>
                                <div class="col-md-7">
                                    <spring:bind path="file.file">
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <form:input path="file.file" type="file"  class="upload" />
                                            <form:errors path="file.file" class="help-inline"/>
                                        </div>
                                    </spring:bind>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-4 col-md-offset-8" style="padding-left: 36px;">
                                    <button name="singlebutton"
                                            class="btn btn-danger">Dodaj
                                    </button>
                                </div>
                            </div>
                                </form:form>
                        </fieldset>
                        <c:if test="${not empty newsList}">
                            <form method="POST"  action="/newsManagement/edit"  class="form-horizontal" var="selected">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <fieldset>
                                    <legend>Usuń/Edytuj</legend>
                                    <div class="form-group">
                                        <label class="col-md-4" for="title" style="margin-right: 20px; padding-top: 10px;">Wybierz aktualność</label>
                                        <div class="col-md-5">
                                            <select id="selectbasic" name="selectId" class="form-control">
                                                <c:forEach var="listView" items="${newsList}">
                                                    <option path="Id" value="${selected = listView.id}">${listView.title}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4" style="padding-top: 10px;">Wybierz operacje</label>
                                        <div class="col-md-6 col-md-offset-2">
                                            <button name="type" value="delete" class="btn btn-danger">Usuń</button>
                                            <button name="type" value="edit" class="btn btn-danger">Edytuj</button>
                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/scrollReveal.js"></script>
<script src="resources/js/custom.js"></script>
<script src="resources/js/script.js"></script>

</body>
</html>