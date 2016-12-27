<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<!DOCTYPE HTML>
<html lang="pl_PL">
<head>
<link rel="shortcut icon" type="image/x-icon" href="/img/bookmark.png">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Itim"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Aclonica|Open+Sans"
	rel="stylesheet">
<title>znajdźOpiekuna</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
					<a href="/index"><div class="logo">znajdźOpiekuna</div></a>
				</div>

			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right" style="padding-right: 0px;">
					<sec:authorize access="hasRole('ROLE_USER')">
						<c:url value="/logout" var="logoutUrl" />
						<form action="${logoutUrl}" method="post" id="logoutForm">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
						<li>
							<ol class="breadcrumb" style="float: left;">
								<li class="active" style="color: #c09e6b;"><a
									href="indexService">Witaj, ${user.firstName}</a></li>
								<li><a href="javascript:formSubmit()"> Wyloguj</a></li>
							</ol>
						</li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</div>

	<div class="profile-navbar">
		<div class="container">
			<form action="<c:url value='/showProfile' />" method="get"
				id="showProfile">
				<input type="hidden" name="requestUser"
					value="${pageContext.request.userPrincipal.name}" />
			</form>
			<div class="col-lg-3 col-lg-offset-9"
				style="padding-left: 50px; padding-top: 10px;">
				<a href="javascript:showDetailsProfile();"
					style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
				<a href="profile"
					style="color: white; font-size: 13px; padding-right: 20px;">Ustawienia</a>
				<a href="profile" style="color: white; font-size: 13px;">Wiadomości</a>
			</div>
		</div>
	</div>
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
	<div class="container" style="min-height: 800px; background-color: white; padding-top: 70px;">
	  <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-2 toppad" >
          <div class="panel panel-info">
            
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-12 col-lg-12 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Zmień email</td>
                        <td><input type="text" name="email" class="form-control" placeholder="email" /></td>
                      </tr>
                      <tr>
                        <td>Zmień hasło</td>
                        <td><input type="text" name="email" class="form-control" placeholder="email" /></td>
                      </tr><tr>
                        <td>Email</td>
                        <td><input type="text" name="email" class="form-control" placeholder="email" /></td>
                      </tr><tr>
                        <td>Email</td>
                        <td><input type="text" name="email" class="form-control" placeholder="email" /></td>
                      </tr><tr>
                        <td>Email</td>
                        <td><input type="text" name="email" class="form-control" placeholder="email" /></td>
                      </tr><tr>
                        <td>Email</td>
                        <td><input type="text" name="email" class="form-control" placeholder="email" /></td>
                      </tr>
                    </tbody>
                  </table>     
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        
                 </div>
            
          </div>
        </div>
      </div>
	</div>

	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrollReveal.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

</body>
</html>