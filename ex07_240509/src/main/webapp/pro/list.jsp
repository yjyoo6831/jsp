<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
	#size{
	width:100px;
	float:right;}
	</style>
<div>
	<h1>교수관리</h1>
	<div class="row mt-5 mb-5">
		<form class="col" name="frm">
			<div class="input-group">
				<select class="form-select me-3" name="key">
					<option value="pcode">no</option>
					<option value="pname" selected>name</option>
					<option value="pdept">department</option>
					
				</select> 
				<input placeholder="search " class="form-control" name="word">
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
	
	<div id="div_pro" class="mt-3"></div>
	<div id="pagination" class="pagination justify-content-center mt-5"></div>
</div>
	<script id="temp_pro" type="x-handlebars-template">

<table  class="table table-bordered table-hover me-3">
<tr class="text-center" bgcolor="pink" >
	<td>No</td>
	<td>Name</td>
	<td>Department</td>
	<td>Title</td>
	<td>Hiredate</td>
	<td>Salary</td>
</tr>
 <tbody class="table-group-divider">
{{#each .}}
<tr  class="text-center">
	<td>{{pcode}}</td>
	<td><a href="/pro/read?pcode={{pcode}}">{{pname}}</td>
	<td>{{dept}}</td>
	<td>{{title}}</td>
	<td>{{hiredate}}</td>
	<td>{{salary}}</td>
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
		key=$(frm.key).val();
		word=$(frm.word).val();
		size=$("#size").val();
		page=1;
		getTotal();
	});
	
	$("#size").on("change",function(){
		size=$("#size").val();
		page=1;
		//getData();
		getTotal();
	});
	
	getTotal();
	//getData();
	function getData(){
		$.ajax({
			type:"get",
			url : "/pro/list.json",
			data : {page,size,key,word},
			dataType:"json",
			success:function(data){
				//console.log(data)
				const temp=Handlebars.compile($("#temp_pro").html());
				$("#div_pro").html(temp(data));
			}
		});
	}
	function getTotal(){
		console.log(key, word)
		$.ajax({
			type:"get",
			url:"/pro/total",
			data:{key,word},
			success:function(data){
				let total=parseInt(data);
				if(total==0){
					alert("There's no result.");
					$(frm.word).val("");
					return;
				}
				const ttlpage=Math.ceil(total/size);
				$("#pagination").twbsPagination("changeTotalPages",ttlpage,page);
				if(total>size){
					$("#pagination").show();
				}else{
					$("#pagination").hide();
				}
			}
		});
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