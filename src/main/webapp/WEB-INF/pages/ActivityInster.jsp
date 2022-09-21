<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fourth.bean.ActivityBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>新增活動</title>
<link rel="shortcut icon" type="image/x-icon" href="assets/images/smalllogo.png" />
	<link rel="stylesheet" href="css/activityCSS.css">

<Style>
#box {
	position: relative;
	z-index: 2;
	width: 1170px;
	margin: auto;
	min-height: 1280px;
	padding: 19px;
	background: #f3f3f3;
}

.data {
	display: none
}

#uploadPhotos{
display: none
}
.uploadImgButton{
	background-color rgb(101, 161, 90);
}
label{
    background-color: #65a15a;
	display: inline-block;
    padding: 9px 20px;
    color: #fff;
    border: 0;
    text-align: center;
    font-size: 12px;
    font-weight: 700;
    -webkit-transition: all .4s ease 0s;
    -moz-transition: all .4s ease 0s;
    -o-transition: all .4s ease 0s;
    transition: all .4s ease 0s;
    border-radius: 0;
    text-transform: uppercase;
    font-family: 'Montserrat', sans-serif
}
.content {
    width: 1125px;
    padding:50px;
    border-radius: 10px;
    background-color: white;
    display: flex;
    margin:auto;
}
#editTitle{
	border: 1px solid black;
	width:1025px;
	font-size: 32px;
}
#introduction{
	border: 1px solid black;
	width:1025px;
	
	 height: 240px;
	 padding: 5px;
    font-size: 18px;
    resize: none;
}
.centerDiv{
width: 200px;
margin:0px auto;
}


</Style>
</head>
<body>


<jsp:include page="Header.jsp"/>



	<div id="box">
     	<h2>活動編輯</h2>
		<div id="hrml_content">
		<div class="content">
			<form >
			
					<h2>標題:</h2>
					<input id="title" type="text" value="" required>
					<p>
					<h3>內文:</h3>
					<textarea id="content"  oninput="auto_grow(this)" cols="30" required></textarea>
			<p>
				<div >
					<h3>圖片:</h3>
					<img id="activity_img"   src="" alt="">
					<br>
					<label class="uploadImgButton" for="uploadPhotos">上傳照片</label>
					<input id="uploadImg" class="data" type="file" onchange="previewImg(this)" accept="image/gif, image/jpeg, image/png">
				</div>
			<br>
			<div>
			<h3>時間:</h3>
			<p>
			活動開始時間:<input id="start_time" type="datetime-local" value="" required/>
			<p>
			活動結束時間:<input id="end_time"  type="datetime-local" value=""  required/>
			<p>
			</div>
			<hr>
			<div class="centerDiv">
			
			
			<button id="save" name="request" value="Insert">確認</button>
			<a id="back" href ="Activity_OP" ><label for="back" style="cursor: pointer;">取消</label></a>
			
			</div>
				
		</form>
		
		
			</div>
		</div>
	</div>
	
	<script >
	$(
		
			
		$('#new_start_time').ready(function(){
			
			let today = getTodayTime(0);
			$('.new_start_time').attr("min", today);
			
			
			
		})
		
		
		$('#.new_end_time').ready(function(){
			let today = getTodayTime(1);
			$('.new_end_time').attr("min", today);
			
			console.log($('.new_start_time'))
			
		})
		
		
	)
	
	</script>
	<script src="ActivityResources/js/InsertActivities.js"></script>
	
</body>
</html>