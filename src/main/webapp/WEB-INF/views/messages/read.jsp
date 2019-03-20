<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:pagetemplate>

    <section class="section">
        <div class="container">
            <div class="columns">
                <div class="column is-3">
                    <a class="button is-medium is-fullwidth" href="../list">
                        <span class="icon is-small"><i class="fas fa-arrow-left"></i></span>
                        <span>Back</span>
                    </a>
                </div>
                <div class="column is-9">
                    <div class="box content">
                        <article class="readheader">
                            <h4>${msg.subject}</h4>
                            <div class="media">
                                <div class="media-content">
                                    <div class="content">
                                        by ${msg.author} on ${msg.timestamp}
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article>
                            <div class="media">
                                <div class="media-content">
                                    <div class="content">
                                        ${msg.body}
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>

</t:pagetemplate>
