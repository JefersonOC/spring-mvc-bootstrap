<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="../shared/header.jsp" %>

<div class="container">
    <div class="page-header">
        <h1>${success}</h1>
    </div>

    <p class="lead">Continuar <a href="<c:url value='/admin/new_user' />">cadastrando</a>?</p>
    <p class="lead">Ir para <a href="<c:url value='/admin' />">Página do administrador</a></p>
</div>

<%@ include file="../shared/footer.jsp" %>
