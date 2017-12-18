<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>
<h1>${user.name}</h1>

<c:forEach items="${user.blogs}" var="blog">
	<div>
		<h1><c:out value="${blog.name}"/></h1>
		<p>
			<c:out value="${blog.url}"/>
		</p>
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>Title</th>
					<th>Link</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${blog.items}" var="item">
					<tr>
						<td><c:out value="${item.title}"/></td>
						<td><c:out value="${item.link}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:forEach>