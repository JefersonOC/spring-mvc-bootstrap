<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">SOLO</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/"><i class="fa fa-home">&nbsp;</i>Principal</a></li>
                <li><a href="<c:url value='/about' />"><i class="fa fa-list">&nbsp;</i>Sobre</a></li>
                <li><a href="<c:url value='/contact' />"><i class="fa fa-send">&nbsp;</i>Contato</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<c:url value='/login' />"><i class="fa fa-lock">&nbsp;</i>Entrar no Sistema</a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>

