$(function () {
    //查询
    $("#searchbtn").on('click', function () {
        initTable();
    });

    //初始化表格
    initTable();
});

function initTable() {
    $("#taskTable").bootstrapTable('destroy');
    $('#taskTable').bootstrapTable({
        url: 'task/searchTask',
        method: 'post',
        pagination: true,
        sidePagination: "server",
        contentType: "application/json",
        striped: true,
        dataType: "json",
        searchTimeOut: 5000,
        queryParamsType: '',
        pageSize: 10,
        pageNumber: 1,
        pageList: [10, 25],
        queryParams: function queryParams(params) {

            //设置查询参数
            var param = {
                pageSize: params.pageSize,
                pageNo: params.pageNumber
            };
            return param;
        },
        striped: true,
        detailView: true,//父子表
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {
            InitSubTable(index, row, $detail);
        },
        columns: [
            {
                field: 'id',
                title: 'id',
                visible: false
            },
            {
                field: 'name',
                title: '姓名'
            },
            {
                title: '推荐职位',
                field: 'recommendPosition'
            },
            {
                title: '联系方式',
                field: 'mobile'
            },
            {
                title: '性别',
                field: 'sex'
            },
            {
                title: '邮箱',
                field: 'mail'
            },
            {
                title: '提交简历日期',
                field: 'submitDate'
            },
            {
                title: '简历来源',
                field: 'comeFrom'
            },
            {
                field: 'operate',
                title: '操作',
                align: 'center',
                events: operateEvents,
                formatter: operateFormatter
            }
        ],
        onLoadSuccess: function (data) {

        }
    });

}

function operateFormatter(value, row, index) {

    return '<button type="button" class="btn btn-primary btn-xs" id="editInfo">沟通信息</button>' +
    '<button type="button" class="btn btn-primary btn-xs" id="interview" style="margin-left: 5px">确认到面</button>';
}

//下载、删除  按钮功能
window.operateEvents = {
    "click #editInfo": function (e, vlaue, row) {
    },
    "click #interview": function (e, vlaue, row) {
    }
};


/**
 * 创建子表，查询出有效（最新版）文件
 * @return {string}
 */
function InitSubTable(index, row, $detail) {
    var cur_table = $detail.html('<table></table>').find('table');
    $(cur_table).bootstrapTable({
        url: "task/searchSituation",            //请求后台的URL（*）
        // dataType: "json",
        method: "post",                     //请求方式（*）
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: true,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
        pageSize: 10,                     //每页的记录行数（*）
        pageList: [10, 25, 50],        //可供选择的每页的行数（*）
        search: false,                      //是否显示表格搜索
        queryParamsType: '',
        //后台查询参数
        queryParams: function (params) {
            var temp = {
                pageNumber: params.pageNumber,
                pageSize: params.pageSize,
                personId: row.personId
            };
            return temp;
        },
        //格式化返回参数
        responseHandler: function (res) {
            if (res) {
                return {
                    "total": res.total,//总页数
                    "rows": res.rows   //数据
                };
            } else {
                return {
                    "total": 0,//总页数
                    "rows": []   //数据
                };
            }
        },
        columns: [
            {
                title: '信息类型',
                field: 'situationType'
            },
            {
                title: '描述',
                field: 'memo'
            },
            {
                title: '时间',
                field: 'talkDate'
            }
        ]
    });
}

