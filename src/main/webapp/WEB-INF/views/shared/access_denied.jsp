<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="header.jsp" %>

<!-- Begin page content -->
<div class="container">
    <div class="page-header">
        <h2>Ol� <strong>${user}</strong>, voc� n�o est� autorizado � acessar essa p�gina.</h2>
    </div>
    <p class="lead">
        <a href="<c:url value="/home" />">Volte a p�gina principal</a> ou <a href="<c:url value="/logout" />">Fa�a o logout</a>
    </p>
</div>

<%@ include file="footer.jsp" %>