<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title></title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet">
	<link href="static/css/style.css" rel="stylesheet">
	<script src="static/ckeditor/ckeditor.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script> <script type="text/javascript">

        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
  
  	</script>
	
</head>
<body>
	<div class="container">
		<div role="navigation">
			<div class="navbar navbar-inverse">
				<a href="/" class="navbar-brand">Nhóm 13</a>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="add-post">Add Post</a></li>
						<li><a href="all-post">All Post</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Home Page</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_ALL'}">
			<div class="container text-center">
				<h3>All Post</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Title</th>
								<th>Content</th>
								<th>File</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="post" items="${lstPost}">
								<tr>
									<%-- <td >${post.id}</td> --%>
									<td>${post.title}</td>
									<td>${post.content}</td>
									<td><a href="${post.file}">${post.file}</a></td>
									<td><a href="update-post?id=${post.id}"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-post?id=${post.id}"><span
											class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_ADD'|| mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Add New Post</h3>
				<hr>
				<form class="form-horizontal" method="POST" enctype="multipart/form-data" action="save-post">
					<input type="hidden" name="id" value="${post.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Tiêu đề</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="title" value="${post.title}"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Nội dung</label>
						<div class="col-md-7">
						
							
							
							<textarea rows="10" class="form-control ckeditor" name="content">${post.content}</textarea>
							<script>
								CKEDITOR.replace('content');
							</script>
							
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">File</label>
						<div class="col-md-7">
							<input type="file" class="form-control" name="file" value="${post.file}"/>
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save post" />
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>
