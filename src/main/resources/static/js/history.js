jQuery.fn.historyRecords = function(options) {
    //创建一些默认值，拓展任何被提供的选项
    var settings = $.extend({
        'url':'',
        'page': '',
        'startSize':'',
        'pageSize':''
    }, options);
    return this.each(function () {
        $("<style></style>").text("#history{position:fixed;right:-400px;top:50px;background-color:#fff;border-left:1px solid #e7e7e7}#history .title{background-color:#f1f1f1;height:25px;line-height:30px;padding:0 10px}#history .title img{height:16px;cursor:pointer}#history .history-list{padding:20px;overflow-y:scroll}#history .history-list ul{list-style:none;margin:0;padding:0}#history .history-list li{border-bottom:1px solid #ccc;padding:10px 0}#history .history-list li .img img{width:30px;height:30px}#history .history-list li .text{margin-left:10px;width:300px}#history .history-list li .top{line-height:30px}#history .history-list li .top i{font-style:normal;background-color:#3b9e3b;color:#fff;font-size:12px;padding:4px 8px;border-radius:4px;margin:0 5px}#history .history-list li .top em{font-style:normal;color:#2d8cf0}#history .history-list li p{margin:0}#history .history-list li .top span{float:right;color:#666;font-size:12px}#history .history-list li .bt{width:180px;color:#666;line-height:20px;font-size:12px;margin-top:4px}#history .history-list .bottom-text{text-align:center;margin-top:20px}").appendTo($("head"));
        var _html =
            '<div id="history" style="height:'+ parseInt($(window).height()-50)+'px">' +
            '   <div class="title">' +
            '        <i class="fas fa-angle-double-right" onclick="turnHide()" style="font-size: 18px;cursor: pointer;"></i>' +
            '   </div>' +
            '   <div class="history-list"><ul></ul><div class="bottom-text"></div></div>' +
            '</div>';
        $("body").append(_html);
        var parentNode = $("#history");
        var scrollMain = $("#history .history-list");
        parentNode.animate({"right":"0px"},600);
        scrollMain.css("height",parseInt($(window).height()-90)+"px");
        function getData(page,size) {
            $.ajax({
                url: settings.url,
                type: 'post',
                data: JSON.stringify({pageNo: page, pageSize: size}),
                success: function (res) {
                    var dataList = res;
                var dataHtml = '';
                    $(".history-list ul").html('');
                for (var i = 0; i < dataList.length; i++) {
                    dataHtml += '<li class="clearfix">' +
                        '           <div class="img pull-left"><img src="img/people.png" alt=""></div>' +
                        '           <div class="text pull-right">' +
                        '               <p class="top"><b>' + dataList[i].operatorId + '</b> <i>' + dataList[i].workName + '</i> <em>' + dataList[i].lineName + '</em> <span>' + new Date(dataList[i].operateTime).toLocaleString() + '</span></p>' +
                        '               <p class="bt">' + dataList[i].memo + '</p>' +
                        '           </div>' +
                        '       </li>';
                }
                scrollMain.find("ul").append(dataHtml);
                }, dataType: 'json', contentType: 'application/json'
            });
        }
        getData(settings.page,settings.startSize);

        var count = 1; /*计数器*/
        var nScrollHight = 0; //滚动距离总长(注意不是滚动条的长度)
        var nScrollTop = 0;  //滚动到的当前位置
        var nDivHight = scrollMain.height();
        scrollMain.scroll(function(){
            nScrollHight = $(this)[0].scrollHeight;
            nScrollTop = $(this)[0].scrollTop;
            if(Math.ceil(nScrollTop + nDivHight) >= nScrollHight){
                if(scrollMain.find("ul li").length > 40){
                    scrollMain.find(".bottom-text").html("<p>没有更多数据了~</p>");
                }else{
                    count++;
                    getData(count,settings.pageSize);
                }
            }
        });
    });
};
function turnHide() {
    $("#history").animate({"right":"-400px"},600);
}
