<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:pagetemplate>
    <section class="section">
        <div class="container">
            <div class="columns">
                <div class="column is-3">
                    <a class="button is-primary is-medium is-fullwidth" href="./compose">
                        <span class="icon is-small"><i class="fas fa-pen"></i></span>
                        <span>New Post</span>
                    </a>
                </div>
                <div class="column is-9">
                    <div class="box content">
                        <c:forEach items="${messages}" var="msg">
                                <article>
                                    <a href="./read/${msg.id}">
                                        <h4>${msg.subject}</h4>
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="fab fa-readme"></i>
                                            </div>
                                            <div class="media-content">
                                                <div class="content">
                                                    by ${msg.author} on ${msg.timestamp}
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </article>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
</t:pagetemplate>
