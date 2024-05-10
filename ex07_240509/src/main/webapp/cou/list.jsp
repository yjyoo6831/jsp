<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<style>
	#size{
	width:100px;
	float:right; }
	</style>
<div>
	<h1>강좌관리</h1>
		<div class="row mt-5 mb-3">
		<form class="col" name="frm">
			<div class="input-group">
				<select class="form-select me-3" name="key">
					<option value="lcode">code</option>
					<option value="lname" selected>course name</option>
					<option value="hours">hours</option>
					<option value="instructor">instructor</option>
				</select> 
				
				<input placeholder="search" class="form-control" name="word">
				<button class="btn btn-primary">search</button>
				<span id="total" class="mt-2 ms-3"></span>
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
	
	<div id="div_cou" class="mt-3"></div>
	<div id="pagination" class="pagination justify-content-center mt-5"></div>
</div>
<script id="temp_cou" type="x-handlebars-template">
<table class="table table-bordered table-hover">
<tr class="text-center" bgcolor="pink">
<td>No</td>
<td>Course</td>
<td>Hours</td>
<td>Room</td>
<td>Persons</td>
<td>Professor</td>
</tr>
 <tbody class="table-group-divider">
{{#each .}}
	<tr class="text-center">
<td>{{lcode}}</td>
<td><a href="/cou/read?lcode={{lcode}}">{{lname}}</a></td>
<td>{{hours}}</td>
<td>{{room}}</td>
<td>{{persons}} / {{capacity}}</td>
<td>{{pname}} ({{instructor}})</td>
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
		//size=$("#size").val();
		page=1;
		size=2;
		//getData();
		getTotal();
	})
	
	//getData();
	getTotal();
	function getData(){
		$.ajax({
			type:"get",
			url:"/cou/list.json",
			dataType:"json",
			data:{page,size,key,word},
			success:function(data){
				//console.log(data);
				const temp=Handlebars.compile($("#temp_cou").html());
				$("#div_cou").html(temp(data));
			}
		});
	}
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/cou/total",
			data:{key,word},
			
			success:function(data){
				let total=parseInt(data);
				$("#total").html("검색수 :<b> " + total + " 건</b>");
				if(total==0){
					alert("검색 내용이 없습니다.");
					return ;
				}
				const ttlpage=Math.ceil(total/size);
				$("#pagination").twbsPagination("changeTotalPages",ttlpage,page);
				if(total>size){
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