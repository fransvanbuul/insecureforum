<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:pagetemplate>

    <section class="section">
        <div class="container">
            <div class="columns">
                <div class="column is-3">
                    <a class="button is-primary is-block is-alt is-large" href="#">New Post</a>
                </div>
                <div class="column is-9">
                    <div class="box content">
                        <c:forEach items="${messages}" var="msg">
                            <article>
                                <h4>${msg.subject}</h4>
                                <div class="media-content">
                                    <div class="content">
                                        ${msg.timestamp}
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>

</t:pagetemplate>
