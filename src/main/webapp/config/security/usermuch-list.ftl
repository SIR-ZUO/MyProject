<div class="row">
	<div class="col-md-4 col-sm-4">
		<input type="hidden" value="" id="deptId" /> <input type="hidden"
			value="" id="nodeType" /> <input type="hidden" value="" id="nodeId" />
			<input type="hidden" id="user-url" value="usermuch/list"/>
		<div class="row" style="height: 51px; padding: 8px 0px 8px 15px">
			<div class="btn btn-primary" id="newOU">
				<i class="icon-plus"></i> 新建
			</div>
			<div class="btn btn-primary hidden" id="editOU">
				<i class="icon-edit "></i> 修改
			</div>
			<div class="btn btn-danger hidden" id="removeOU">
				<i class="icon-remove"></i> 删除
			</div>
			<div class="btn btn-default btn-sm" id="init-pinyin-btn">拼音简写初始化</div>
		</div>
		<div class="unit-user-tree" style="border-top: 1px solid #ddd; max-height: 800px; overflow: auto;">加载中......</div>
	</div>
	<div class="col-md-8 col-sm-8">
		<div id="userList">
			<table class="user-list"
				data-page="<#if pageIndex??>${pageIndex}<#else>1</#if>"
				data-page-size="<#if pageSize??>${pageSize}<#else>20</#if>"
				data-count="<#if count??>${count}<#else>0</#if>">
				<tr class="title-row">
					<th style="display: none"></th>
					<th>所属部门</th>
					<th>姓名</th>
					<th>全名</th>
					<th>识别码</th>
				</tr>
				<#if data??> <#list data as user>
				<tr>
					<td style="display: none">${user.id}</td>
					<td>${user.unitName}</td>
					<td>${user.name}</td>
					<td>${user.fullName}</td>
					<td>${user.uniqueCode}</td>
				</tr>
				</#list> </#if>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	require(['suredyTree','suredyList','suredyModal'], function(Tree, List, Modal) {
		var listConfig = ({
			header : true,
			footer : true,
			search : false,
			checkbox : true,			
			paginate : function(page, size) {
				var url='usermuch/list.do?page=' + page + '&size=' + size+'&deptId='+$("#deptId").val();
				$.get(url, function(html, textStatus, jqXHR) {
					var $html = $(html);
						$("#userList").html($("#userList", $html).html());
						List('.user-list', listConfig);
				}, 'html');
			},
			
			btns : [ {
				text :'新建',
				icon : 'icon-plus',
				style : 'btn-info',
				click : function() {
					Modal.showModal({
						size : 'lg',
						icon : 'icon-plus',
						title : '新建人员',
						showFoot : false,
						uri : 'user/form'
					});
				}
			}, {
				text :'修改',
				icon : 'icon-edit',
				style : 'btn-info',
				click : function() {
					var checked = List.checked($('.user-list'));
					if (checked.length == 0 ) {
						alert('请选择需要修改的人员!');
						return;
					} else if (checked.length > 1) {
						alert('只能修改一个人员!');
						return;
					} else {
						var userId = $( $( checked[0]).find('td' )[1] ).html();
						var uri = 'user/form?userId=' + userId;
						Modal.showModal({
							size : 'lg',
							icon : 'icon-edit',
							title : '修改人员',
							showFoot : false,
							uri : uri
						});
					}
				}
			},  {
				text : '删除',
				icon : 'icon-remove',
				style : 'btn-danger',
				click : function() {
					var checked = List.checked($('.user-list'));
					if (checked.length == 0 ) {
						alert('请选择需要删除的人员!');
						return;
					} else if (checked.length > 1) {
						alert('只能删除单个账户!');
						return;
					} else {
						if(confirm('是否确认删除该用户，删除后将不能进行恢复！')){
							var userId = $( $( checked[0]).find('td' )[1] ).html();
							$.ajax({
									url : 'user/delete?userId=' + userId,
									dataType : 'json',
									type : 'POST',
									success : function(success) {
										if (!success) {
											alert('用户删除失败！');
										} else if (!success.success) {
											alert('用户删除失败！\n\n' + success.msg);
										} else {
											alert('用户删除成功！');
											Suredy.loadContent('usermuch/list');
											Modal.closeModal();
										}
									},
									error : function(a, b, c) {
										alert('服务器错误! ' + b);
									}
								});
						}
					} 
				} 
			} ,  {
				text : '角色',
				icon : 'icon-magnet',
				style : 'btn-default',
				click : function() {
					var checked = List.checked($('.user-list'));
					if (checked.length == 0 ) {
						alert('请选择需要管理的人员!');
						return;
					} else if (checked.length > 1) {
						alert('只能管理单个人员!');
						return;
					} else {
						var userId = $( $( checked[0]).find('td' )[1] ).html();
						var uri = 'user/role?userId=' + userId;
						Modal.showModal({
							size : 'lg',
							icon : 'icon-magnet',
							title : '人员-角色映射',
							showFoot : false,
							uri : uri
						});
					}
				}
			} ,  {
				text : '权限',
				icon : 'icon-search',
				style : 'btn-default',
				click : function() {
					var checked = List.checked($('.user-list'));
					if (checked.length == 0 ) {
						alert('请选择需要管理的人员!');
						return;
					} else if (checked.length > 1) {
						alert('只能管理单个人员!');
						return;
					} else {
						var userId = $( $( checked[0]).find('td' )[1] ).html();
						var uri = 'user/permission?userId=' + userId;
						Modal.showModal({
							size : 'lg',
							icon : 'icon-search',
							title : '人员权限定义',
							showFoot : false,
							uri : uri
						});
					}			
				}
			}]
		});	
		List('.user-list', listConfig);
		
		var ouTree = function() {
			Tree('.unit-user-tree', 'ou/tree', {
				autoCollapse : false,
				leafCheckbox : false,
				folderCheckbox : false,
				inContainer : false,
				style : 'department'
			});
			
			$('.unit-user-tree').on(Suredy.Tree.nodeClick, function(event, $node) {
				var nodeData = Tree.data($node);
				var nodeType = nodeData.text;
				if ('org' === nodeData.flag) {
					$('#nodeType').val('org');
				}  else {
					$('#nodeType').val('unit');
				}					
				if (nodeData.id){
					$('#nodeId').val(nodeData.id);
					$('#editOU').removeClass('hidden');
					$('#removeOU').removeClass('hidden');
				} else {
					$('#nodeId').val('');
					$('#editOU').addClass('hidden');
					$('#removeOU').addClass('hidden');
				} 
				var url='usermuch/list.do?deptId='+nodeData.id;
				$("#deptId").val(nodeData.id);
				$.get(url, function(html, textStatus, jqXHR) {
					var $html = $(html);
						$("#userList").html($("#userList", $html).html());
						List('.user-list', listConfig);
				}, 'html');	
			});
		};
		ouTree();	

		
		$('#newOU').on('click', function() {	
			var type = $('#nodeType').val();
			Modal.showModal({
				size : 'lg',
				icon : 'icon-plus',
				title : (type === 'unit') ? '创建部门' : '创建单位',
				showFoot : false,
				uri : (type === 'unit') ? 'ou/unit/form' : 'ou/org/form'
			});
		
		});
		

		// edit menu btn click
		$('#editOU').on('click', function() {	
			var nodeId = $('#nodeId').val();
			var nodeType = $('#nodeType').val();
			if (nodeId == '') {
				alert('请选择需要修改的节点！');
				return;
			}
			Modal.showModal({
				size : 'lg',
				icon : 'icon-edit',
				title : nodeType == 'unit' ? '修改部门' : '修改单位',
				showFoot : false,
				uri : nodeType == 'unit' ? 'ou/unit/form.do?unitId=' + nodeId : 'ou/org/form.do?orgId=' + nodeId
			});
		
		});
	
		// remove btn click
		$('#removeOU').on('click', function() {
			var nodeId = $('#nodeId').val();
			var nodeType = $('#nodeType').val();
	
			if (nodeId == '') {
				alert('请选择需要删除的节点！');
				return;
			}
	
			var msg = '是否确认删除【选中的节点】？\n\n\提示：\n\该操作将会删除该节点下的所有子节点！\n\请谨慎操作！';
	
			if (!window.confirm(msg)) {
				return;
			}
	
			$.ajax({
				url : nodeType == 'org' ? 'ou/org/delete.do' : 'ou/unit/delete.do',
				type : 'POST',
				data : {
					nodeId : nodeId
				},
				success : function(msg) {
					if (!msg) {
						alert('Unknown exception!');
					} else if (!msg.success) {
						alert("删除单位/部门失败！\n\n" + msg.msg);
					} else {
						alert("删除单位/部门成功！");
						ouTree();
	
						$('#editOU').addClass('hidden');
						$('#removeOU').addClass('hidden');
					}
				},
				error : function(a, b, c) {
					alert('Server error! ' + b);
				}
			});
		});	
		
		$('#init-pinyin-btn').on('click', function() {	
			Modal.showProcessDialog({});		
			$.ajax({
				url : '${request.contextPath}/config/user/pinyin',
				dataType : 'json',
				type : 'GET',
				success : function(success) {
					if (!success) {
						alert('初始化用户简拼信息失败！');
					} else if (!success.success) {
						alert('初始化用户简拼信息失败！\n\n' + success.msg);
					} else {
						alert('初始化用户简拼信息成功！');
					}
					Modal.closeProcessDialog();
				},
				error : function(a, b, c) {
					alert('服务器错误! ' + b);
					Modal.closeProcessDialog();
				}
			});	
		});
	});
</script>	