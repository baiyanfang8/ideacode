<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/echarts.min.js">
    </script>
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    var xAxisData = [];
    var data1 = [];
    var data2 = [];
    for (var i = 0; i < 100; i++) {
        xAxisData.push('类目' + i);
        data1.push((Math.sin(i / 5) * (i / 5 -10) + i / 6) * 5);
        data2.push((Math.cos(i / 5) * (i / 5 -10) + i / 6) * 5);
    }

    option = {
        title: {
            text: '柱状图动画延迟'
        },
        legend: {
            data: ['bar', 'bar2'],
            align: 'left'
        },
        toolbox: {
            // y: 'bottom',
            feature: {
                magicType: {
                    type: ['stack', 'tiled']
                },
                dataView: {},
                saveAsImage: {
                    pixelRatio: 2
                }
            }
        },
        tooltip: {},
        xAxis: {
            data: xAxisData,
            silent: false,
            splitLine: {
                show: false
            }
        },
        yAxis: {
        },
        series: [{
            name: 'bar',
            type: 'bar',
            data: data1,
            animationDelay: function (idx) {
                return idx * 10;
            }
        }, {
            name: 'bar2',
            type: 'bar',
            data: data2,
            animationDelay: function (idx) {
                return idx * 10 + 100;
            }
        }],
        animationEasing: 'elasticOut',
        animationDelayUpdate: function (idx) {
            return idx * 5;
        }
    };
    myChart.setOption(option);
</script>









