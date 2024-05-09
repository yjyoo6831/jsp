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
		<div><h1>교수정보</h1></div>
		<table class="table table-bordered">
			<tr>
				<td class="title">교수번호</td>
				<td>${pro.pcode}</td>
				<td class="title">교수이름</td>
				<td>${pro.pname}</td>
				<td class="title">교수학과</td>
				<td>${pro.dept}</td>
			</tr>
			<tr>
				<td class="title">임용일자</td>
				<td>${pro.hiredate}</td>
				<td class="title">교수직급</td>
				<td>${pro.title}</td>
				<td class="title">교수급여</td>
				<td><fmt:setLocale value="ko_KR" /><fmt:formatNumber type="currency" value="${pro.salary}" /></td>
			</tr>
		</table>
		<div class="text-center my-5">
			<button class="btn btn-primary me-3" id="update">교수수정</button>
			<button class="btn btn-danger" id="delete">교수삭제</button>
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