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
		<div class="text-end mt-5 mb-2 " >
			<button class="btn btn-primary" id="update">수정</button>
			<button class="btn btn-danger" id="delete">삭제</button>
		</div>
		<table class="table table-bordered" >
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
		
	</div>
</div>
<jsp:include page="info.jsp" />
<script>
//수정 시 

$("#update").on("click",function(){
	console.log("pushed update");
	const scode="${stu.scode}";
	location.href="/student/update?scode=" + scode;
});

$("#delete").on("click",function(){
	const scode="${stu.scode}";
	console.log("pushed delete");
	if(confirm("Would you like to delete No."+ scode+" ?")){
		//교수삭제
		$.ajax({
			type:"post",
			url:"/stu/delete",
			data:{scode},
			
			success:function(data){
				
				if(data=="true"){
					alert("Delete complete!");
					location.href="/stu/list";	
				}else{
					console.log(".............",data)
					alert("There is course registration data applied by the student.\n수강 신청 내역이 있어 삭제가 불가합니다.");
				}
			}
		});
	}
});
</script>