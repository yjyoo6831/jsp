<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<style>
	#size{
	width:100px;
	float:right; }
	</style>
<div>
	<h1>학생관리</h1>
		<div class="row mt-5 mb-3">
		<form class="col" name="frm">
			<div class="input-group">
				<select class="form-select me-3" name="key">
					<option value="scode">no</option>
					<option value="sname" selected>name</option>
					<option value="dept">department</option>
					<option value="pname">professor</option>
				</select> 
				<input placeholder="search" class="form-control" name="word">
				<button class="btn btn-primary">search</button>
			</div>
		</form>
		
		<div class="col">
			<select class="form-select" id="size">
				<option value="2" >row2</option>
				<option value="3">row3</option>
				<option value="4">row4</option>
				<option value="5" selected>row5</option>
			</select>
		</div>
	
	<div id="div_stu"></div>
	<div id="pagination" class="pagination justify-content-center mt-5"></div>
</div>
<script id="temp_stu" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
	<tr class="text-center">
		<td>No</td>
<td>Name</td>
<td>Department</td>
<td>Year</td>
<td>Birthday</td>
<td>Professor</td>
</tr>

{{#each .}}
	<tr class="text-center">
<td>{{scode}}</td>
<td><a href="/student/read?scode={{scode}}">{{sname}}</a></td>
<td>{{sdept}}</td>
<td>{{year}}</td>
<td>{{birthday}}</td>
<td>{{pname}}({{advisor}})</td>
</tr>
{{/each}}
	</table>
</script>
<script>
	let page=1;
	let size=$("#size").val();
	let key=$(frm.key).val();
	let word=$(frm.word).val();
	$(frm).on("submit",function(e){
		e.preventDefault();
		page=1;
		size=$("#size").val();
		key=$(frm.key).val();
		word=$(frm.word).val();
		//getData();
		getTotal();
	})
	$("#size").on("change",function(){
		size=$("#size").val();
		page=1;
		//getData();
		getTotal();
	})
	
	//getData();
	getTotal();
	function getData(){
		$.ajax({
			type:"get",
			url:"/student/list.json",
			dataType:"json",
			data:{page,size,key,word},
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_stu").html());
				$("#div_stu").html(temp(data));
			
			}
		});
	}
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/student/total",
			data:{key,word},
			
			success:function(data){
				if(data==0){
					alert("검색 내용이 없습니다.");
					return ;
				}
				const ttlpage=Math.ceil(data/size);
				$("#pagination").twbsPagination("changeTotalPages",ttlpage,page);
				if(data>size){
					$("#pagination").show();
				}else{
					$("#pagination").hide();
				}	
			}
		})
	}
	$('#pagination').twbsPagination({
	      totalPages:10, 
	      visiblePages: 5, 
	      startPage : 1,
	      initiateStartPageClick: false, 
	      first:'<i class="bi bi-chevron-double-left"></i>', 
			prev :'<i class="bi bi-chevron-left"></i>',
			next :'<i class="bi bi-chevron-right"></i>',
			last :'<i class="bi bi-chevron-double-right"></i>',
	      onPageClick: function (event, clickPage) {
	          page=clickPage; 
	          getData();
	      }
	   });
</script>