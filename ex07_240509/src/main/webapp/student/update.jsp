<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <style>
   	.input-group span{
   		width:150px;
   	}
   </style>
<div class="row my-5 justify-content-center">
	<div class="col-10 col-md-8">
		<div class="card">
			<div class="card-header">
				<h3 class="text-center">학생수정</h3>
			</div>
			<div class="card-body">
				<form name="frm">
					<div class="input-group mb-2  text-bg-gray">
						<span class="input-group-text justify-content-center">Student No.</span>
						<input name="sno" class="form-control" value="${stu.scode}" readonly>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Name</span>
						<input name="sname" class="form-control" value="${stu.sname }">
						</div>
						<div class="input-group mb-2 md-10">
						<span class="input-group-text justify-content-center">Student Dept</span>
						<select class="form-select" name="dept">
							<option <c:out value="${stu.sdept=='컴공'?'selected':' '}"/> value="컴공">컴퓨터공학과</option>
							<option <c:out value="${stu.sdept=='전자'?'selected':' '}"/> value="전자" selected>전자공학과</option>
							<option <c:out value="${stu.sdept=='건축'?'selected':' '}"/> value="건축">건축공학과</option>
							<option <c:out value="${stu.sdept=='피아노'?'selected':' '}"/> value="피아노">피아노과</option>
						</select>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Year</span>
						<div class="form-check m-2">
							<input <c:out value="${stu.year==1?'checked':' '}"/> value="1" name="year" class="form-check-input" type="radio" checked>
							<label class="form-check-label">first year</label>
						</div>
						<div class="form-check m-2">
							<input <c:out value="${stu.year==2?'checked':' '}"/> value="2"  name="year" class="form-check-input" type="radio">
							<label class="form-check-label">second year</label>
						</div>
						<div class="form-check m-2">
							<input <c:out value="${stu.year==3?'checked':' '}"/> value="3" name="year" class="form-check-input" type="radio">
							<label class="form-check-label">third year</label>
						</div>
						<div class="form-check m-2">
							<input <c:out value="${stu.year==4?'checked':' '}"/> value="4" name="year" class="form-check-input" type="radio">
							<label class="form-check-label">last year</label>
						</div>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Professor</span>
						<input value="${stu.advisor}" name="advisor" class="form-control" placeholder="Professor No" readonly>
						<input value="${stu.pname}" name="pname" class="form-control" placeholder="Professor Name" readonly>
						<button class="btn btn-primary" type="button" id="search" >search</button>
						</div>
					<div class="input-group mt-3">
						<span class="input-group-text justify-content-center">Birthday</span>
						<input name="birthday" class="form-control" type="date" value="2005-01-01" value="${stu.birthday}">
						</div>	
					<div class="text-center mt-3">
					<button class="btn btn-primary">학생수정</button>
					<button class="btn btn-secondary" type="reset">수정취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="modal.jsp" />
<script>


$("#search").on("click",function(){
	$("#modal").modal("show");
});
$(frm.pname).on("click",function(){
	$("#modal").modal("show");
});
	$(frm).on("submit",function(e){
		e.preventDefault();
	const sname=$(frm.sname).val();
	const advisor=$(frm.advisor).val();
	if (sname==""||advisor==""){
		alert("학생 이름과 지도교수를 입력하세요");
		$(frm.sname).focus();
		return;
	}
	
	if(confirm("수정하시겠습니까?")){
		frm.method="post";
		frm.submit();
	}
	});
</script>