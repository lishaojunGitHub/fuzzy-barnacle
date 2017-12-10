<@layout.index menu="project" menuid=1 style="padding-left:8px!important;padding-right:2px!important;">
<style>
.table{font-size:13px!important}
</style>
<section class="panel">
	<header class="panel-heading">
	<form action="/admin/project/project/list" method="POST">
		<div class="form-group">
			<div class="col-md-2">
			     <span style="padding-top:6px;display:inline-block;font-size:14px;">项目名称:</span>
			     <input type="text" style="width:69%;position:absolute;right:0px;top:0px;" value="${name}" class="form-control" name="name" placeholder="请输入项目名称">
			</div>
			<div class="col-md-2">
			     <span style="padding-top:6px;display:inline-block;font-size:14px;">项目code:</span>
			     <input style="width:69%;position:absolute;right:0px;top:0px;" type="text" value="${code}" class="form-control" name="code" placeholder="请输入项目code">
			</div>
			
			<div class="col-md-3" style="padding-left: 0px!important;margin-left:20px;" >
				<div class="input-daterange input-group" data-plugin-datepicker="">
					<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</span>
					<input type="text" class="form-control form_datetime" name="begindate" value="${begindate}">
					<span class="input-group-addon">to</span>
					<input type="text" class="form-control form_datetime" name="enddate" value="${enddate}">
				</div>
			</div>
			<div class="col-md-3 col-xs-11">
				<button class="btn  btn-sm btn-primary">查询</button>
			</div>
		</div>
		</form>
		<br/>
		<a href="/admin/project/project/add" style="margin-left:10px;" class="btn btn-success" data-toggle="confirmation" data-original-title="" title="">添加</a>
	</header>
	<div class="panel-body table-responsive">
		<table class="table table-bordered mb-none table" id="datatable-default" role="grid" aria-describedby="datatable-default_info">
			<thead>
				<tr role="row">
					<th>编号</th>
					<th>项目名称</th>
					<th>项目CODE</th>
					<th>征信代码</th>
					<th>客户名称</th>
					<th>合同签订日期</th>
					<th style="width:160px">操作</th>
				</tr>
			</thead>
			<tbody>
			<#if list?? && list?size gt 0>
				<#list list as bean>
				<tr class="gradeX" role="row">
					<td>${bean.id}</td>
					<td>${bean.name}</td>
					<td>${bean.code}</td>
					<td>${bean.creditCode}</td>
					<td>${bean.customerName}</td>
					<td>${bean.contractTime}</td>
					<td style="width:160px">
						<a href="/admin/project/project/detail?id=${bean.id}"  class="ajax-modal btn btn-success  btn-xs" >查看</a>&nbsp;&nbsp;
						<a href="/admin/project/project/edit?id=${bean.id}" class="btn btn-primary  btn-xs" data-toggle="confirmation title="">编辑</a>&nbsp;&nbsp;
						<a href="javascript:void(0);" onclick="del('${bean.id}')" class="btn btn-danger  btn-xs" >删除</a>
					</td>
				</tr>
				</#list>
				<#else>
				<tr class="gradeX" role="row" style="text-align:center"><td colspan=8><b>无数据！</b></td></tr>
				</#if>
			</tbody>
		</table>
		<div class="col-sm-12 col-md-6">
			<div class="dataTables_paginate paging_bs_normal" id="datatable-default_paginate">
			<@html.pagination  obj_count=total  url="/admin/project/project/list" current_page=page page_size=pageSize/>
			</div>
		</div>
	</div>
</section>
<script>

function del(id) {
	if (window.confirm('你确定要删除吗')) {
		$.ajax({
			type: 'POST',
		    url: "/admin/project/project/delete?id="+id,
		    data: {} ,
		    success: function(data) {
		    	if(data.code > 0){
		    		alert(data.msg);
		    		window.location="/admin/project/project/list";
		    	} else if (data.code==0){
		    		alert(data.msg);
		    	}
		    },
		    dataType: 'json'
		});
	}
}

$('.ajax-modal').magnificPopup({
	type: 'ajax',
	width : '500px',
	modal: true
});
</script>
</@layout.index>