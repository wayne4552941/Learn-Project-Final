<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
<style>
.write {
	border: 3px dotted black
}
.id1{
background-color:white;
   border-radius: 20px;
}

.st1{
width:500px;
margin:auto;

}
.divform{
width:500px;
margin:auto;

}
.ck-editor__editable {
 min-height: 300px;
 /* width: 100%;
            margin: 0 auto; */
}
.btn{
display:inline;

}
</style>


</head>


<body>
		<jsp:include page="BackendHeader.jsp" /> 
	 	<jsp:include page="Style.jsp" /> 
			<br><br><br><br>
	
	<form action="updateAction" class="cfu" method="post">
	
<!-- 		<fieldset  class="id1"> -->
		<div class="divform">
			<legend>修改專欄</legend>
	
			<div class="st1">
				<label for="" class="t1">文章編號</label> <input class="st2" type="text"
					name="article_no" value="${col.article_no}" readonly>
			</div>
			
			<br>
			
			<div class="st1">
				<label for="" class="t1">標題:</label> <input class="st2" type="text"
					name="title" value="${col.title}"> <br>
			</div>
			<br>
			
			<div class="st1">
				<label for="" class="t1">發佈時間:</label> <input class="st2"
					type="date" name="publish_time"
					value="${col.publish_time}">
			</div>
			
			
			<div class="st1">
				<br> <label for="account1" class="t1">使用者編號:</label> <input
					class="st2" type="text" id="account1" autocomplete="off"
					name="user_id" value="${col.user_id}">
			</div>
			
			<br>
			
			<div class="st1">
				<label for="pwd1" class="t1">作者:</label><input class="st2"
					type="text" id="pwd1" name="author"
					value="${col.author}">
			</div>
			
			<br>
			
			<div class="st1">
				<label for="" class="t1">權限:</label> <input class="st2" type="text"
					name="role" value="${col.role}"> <br>
			</div>
			
			<br> 
			
				<div class="st1">
				<label for="" class="t1">科目:</label> <input class="st2" type="text"
					name="subject" value="${col.subject}"> <br>
			</div>
			<br>
			
			<div class="st1">
				<label for="" class="t1">課程狀態:</label> 
				<c:if test="${col.status == 1}">
				<select name="status" id="status" >
							<option value="1">審核中</option>
							<option value="2">已駁回</option>
							<option value="3">核准</option>
				</select>
				</c:if>
				<c:if test="${col.status == 3}">
				<select name="status" id="status" >
							<option value="3">核准</option>
				</select>
				</c:if>
			</div>
			<br>

			
			<input type="file" onchange="previewImg(this)"   >
			<input id="imgPath" type="text" value="${col.picture}" name="picture"/>
			<br>	
			
			<div width="50px"; height="50px"; class="st1">
				<label class="t1">簡介(50字內):</label>
				<textarea cols="2" rows="2"  type="text" name="summary">${col.summary}
			</textarea>
			</div>
			
			<div width="50x"; height="50px" ;class="st1" >
			<label class="t1">內容:</label>
			<textarea id="editor" class="write" cols="5"  rows="5" name="contents">${col.contents}</textarea>
			</div>
			
			<br>
			<div>
			<img id="img" src="${col.picture}"/>
			
			</div>
			
			
			
</div>
<!-- 		</fieldset> -->
			<input type="hidden" name="pin" value="1">
			
	</form>
	
		<center>
			<div class="btn">
				<button onclick="checkUpdate()" type="submit" value="送出">送出</button>
				 <input type="hidden" name="update" value="update">		 
			</div>
			<div class="btn">
			<form  action="QueryAll" method="get">
				  <input type="submit" name="backToQuery" value="返回">
			</form>
			</div>
			
		</center>
	
	<script>
function previewImg(element) {

    let file = element.files[0];
    let img = element.parentElement.querySelector("#img");
    let imgPath = element.parentElement.querySelector("#imgPath");
    if (file) {
     img.src = URL.createObjectURL(file);
     imgPath.value = "images/"+file.name;
    }
   
}
</script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/ckeditor.js"></script>
<script src="jss/ckeditornew.js"></script>	

<script src="howard/columnback.js"></script>
</body>
</html>