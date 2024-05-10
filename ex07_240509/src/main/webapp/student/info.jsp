<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<h1>수강신청 목록</h1>
	<div id="div_enroll"></div>
</div>
<script id="temp_enroll" type="x-handlebars-template">
<table class="table table-bordered table-hover">
<tr class="text-center" bgcolor="pink">
<td>No</td>
<td>Course</td>
<td>Hours</td>
<td>Room</td>
<td>Persons</td>
<td>Professor</td>
<td>Registration date</td>
</tr>
 <tbody class="table-group-divider">
{{#each .}}
	<tr class="text-center">
<td>{{lcode}}</td>
<td><a href="/cou/read?lcode={{lcode}}">{{lname}}</a></td>
<td>{{hours}}</td>
<td>{{room}}</td>
<td>{{persons}} / {{capacity}}</td>
<td>{{pname}} ({{pcode}})</td>
<td>{{edate}}</td>
</tr>
{{/each}}
	</table>
</script>
<script id="temp_cou" type="x-handlebars-template">
	<select class="form-select">
		{{#each .}}
			<option>
				{{lname}}:{{pname}}&nbsp;&nbsp;
				({{persons}}/{{capacity}})
			</option>
		{{/each}}
	</select>
</script>
<script>
	let scode="${stu.scode}";
	console.log("scord.......................",scode)
	getData();
	console.log("scord2.......................",scode)
	function getData(){
		$.ajax({
			type:"get",
			url:"/enroll/list.json",
			data:{scode},
			dataType:"json",
			success:function(data){
				console.log("here....."+data);
				const temp=Handlebars.compile($("#temp_enroll").html());
				$("#div_enroll").html(temp(data));
			},
			error:function(a,b,c){
				alert("error....")
				console.log(a,b,c);
			}
		});
	}
	
	getCou();
	function getCou(){
		$.ajax({
			type:"get",
			url:"/cou/list.json",
			data:{page:1, size:100, key:'lcode', word:''},
			dataType:"json",
			success:function(data){
				const temp=Handlebars.compile($("#temp_cou").html());
				$("#div_cou").html(temp(data));
			}
		});
	}
</script>