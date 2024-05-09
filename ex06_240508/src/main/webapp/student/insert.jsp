<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
   	.input-group span{
   		width:150px;
   	}
   </style>
<div class="row my-5 justify-content-center">
	<div class="col-10 col-md-8">
		<div class="card">
			<div class="card-header">
				<h3 class="text-center">학생등록</h3>
			</div>
			<div class="card-body">
				<form name="frm">
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Student No.</span>
						<input name="sno" class="form-control" value="${code}" readonly>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Name</span>
						<input name="sname" class="form-control">
						</div>
						<div class="input-group mb-2 md-10">
						<span class="input-group-text justify-content-center">Student Dept</span>
						<select class="form-select" name="dept">
							<option value="컴공">컴퓨터공학과</option>
							<option value="전자">전자공학과</option>
							<option value="건축">건축공학과</option>
							<option value="피아노">피아노과</option>
						</select>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Year</span>
						<div class="form-check m-2">
							<input value="1" name="year" class="form-check-input" type="radio" checked>
							<label class="form-check-label">first year</label>
						</div>
						<div class="form-check m-2">
							<input value="2"  name="year" class="form-check-input" type="radio">
							<label class="form-check-label">second year</label>
						</div>
						<div class="form-check m-2">
							<input value="3" name="year" class="form-check-input" type="radio">
							<label class="form-check-label">third year</label>
						</div>
						<div class="form-check m-2">
							<input value="4" name="year" class="form-check-input" type="radio">
							<label class="form-check-label">last year</label>
						</div>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text justify-content-center">Professor</span>
						<input name="advisor" class="form-control" placeholder="Professor No" readonly>
						<input  name="pname" class="form-control" placeholder="Professor Name" readonly>
						<button class="btn btn-primary" type="button" id="search" >search</button>
						</div>
					<div class="input-group mt-3">
						<span class="input-group-text justify-content-center">Birthday</span>
						<input name="birthday" class="form-control" type="date" value="2005-01-01">
						</div>	
					<div class="text-center mt-3">
					<button class="btn btn-primary">학생등록</button>
					<button class="btn btn-secondary" type="reset">등록취소</button>
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
	
	if(confirm("새 학생을 등록하시겠습니까?")){
		console.log("학생등록")
		frm.method="post";
		frm.submit();
	}
	});
</script>