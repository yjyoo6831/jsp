<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div><h1>here is pro info.</h1></div>
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
				<td>${rvo.pcode}</td>
				<td class="title">교수이름</td>
				<td>${rvo.pname}</td>
				<td class="title">교수학과</td>
				<td>${rvo.dept}</td>
			</tr>
			<tr>
				<td class="title">임용일자</td>
				<td>${rvo.hiredate}</td>
				<td class="title">교수직급</td>
				<td>${rvo.title}</td>
				<td class="title">교수급여</td>
				<td>${rvo.salary}</td>
			</tr>
		</table>
		<div class="text-center my-5">
			<button class="btn btn-primary me-3">교수수정</button>
			<button class="btn btn-danger" id="delete">교수삭제</button>
		</div>
	</div>
</div>

<script>
$("#delete").on("click",function(){
	const pcode="${rvo.pcode}";
	if(confirm("Would you like to delete "+ pcode+" ?"){
		//교수삭제
		$.ajax({
			type:"post",
			url:"/pro/delete",
			data:{pcode},
			success:function(){
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