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
		<div><h1>강좌정보</h1></div>
		<div class="text-end mb-3" >
			<button class="btn btn-primary" id="update">수정</button>
			<button class="btn btn-danger" id="delete">삭제</button>
		</div>
		<table class="table table-bordered mt-3">
			<tr>
				<td class="title">강좌번호</td>
				<td>${rcou.lcode}</td>
				<td class="title">강좌명</td>
				<td>${rcou.lname}</td>
				<td class="title">수강시수</td>
				<td>${rcou.hours}</td>
			</tr>
			<tr>
				<td class="title">강의실번호</td>
				<td>${rcou.room}</td>
				<td class="title">수강인원</td>
				<td>${rcou.persons} / ${rcou.capacity}</td>
				<td class="title">담당교수</td>
				<td>${rcou.pname} (${rcou.instructor})</td>
			</tr>
		</table>
		
	</div>
</div>
<jsp:include page="info.jsp" />
<script>
//수정 시 

$("#update").on("click",function(){
	console.log("pushed update");
	const lcode="${rcou.lcode}";
	location.href="/cou/update?lcode=" + lcode;
});

$("#delete").on("click",function(){
	const course="${rcou.lname}";
	const lcode="${rcou.lcode}";
	console.log("pushed delete button...........",lcode);
	if(confirm("Would you like to delete "+ course + "("+ lcode + ") ?")){ 
		//강좌삭제
		$.ajax({
			type:"post",
			url:"/cou/delete",
			data:{lcode},
			
			success:function(data){
				if(data=="true"){
				console.log("data........." ,data);
				
				console.log("......cou delete data type : ", typeof data);
				alert("Delete complete!");
				location.href="/cou/list";
				}else{
					alert("This course have aleady applied students.");
				}
			},
			error : function(a,b,c) {
				console.log(a,b,c);
			}
			
		});
	}
});
</script>