<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:wrapper>
    <table>
        <c:forEach items="${messages}" var="msg">
            <tr>
                <td>${msg.subject}</td>
                <td>${msg.timestamp}</td>
            </tr>
        </c:forEach>
    </table>
</t:wrapper>
