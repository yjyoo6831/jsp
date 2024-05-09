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
        <div id="div_pro"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      
      </div>
    </div>
  </div>
</div>


<script id="temp_pro" type="x-handlebars-template">

<table  class="table table-bordered table-hover">
<tr class="text-center">
	<td>No</td>
	<td>Name</td>
	<td>Department</td>
</tr>
 <tbody class="table-group-divider">
{{#each .}}
<tr class="text-center values" pcode="{{pcode}}" pname="{{pname}}" style="cursor:pointer">
	<td>{{pcode}}</td>
	<td>{{pname}}</td>
	<td>{{dept}}</td>

{{/each}}
</table> 
</script>
<script>
let page=1;
let size=100;
let key="dept";
let word=$(frm.dept).val();

$(frm.dept).on("change", function(){
	word=$(frm.dept).val();
	getData();
});
//각 행의 tr 을 클릭한경우 
$("#div_pro").on("click",".values",function(){
	const pcode=$(this).attr("pcode");
	const pname=$(this).attr("pname");
	alert(pcode+ " "+pname);
	$(frm.advisor).val(pcode);
	$(frm.pname).val(pname);
	$("#modal").modal("hide");
	
});

getData();

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
</script>