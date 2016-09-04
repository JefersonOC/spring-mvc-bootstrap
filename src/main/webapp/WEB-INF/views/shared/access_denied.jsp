<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="header.jsp" %>

<!-- Begin page content -->
<div class="container">
    <div class="page-header">
        <h2>Olá <strong>${user}</strong>, você não está autorizado à acessar essa página.</h2>
    </div>
    <p class="lead">
        <a href="<c:url value="/home" />">Volte a página principal</a> ou <a href="<c:url value="/logout" />">Faça o logout</a>
    </p>
</div>

<%@ include file="footer.jsp" %>