<@layout.index menu="project" menuid=1>
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title"><#if action=="add">添加项目<#else>编辑项目</#if></h2>
			</header>
			<div class="panel-body">
				<form class="form-horizontal form-bordered" method="POST" action="/admin/project/project/save">
					<input type="hidden" name="project.id" value="${bean.id}"/>
					<#assign md=3 />
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">项目名称</label>
						<div class="col-md-6">
							<input type="text" value="${bean.name}" name="project.name" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">客户名称</label>
						<div class="col-md-6">
							<input type="text" value="${bean.customerName}" name="project.customerName" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">项目CODE</label>
						<div class="col-md-6">
							<input type="text" value="${bean.code}" name="project.code" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">征信代码</label>
						<div class="col-md-6">
							<input type="text" value="${bean.creditCode}" name="project.creditCode" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">评级费用（万）</label>
						<div class="col-md-6">
							<input type="text" value="${bean.ratingCost}" name="project.ratingCost" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">跟踪费用（万）</label>
						<div class="col-md-6">
							<input type="text" value="${bean.tailRatingCost}" name="project.tailRatingCost" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">债券类型1</label>
						<div class="col-md-6">
							<input type="text" value="${bean.bondType1}" name="project.bondType1" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">债券类型2</label>
						<div class="col-md-6">
							<input type="text" value="${bean.bondType2}" name="project.bondType2" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">合同签订日期</label>
						<div class="col-md-6">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</span>
								<input type="text" data-plugin-datepicker="" id="contractTime" value="${bean.contractTime}" class="form-control form_datetime" name="project.contractTime">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label"></label>
						<div class="col-md-6 col-xs-11">
							<button style="float:right;" class="btn btn-primary">提 交</button>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
</div>
<script type="text/javascript">
    $(".form_datetime").datepicker({format: 'yyyy-mm-dd HH:MM:SS'});
</script>        
</@layout.index>