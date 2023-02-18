<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><c:out value="${site_title}" /></title>
    <link rel="stylesheet" href="<c:url value='/assets/css/main.css' />" />
    <link rel="stylesheet" href="<c:url value='/assets/css/fold.css' />" />
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css' />" />
</head>
<body class="is-preload">
    <!-- Wrapper -->
    <div id="wrapper">
        <!-- Main -->
        <div id="main">
            <div class="inner">
                <div>
                    <!-- Header -->
                    <header id="header">
                        <a href="<c:url value='/index' />" class="logo"><strong>AZABELLCODE</strong> by Azabell1993</a>
                    </header>
                    <!-- Banner -->
                    <section id="banner">
                        <div class="content"></div>
                    </section>
                </div>
                <!-- insert main content -->
                <c:choose>
                    <c:when test="${not empty someCondition}">
                        <jsp:include page="test.jsp" />
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="test.jsp" />
                    </c:otherwise>
                </c:choose>
                <div>
                    <c:import url="/main/foot.html" />
                </div>
            </div>
        </div>
        <div id="sidebar">
            <div class="inner">
                <jsp:include page="menu.jsp" />
            </div>
        </div>
    </div>
    <script src="<c:url value='/assets/js/jquery.min.js' />"></script>
    <script src="<c:url value='/assets/js/browser.min.js' />"></script>
    <script src="<c:url value='/assets/js/breakpoints.min.js' />"></script>
    <script src="<c:url value='/assets/js/util.js' />"></script>
    <script src="<c:url value='/assets/js/main.js' />"></script>
    <script src="<c:url value='/assets/js/innerHTML.js' />"></script>
