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
				<h3 class="text-center">강좌수정</h3>
			</div>
			
			<div class="card-body">
				<form name="frm">
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Course No.</span>
						<input name="lcode" class="form-control" value="${up.lcode}" readonly>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Course Name</span>
						<input name="lname" class="form-control" value="${up.lname}">
						<input name="instructor" class="form-control" value="${up.instructor}">
					</div>
					<div class="input-group mb-2 md-10">
					<span class="input-group-text justify-content-center">Course Dept</span>
					<select class="form-select" name="dept">
							<option <c:out value="${up.dept=='컴공'?'selected':' '}"/> value="컴공">컴퓨터공학과</option>
							<option <c:out value="${up.dept=='전자'?'selected':' '}"/> value="전자" >전자공학과</option>
							<option <c:out value="${up.dept=='건축'?'selected':' '}"/> value="건축">건축공학과</option>
							<option <c:out value="${up.dept=='피아노'?'selected':' '}"/> value="피아노">피아노과</option>
					</select>
					</div>
						<div class="input-group mb-2 md-10">
						<span class="input-group-text justify-content-center">Hours</span>
						
						<div class="form-check m-2">
							<input <c:out value="${up.hours==2?'checked':' '}"/> value="2" name="hours" class="form-check-input" type="radio" >
							<label class="form-check-label">2hours</label>
						</div>
						<div class="form-check m-2">
							<input <c:out value="${up.hours==3?'checked':' '}"/> value="3" name="hours" class="form-check-input" type="radio">
							<label class="form-check-label">3hours</label>
						</div>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Room</span>
						<input name="room" class="form-control" value="${up.room}">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Capacity</span>
							<input name="capacity" class="form-control" value="10" type='number' min='10' max='300' step='10' pattern="[0-9]+">
					</div>
					
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Professor</span>
						<input name="instructor" class="form-control" placeholder="Professor No" readonly>
						<input  name="pname" class="form-control" placeholder="Professor Name" readonly>
						<button class="btn btn-primary" type="button" id="search" >search</button>
						</div>
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
	const lname=$(frm.lname).val();
	const instructor=$(frm.instructor).val();
	if (lname=="" || instructor==""){
		alert("강좌명과 교수명을 입력하세요.");
		$(frm.lname).focus();
		return;
	}
	
	if(confirm("수정하시겠습니까?")){
		console.log("수정완료")
		frm.method="post";
		frm.submit();
	}
	});
</script>