<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>수강중인 학생 목록</h1>
	<div id="div_stu"></div>
</div>

<script id="temp_stu" type="x-handlebars-template">

<table class="table table-bordered table-hover" >
<tr class="text-center" bgcolor="pink">
<td>No</td>
<td>Name</td>
<td>Department</td>
<td>Year</td>
<td>Registration Date</td>
<td>Grade</td>
</tr>
 <tbody class="table-group-divider">
{{#each .}}
	<tr class="text-center">
<td>{{scode}}</td>
<td><a href="/student/read?scode={{scode}}">{{sname}}</a></td>
<td>{{sdept}}</td>
<td>{{year}}</td>
<td>{{edate}}</td>
<td><input value="{{grade}}" size=3 class="text-end px-2">&nbsp;&nbsp/ 100 </td>
</tr>
{{/each}}
	</table>
</script>
<script>
	let lcode="${rcou.lcode}";
	getData();
	
	function getData(){
		$.ajax({
			type:"get",
			url:"/enroll/slist.json",
			dataType:"json",
			data:{lcode},
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_stu").html());
				$("#div_stu").html(temp(data));
			}
		});
	}
	

</script>