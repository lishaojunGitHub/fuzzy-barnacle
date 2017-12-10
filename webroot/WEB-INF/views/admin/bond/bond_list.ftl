<@layout.index menu="bond" menuid=1 style="padding-left:8px!important;padding-right:2px!important;">
<style>
.table{font-size:13px!important}
</style>
<section class="panel">
	<header class="panel-heading">
		<form action="/admin/bond/bond/list" method="POST">
			<div class="form-group">
				<div class="col-md-2">
				    <span style="padding-top:6px;display:inline-block;font-size:14px;">债券全称:</span>
				    <input style="width:69%;position:absolute;right:0px;top:0px;" type="text"  value="${name}" class="form-control" name="name" placeholder="请输入债券全称">
				</div>
				<div class="col-md-2">
				    <span style="padding-top:6px;display:inline-block;font-size:14px;">债券简码:</span>
				    <input style="width:69%;position:absolute;right:0px;top:0px;" type="text" value="${code}" class="form-control" name="code" placeholder="请输入债券简码">
				</div>
				<div class="col-md-3" style="padding-left: 0px!important;margin-left:20px;">
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
		</form><br/>
		<a href="/admin/bond/bond/add" style="margin-left:10px;" class="btn btn-success" data-toggle="confirmation" data-original-title="" title="">添加</a>
	</header>
	<div class="panel-body table-responsive">
		<table class="table table-bordered mb-none table" id="datatable-default" role="grid" aria-describedby="datatable-default_info">
			<thead>
				<tr role="row">
					<th style="width:200px">债券简码</th>
					<th style="width:300px">债券全称</th>
					<th style="width:300px">发行者</th>
					<th width=150px>票面利率</th>
					<th>名称</th>
					<th>类型</th>
					<th style="width:60px">操作</th>
				</tr>
			</thead>
			<tbody>
				<#list list as bean>
				<tr class="gradeX" role="row">
					<td>${bean.S_INFO_WINDCODE}</td>
					<td>${bean.B_INFO_FULLNAME}</td>
					<td>${bean.B_INFO_ISSUER}</td>
					<td width=80px>${bean.B_INFO_COUPONRATE}</td>
					<td style="width:120px">${bean.S_INFO_NAME}</td>
					<td style="width:70px">${bean.S_INFO_WIND_INDUSTRYNAME}</td>
					<td style="width:150px">
						<a href="/admin/bond/bond/detail?id=${bean.S_INFO_WINDCODE}"  class="ajax-modal btn btn-success  btn-xs" >查看</a>&nbsp;&nbsp;
						<a href="/admin/bond/bond/edit?id=${bean.S_INFO_WINDCODE}" class="btn btn-primary  btn-xs" >编辑</a>&nbsp;&nbsp;
						<a href="javascript:void(0);" onclick="del('${bean.S_INFO_WINDCODE}')" class="btn btn-danger  btn-xs" >删除</a>
					</td>
				</tr>
				</#list>
			</tbody>
		</table>
		<div class="col-sm-12 col-md-6">
			<div class="dataTables_paginate paging_bs_normal" id="datatable-default_paginate">
			<@html.pagination  obj_count=total  url="/admin/bond/bond/list" current_page=page page_size=pageSize/>
			</div>
		</div>
	</div>
</section>
<script>

function del(id) {
	if (window.confirm('你确定要删除吗')) {
		$.ajax({
			type: 'POST',
		    url: "/admin/bond/bond/delete?id="+id,
		    data: {} ,
		    success: function(data) {
		    	if(data.code > 0){
		    		alert(data.msg);
		    		window.location="/admin/bond/bond/list";
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