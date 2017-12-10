<@layout.index menu="customer" menuid=1 style="padding-left:8px!important;padding-right:2px!important;">
<style>
.table{font-size:13px!important}
</style>
<section class="panel">
	<header class="panel-heading">
		<form action="/admin/customer/customer/list" method="POST">
		<div class="form-group">
			<div class="col-md-2">
			    <span style="padding-top:6px;display:inline-block;font-size:14px;">公司名称:</span>
			    <input type="text" style="width:69%;position:absolute;right:0px;top:0px;" value="${name}" class="form-control" name="name" placeholder="请输入公司名称">
			</div>
			<div class="col-md-2">
			    <span style="padding-top:6px;display:inline-block;font-size:14px;">公司code:</span>
			    <input type="text" style="width:69%;position:absolute;right:0px;top:0px;" value="${code}" class="form-control" name="code" placeholder="请输入公司code">
			</div>
			<#assign industryArray=["银行","建筑","电力","化工","冶金","制造业","消费服务","交通运输","城市建设与投资"]/>
			<div class="col-md-2">
				<select name="industry" class="md-md form-control">
					<option value="">请选择行业</option>
					<#list industryArray as ia>
					<option value="${ia}"  <#if industry==ia>selected="selected"</#if>>${ia}</option>
					</#list>
				</select>
			</div>
			<div class="col-md-2">
				<select name="property" class="md-md form-control">
					<option value="">公司性质</option>
					<option value="中央国有企业" <#if property="中央国有企业">selected="selected"</#if>>中央国有企业</option>
					<option value="中外合资企业" <#if property="中外合资企业">selected="selected"</#if>>中外合资企业</option>
					<option value="地方国有企业" <#if property="地方国有企业">selected="selected"</#if>>地方国有企业</option>
					<option value="民营企业" <#if property="民营企业">selected="selected"</#if>>民营企业</option>
					<option value="其他企业" <#if property="其他企业">selected="selected"</#if>>其他企业</option>
				</select>
			</div>
			<div class="col-md-3" style="padding-left: 0px!important">
				<div class="input-daterange input-group" data-plugin-datepicker="">
					<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</span>
					<input type="text" class="form-control form_datetime" name="begindate" value="${begindate}">
					<span class="input-group-addon">to</span>
					<input type="text" class="form-control form_datetime" name="enddate" value="${enddate}">
				</div>
			</div>
			<div class="col-md-1 col-xs-11">
				<button class="btn  btn-sm btn-primary">查询</button>
			</div>
		</div>
		</form>
		<br/>
		<a href="/admin/customer/customer/add" style="margin-left:10px;" class="btn btn-success" data-toggle="confirmation" data-original-title="" title="">添加</a>
	</header>
	<div class="panel-body table-responsive">
		<table class="table table-bordered mb-none table" role="grid" aria-describedby="datatable-default_info">
			<thead>
				<tr role="row">
					<th>编号</th>
					<th>公司名称</th>
					<th>公司code</th>
					<th>省</th>
					<th>市</th>
					<th>行业</th>
					<th>公司性质</th>
					<th style="width:60px">操作</th>
				</tr>
			</thead>
			<tbody>
				<#if list?? && list?size gt 0>
				<#list list as bean>
				<tr class="gradeX" role="row">
					<td>${bean.id}</td>
					<td style="width:400px">${bean.name}</td>
					<td style="width:90px">${bean.code}</td>
					<td style="width:150px">${bean.province}</td>
					<td style="width:90px">${bean.city}</td>
					<td>${bean.industry_name2}</td>
					<td>${bean.property}</td>
					<td style="width:150px">
						<a href="/admin/customer/customer/detail?id=${bean.id}"  class="ajax-modal btn btn-success  btn-xs" >查看</a>&nbsp;&nbsp;
						<a href="/admin/customer/customer/edit?id=${bean.id}" class="btn btn-primary  btn-xs">编辑</a>&nbsp;&nbsp;
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
			<@html.pagination  obj_count=total  url="/admin/customer/customer/list" current_page=page page_size=pageSize/>
			</div>
		</div>
	</div>
</section>
<script>
(function($) {
	'use strict';
	var datatableInit = function() {
		$('#datatable-default').dataTable({"pageLength": 50});
	};
	$(function() {
		datatableInit();
	});
}).apply(this,[jQuery]);

function del(id) {
	if (window.confirm('你确定要删除吗')) {
		$.ajax({
			type: 'POST',
		    url: "/admin/customer/customer/delete?id="+id,
		    data: {} ,
		    success: function(data) {
		    	if(data.code > 0){
		    		alert(data.msg);
		    		window.location="/admin/customer/customer/list";
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