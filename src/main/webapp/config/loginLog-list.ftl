<div class="row">
	<div class="col-md-12" style="margin-left: 5px;">
		<div class="row">
			<form id="form" name="form">
				<div class="row" >
					<div class="col-md-3 col-xs-3" >
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">开始时间</div>
								<input type="text" class="form-control datetimepicker"  id="startTime"  data-format="yyyy-MM-dd hh:MM:ss"  name="startTime" value="" />
							</div>
						</div>
					</div>
					<div class="col-md-3 col-xs-3">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">结束时间</div>
								<input type="text" class="form-control datetimepicker"  id="endTime" name="endTime" value="" data-format="yyyy-MM-dd hh:MM:ss" />
							</div>
						</div>
					</div>
					<div class="col-md-3 col-xs-3">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">登录人</div>
								<input type="text" class="form-control"  id="loginName" name="loginName" />
							</div>
						</div>
					</div>
					<div class="col-md-3 col-xs-3">
						<div class="btn btn-info pull-right" id="properSearchbtn" style="margin-right: 20px;">
							<i class="icon-search"></i> 查询
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="row" style="overflow-x: auto;padding-top: 5px;">
			<div id="loginLogList">
				<table class="loginLog-list" data-page="<#if pageIndex??>${pageIndex}<#else>1</#if>" data-page-size="<#if pageSize??>${pageSize}<#else>20</#if>" data-count="<#if count??>${count}<#else>0</#if>"style="width: 100%;">
					<tr class="title-row">
						<th style="display: none"></th>
						<th>登录人</th>
						<th>登录IP</th>
						<th>登录时间</th>
					</tr>
					<#if data??> <#list data as loginLog>
					<tr>
						<td style="display: none">${loginLog.id}</td>
						<td>${loginLog.loginName}</td>
						<td>${loginLog.loginIp}</td>
						<td>${(loginLog.logindate?string('yyyy-MM-dd hh:MM:ss'))!''}</td>
					</tr>
					</#list> </#if>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var listConfig;
var tempTree;
var tempList;
require(['suredyList','jqueryForm','suredyDatetimepicker'], function(List) {
	var listConfig = ({
		header : false,
		footer : true,
		search : false,
		checkbox : true,			
		paginate : function(page, size) {
			var url='${request.contextPath}/config/loginlog/list.do?page=' + page + '&size=' + size;
			$.post(url, $('#form').serialize() , function(html, textStatus, jqXHR) {
				var $html = $(html);
					$("#loginLogList").html($("#loginLogList", $html).html());
					List('.loginLog-list',listConfig);
			}, 'html');
		}
	});
   
	$("#properSearchbtn").click(function(){
		var url='${request.contextPath}/config/loginlog/list.do';
		$.post(url, $('#form').serialize() , function(html, textStatus, jqXHR) {
			var $html = $(html);
			$("#loginLogList").html($("#loginLogList", $html).html());
			List('.loginLog-list',listConfig);
		}, 'html');
	});
	
	List('.loginLog-list',listConfig);	
});
</script>
