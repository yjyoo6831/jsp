<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	table .title {
		background:gray;
		color:white;
		text-align:center;
	}
</style>

<div class="row">
	<div class="col">
		<div><h1>학생정보</h1></div>
		<table class="table table-bordered">
			<tr>
				<td class="title">학생번호</td>
				<td>${stu.scode}</td>
				<td class="title">학생이름</td>
				<td>${stu.sname}</td>
				<td class="title">학생학과</td>
				<td>${stu.sdept}</td>
			</tr>
			<tr>
				<td class="title">생일</td>
				<td>${stu.birthday}</td>
				<td class="title">학년</td>
				<td>${stu.year}</td>
				<td class="title">지도교수</td>
				<td>${stu.pname} (${stu.advisor})</td>
			</tr>
		</table>
		<div class="text-center my-5">
			<button class="btn btn-primary me-3" id="update">학생수정</button>
			<button class="btn btn-danger" id="delete">학생삭제</button>
		</div>
	</div>
</div>

<script>
//수정 시 

$("#update").on("click",function(){
	console.log("pushed update");
	const pcode="${pro.pcode}";
	location.href="/pro/update?pcode=" + pcode;
});

$("#delete").on("click",function(){
	const pcode="${pro.pcode}";
	console.log("pushed delete");
	if(confirm("Would you like to delete No."+ pcode+" ?")){
		//교수삭제
		$.ajax({
			type:"post",
			url:"/pro/delete",
			data:{pcode},
			success:function(data){
				if(data==1){
					alert("Delete complete!");
					location.href="/pro/list";	
				}else{
					alert("This professor have a student and department.");
				}
			}
		});
	}
});
</script>