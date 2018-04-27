<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/echarts.min.js">
    </script>
<%--引入相关的js扎包--%>
<%--创建dom容器--%>
<div id="main" style="width: 600px;height: 400px
;"></div>
<script type="text/javascript">
    $.ajax({
        url:"${pageContext.request.contextPath}/json/echarts.json",
        dataType:"JSON",
        type:"get",
        success:function(data){
            <%--初始化dom容器--%>
            var myChart = echarts.init(document.getElementById('main'));
            <%--自定义配置项--%>
            var option={
                title:{
                    text:'ECharts 入门示例'
                },
                tooltip:{},
                legend:{
                    data:['销量']
                },
                xAxis:{
                    data:["美女","帅哥","丑女","屌丝","男神","女神"]
                },
                yAxis:{},
                series:[{
                    name:'销量',
                    type:'bar',
                    data:data.data,
                },{
                    name:'线',
                    type:'line',
                    data:data.data,
                }]
            };
            myChart.setOption(option);
        }
    })
    //使用刚指定的配置项和数据显示图表。

</script>









