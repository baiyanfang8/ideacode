<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    $(function () {
        $('#dg').edatagrid({
            url:"${pageContext.request.contextPath}/json/banner.json",
            method:'get',
            columns:[[
                {field:'id',title:'编号',width:100,editor:{type:"text",options:{
                            required:true
                        }}},
                {field:'name',title:'姓名',width:100,editor:{type:"text",options:{
                            required:true
                        }}},
                {field:'password',title:'密码',width:100,align:'right',editor:{type:"text",options:{
                            required:true
                        }}},
                {field:'img',title:'图片',width:100,align:'right',editor:{type:"text",options:{
                    required:true
                        }}}
            ]],
            pagination:true,
            fitColumns:true,
            fit:true,
            updateUrl:"${pageContext.request.contextPath}/pic/update",
            pageSize:5,
            pageList:[5,10,15,20],
            view: detailview,
            toolbar: [{
                iconCls: 'icon-edit',
                text:"添加",
                handler: function(){
                    //打开
                    $("#dd").dialog("open")
                }
            },'-',{
                iconCls: 'icon-help',
                text:"修改",
                handler: function(){
                    /*将当前行变成可编辑的行*/
                   var row= $("#dg").edatagrid("getSelected");
                   if(row ==null){
                       alert("请选中指定行");
                   }else{
                       $("#dg").edatagrid(" getRowIndex",row);
                       $("#dg").edatagrid("editRow",$("#dg").edatagrid(" getRowIndex",row));
                       getRowIndex
                   }
                }
            },'-',{
                iconCls: 'icon-help',
                text:"删除",
                handler: function(){
                    var row= $("#dg").edatagrid("getSelected");
                    if(row ==null) {
                        alert("请选中指定行");
                    }else{
                        /*执行删除命令*/
                        $.ajax({
                            url:"{pageContext.request.contextPath}/pic/delete",
                            data:{id:row.id},
                            type:"POST",
                            dataType:"JSON",
                            success:function(data){
                                
                            }
                        });


                        Location.href="${pageContext.request.contextPath}/pic/delete?id="+row.id;
                        $("#dg").edatagrid("reload")
                    }
                }
            },'-',{
                iconCls: 'icon-help',
                text:"保存",
                handler: function(){
                    $("#dg").edatagrid("saveRow");
                    $("#dg").edatagrid("reload")
                }
            }],

            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/img/'+ rowData.img +'" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.name+ '</p>' +
                    '<p>Status: ' + rowData.password+ '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        });
    });
    function submit() {
        /*提交from表单*/
        $('#ff').form('submit', {url:"${pageContext.request.contextPath}/pic/add"})
        }
</script>

<table id="dg"></table>
<div id="dd" class="easyui-dialog" title="My Dialog" style="width:400px;height:200px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[{
				text:'保存',
				handler:function(){
                submit();


				}
			},{
				text:'关闭',
				handler:function(){}
			}]">


    <form id="ff" method="post" enctype="multipart/form-data" style="text-align: center">
        <div>
            <label for="desc">描述信息:</label>
            <input id="desc" class="easyui-validatebox" type="text" name="desc" data-options="required:true" />
        </div>
        <div>
            <label for="email">点击上传:</label>
            <input id="email" class="easyui-filebox"  name="file" data-options="" />
        </div>

        <div>
            <label for="cc">点击上传:</label>
            <select id="cc" class="easyui-combobox" name="status" style="width:200px;">
                <option value="Y">展示</option>
                <option value="N">不展示</option>
            </select>


        </div>

    </form>
</div>