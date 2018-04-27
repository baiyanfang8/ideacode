<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    $(function (){
        $('#tt').treegrid({
            url:'${pageContext.request.contextPath}/json/treedatagrid.json',
            method:"get",
            idField:'id',
            treeField:'name',
            columns:[[
                {field:'name',title:'姓名',width:60,align:'right'},
                {field:'size',title:'大小',width:80},
                {field:'time',title:'时长',width:80}
            ]],
            fit:true,
            fitColumns:true,
            toolbar: [{
                iconCls: 'icon-edit',
                text:"专辑详情",
                handler: function(){
                  var row= $("#tt").treegrid("getSelected");
                  if (row ==null){
                      $.messager.alert('我的消息','请选中专辑！','info');
                  }else{
                      if (row.size==null){
                        $("#dd").dialog("open");
                          $('#ff').form('load',row);
                          $("#img").prop("src","${pageContext.request.contextPath}"+row.img)
                          }else{
                          $.messager.alert('我的信息','请选中专辑!','info');
                      }
                    }


                }
            },'-',{
                iconCls: 'icon-help',
                text:"添加专辑",
                handler: function(){

                }
            },'-',{
                iconCls: 'icon-help',
                text:"添加章节",
                handler: function(){
                    var row= $("#tt").treegrid("getSelected");
                    if (row ==null){
                        $.messager.alert('我的消息','请选中专辑！','info');
                    }else{
                        if (row.size==null){
                            $("#addChapter_dialog").dialog("open");
                            $('#AlbumId').val(row.id);

                        }else{
                            $.messager.alert('我的消息','请选中专辑！','info');
                        }

                    }

                }
            },'-',{
            iconCls: 'icon-help',
                text:"下载章节",
            handler: function(){
                var row=$("#tt").treegrid("getSelected");
                if (rew==null){
                    $.messager.alert('我的消息','请选中章节！','info');
                }
                    if (row.size==!null){
                        Location.href="${pageContext.request.contextPath}/chapter/down?url="+row.url+"&&oldName="+row.name;
                    }else{
                        $.messager.alert('我的消息','请选中章节！','info');
                    }
                }
            }]
        });
    });

    function submit(){
        $('#addChapter_from').form('submit',{url:"${pageContext.request.contextPath}/chapter/add"});
        $("#tt").treegrid("reload");
    }
</script>
    <table id="tt" style="width:600px;height:400px"></table>

<div id="dd" class="easyui-dialog" title="My Dialog" style="width:400px;height:200px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">


<form id="ff" method="post" style="text-align: center">
    <div>
        <label for="score">Name:</label>
        <input id="score" class="easyui-validatebox" type="text" name="score" data-options="required:true" />
    </div>
    <div>
        <label for="author">Email:</label>
        <input id="author" class="easyui-validatebox" type="text" name="author" data-options="" />
    </div>
    <div>
        <img id="img" src=""/>
    </div>
</form>
</div>

<div id="addChapter_dialog" class="easyui-dialog" title="My Dialog" style="width:400px;height:200px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,buttons:[{
   	text:'保存',
				handler:function(){
				submit();
				}
			},{
				text:'关闭',
				handler:function(){}
			}]">

    <form id="addChapter_from" method="post" style="text-align: center" enctype="multipart/form-data">

        <div>

            <input id="AlbumId"  type="hidden" name="id" style="width: 300px"/>
        </div>
        <div>
            <label for="upload">上传:</label>
            <input id="upload" class="easyui-filebox" name="file" style="width: 300px">
        </div>

    </form>
</div>

<div id="play" class="easyui-dialog" title="My DiaLog" style="width: 400px
;height: 200PX;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
    <div>
        <audio id="aaaa" src="" controls="controls" autoplay="autoplay"></audio>

    </div>


</div>