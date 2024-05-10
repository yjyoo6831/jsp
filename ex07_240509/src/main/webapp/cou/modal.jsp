<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Button trigger modal -->
<style>
	#modal{
		top:30%;
	}
</style>

<!-- Modal -->
<div class="modal fade" id="modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">교수검색</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div>
      	<select class="form-select" id="word">
      		<option value="전산">컴퓨터공학과</option>
      		<option value="전자">전자공학과</option>
      		<option value="건축">건축공학과</option>
      		<option value="피아노" selected>피아노과</option>
      	</select>
      	</div>
        <div id="div_pro" class="mt-3"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      
      </div>
    </div>
  </div>
</div>


<script id="temp_pro" type="x-handlebars-template">

<table  class="table table-bordered">
<tr class="text-center">
	<td>No</td>
	<td>Name</td>
	<td>Dept</td>
</tr>
 <tbody class="table-group-divider">
{{#each .}}
<tr class="text-center values  table-hover" instructor="{{instructor}}" pname="{{pname}}" dept="{{dept}}" style="cursor:pointer">
	<td>{{instructor}}</td>
	<td>{{pname}}</td>
	<td>{{dept}}</td>
</tr>
{{/each}}
</table> 
</script>
<script>
let page=1;
let size=100;
let key="dept";
let word=$("#word").val();
$("#word").on("change",function(){
	word=$("#word").val();
	getData();
})


$(frm.dept).on("change", function(){
	word=$(frm.dept).val();
	getData();
});
//각 행의 tr 을 클릭한경우 
$("#div_pro").on("click",".values",function(){
	const instructor=$(this).attr("instructor");
	const pname=$(this).attr("pname");
	//alert(instructor+ " "+pname);
	$(frm.instructor).val(instructor);
	$(frm.pname).val(pname);
	$("#modal").modal("hide");
	
});

getData();
function getData(){
	
	$.ajax({
		type:"get",
		url : "/cou/list.json",
		data : {page,size,key,word},
		dataType:"json",
		success:function(data){
			 console.log(data)
			const temp=Handlebars.compile($("#temp_pro").html());
			$("#div_pro").html(temp(data));
		}
	});
}
</script>