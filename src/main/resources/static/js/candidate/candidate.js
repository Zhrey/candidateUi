$(function () {
    //查询
    $("#searchbtn").on('click', function () {
        initTable();
    });

    //初始化表格
    initTable();
});

function initTable() {
    $("#resumeTable").bootstrapTable('destroy');
    $('#resumeTable').bootstrapTable({
        url: 'candidate/searchCandidate',
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
        columns: [
            {
                field: 'id',
                title: 'id',
                visible: false
            },
            {
                field: 'name',
                title: '候选人姓名'
            },
            {
                title: '性别',
                field: 'sex'
            },
            {
                title: '工作年限',
                field: 'workingTime'
            },
            {
                title: '出生日期',
                field: 'birthday'
            },
            {
                title: '联系方式',
                field: 'mobile'
            },
            {
                title: '邮箱',
                field: 'mail'
            },
            {
                title: '学历',
                field: 'maxEducation'
            },
            {
                title: '学校',
                field: 'school'
            },
            {
                title: '专业',
                field: 'major'
            },
            {
                title: '当前居住',
                field: 'currentAddress'
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

    return '<button type="button" class="btn btn-primary btn-xs" id="detail">详情</button>' +
    '<button type="button" class="btn btn-primary btn-xs" id="edit" style="margin-left: 5px">编辑</button>';
}

//下载、删除  按钮功能
window.operateEvents = {
    "click #detail": function (e, vlaue, row) {
    },
    "click #edit": function (e, vlaue, row) {
    }
};

