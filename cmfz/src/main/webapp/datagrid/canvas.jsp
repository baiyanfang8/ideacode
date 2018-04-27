<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<p>Image to use:</p>
<img id="scream" src="${pageContext.request.contextPath}/img/img_the_scream.jpg" alt="The Scream" width="220" height="277">
<canvas id="myCanvas" width="250" height="300" style="border:1px solid #d3d3d3;">


<script type="text/javascript" >
    //首先找到<canvas>元素
    var c=document.getElementById("myCanvas");
    //创建context对象
    var ctx=c.getContext("2d");
    /*ctx.font ="30px Arial";
    ctx.strokeText("Hello World",10,50);

    //创建渐变
    ar grd=ctx.createRadialGradient(75,50,5,90,60,100);
    grd.addColorStop(0,"red");
    grd.addColorStop(1,"white");
    //填充渐变
    ctx.fillStyle=grd;
    ctx.fillRect(10,10,150,80);
    */
    var img=document.getElementById("scream");
    img.onload = function () {
       ctx.drawImage(img, 10,10);
    }
</script>