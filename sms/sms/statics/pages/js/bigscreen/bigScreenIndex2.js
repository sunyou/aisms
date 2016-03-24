/** 定义图表变量*/
var chart1;
var chart2;
var chart3;
var chart4;
var chart5;
var chart6;




$(function () {



    //样式
    Highcharts.setOptions(Highcharts.theme);
    // 初始化生成报表
    initReport();
    // 查询报表数据
    //loadReportData();
    setInterval('showDate()',1000);
});

function showTitle(){
    $(".menu").slideDown(500);
    $("#jyfxShowTitle").slideDown(500);


}

function hideTitle(){
    $(".menu").slideUp(500);
    $("#jyfxShowTitle").slideUp(500);

}

function showDate(){
    var mydate = new Date();
    var t=mydate.toLocaleString();
    $("#time").text(t);

}
var t=2;
function showTime()
{
    if(t==0||t==1){
        setTab('two',1,2);
        initReport();
        doQuery2();
        t=2;

    }else{
        setTab('two',2,2);
        initReport1();
        doQuery3();
        t=1;
    }
}
/** 生成报表*/
function initReport(){

    chart1 = new Highcharts.Chart({				   //new 一个chart对象
        chart: {
            renderTo: 'chart1',				   //图表的页面显示器
            type: 'bar',
            backgroundColor: 'rgba(0,0,0,0)'   //指定图表的类型，默认是折线图（line）
        },
        xAxis: {
            categories: ['三级', '二级', '一级'],
            title: {
                text: '机构级别'
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: '违规事件数量',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        title: {
            text: ''     	   //指定图表标题
        },
        series: [{
            name: '违规事件数',
            data: [6784,4986,3295]
        }]
    });


    chart2 = new Highcharts.Chart({

        chart: {
            renderTo: 'chart2',
            type: 'bubble',
            plotBorderWidth: 1,
            zoomType: 'xy',
            backgroundColor: 'rgba(0,0,0,0)'
        },

        title: {
            text: ''
        },

        xAxis: {
            gridLineWidth: 1,
            title: {
                text: '数量占比（%）'
            }
        },

        yAxis: {
            startOnTick: false,
            endOnTick: false,
             title: {
                 text: '处分金额'
             }
        },

        series: [{
            name:'大处方',
            data: [
                [12.37,200,600],
                    [18.03,300,450],
                    [25.77,400,520],
                    [23.77,510,102],
                    [21.77,600,360],
                    [25.77,760,620],
                    [4.51,800,623 ],
                    [1.31,1000,136]
            ],
            marker: {
                fillColor: {
                    radialGradient: { cx: 0.4, cy: 0.3, r: 0.7 },
                    stops: [
                        [0, 'rgba(255,255,255,0.5)'],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0.5).get('rgba')]
                    ]
                }
            }
        }]

    });


    /*chart2 = new Highcharts.Chart({			   //new 一个chart对象
        chart: {
            type:'pie',
            renderTo: 'chart2',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            },
            backgroundColor: 'rgba(0,0,0,0)'
        },
        title: {
            text: ''
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true,
                depth: 25
            }
        },
        series: [{
            type: 'pie',
            name: '占比',
            data: [
                ['超量用药',3092],
                ['重复用药',1875],
                ['适应性不当用药',986],
                ['目录外用药',2128],
                ['滥用抗菌药物',1093]
            ]
        }]
    });
*/

    chart3 = new Highcharts.Chart({				   //new 一个chart对象
        chart: {
            renderTo: 'chart3',
            type: 'line',
            backgroundColor: 'rgba(0,0,0,0)'
        },
        title: {
            text: ''
        },
        xAxis: {
            title:{ text:'月份'},
            categories: ['Jun-15','Jul-15', 'Aug-15', 'Sep-15', 'Oct-15', 'Nov-15', 'Dec-15']

        },
        yAxis: {
            title: {
                text: '事件数量'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: [{
            name: '事件数量',
            data: [10784, 11894, 10103,9728, 8694, 6278, 2983]
        }
        ]
    });


    chart4 = new Highcharts.Chart({				   //new 一个chart对象
        chart: {
            renderTo: 'chart4',				   //图表的页面显示器
            type: 'column',                          //指定图表的类型，默认是折线图（line）
            backgroundColor: 'rgba(0,0,0,0)',
        },
        title: {
            text: ''      	   //指定图表标题
        },
        xAxis: {
            categories: ['正高','正高','中级','初级'],
            title: {
                text: '职称'
            }
        },
        yAxis: [{
            title: {
                text: '发病人次数'                  //指定y轴的标题
            }
        }],
        series: [{
            type: 'column',
            name: '发病人次数',
            data: [356,762,1035,294]
        }]
    });

    chart5 = new Highcharts.Chart({				   //new 一个chart对象
        chart: {
            renderTo: 'chart5',				   //图表的页面显示器
            type: 'line' ,                          //指定图表的类型，默认是折线图（line）
            backgroundColor: 'rgba(0,0,0,0)'
        },
        title: {
            text: ''      	   //指定图表标题
        },

        xAxis: {
            categories: ['Jun-15','Jul-15','Aug-15','Sep-15','Oct-15','Nov-15','Dec-15'],
            title: {
                text: '月份'
            }
        },
        yAxis: [{
            title: {
                text: '涉案金额（万元）'                  //指定y轴的标题
            }
        },{
            title: {
                text: '环比增长率'                  //指定y轴的标题
            },
            labels: {
                format: '{value} %',
                style: {
                    color: '#4572A7'
                }
            },
            opposite: true
        }],

            series: [{
            type: 'column',
            name: '涉案金额',data: [528.37,569.81,586.58,550.21,509.07,448.77,318.56]
        }, {
            name: '环比增长率',
            yAxis: 1,
            tooltip: {
                valueSuffix: ' %'
            },

            data: [12.35,7.84,2.94,-6.20,-7.48,-11.85,-29.01]
        }]
    });

    chart6 = new Highcharts.Chart({				   //new 一个chart对象
        chart: {
            renderTo: 'chart6',				   //图表的页面显示器
            type: 'area'  ,                         //指定图表的类型，默认是折线图（line）
            backgroundColor: 'rgba(0,0,0,0)'
        },
        title: {
            text: ''      	   //指定图表标题
        },

        xAxis: {
            categories: ['0~12','12~25','25~45','45~65','65岁以上'],
            title: {
                text: '年龄段'
            }
        },
        yAxis: [{
            title: {
                text: '人次数'                  //指定y轴的标题
            }
        }],
            series: [{
            name: '年龄段', data: [536,1201,1896,3021,2289]
        }]
    });


}

/** 方式二 - 当前方式 - 取报表数据源*/
function loadReportData(){
    /*//取查询条件
     var queryString = $('#searchForm').serialize();
     $.get("bigscreen/BigscreenAction!highChartsJson.action?"+queryString,function(data){
     var result=$.parseJSON(data);
     //门急诊费用
     chart1.series[0].setData(result.mjzfy);
     chart1.series[1].setData(result.mjzfyTb);
     chart1.series[2].setData(result.mjzfyHb);
     chart1.xAxis[0].setCategories(result.mjzfyX);
     //门急诊费用来源情况
     chart2.series[0].setData(result.mjzfylyqk);
     //门急诊费用占比情况
     chart3.series[0].setData(result.mjzfyzbqkY);
     chart3.xAxis[0].setCategories(result.mjzfyzbqkX);
     //门急诊人次
     chart4.series[0].setData(result.mjzrc);
     chart4.series[1].setData(result.mjzrcTb);
     chart4.series[2].setData(result.mjzrcHb);
     chart4.xAxis[0].setCategories(result.mjzfyX);

     //门急诊均次费用
     chartMjzjcfy.series[0].setData(result.mjzjcfy);
     chartMjzjcfy.series[1].setData(result.mjzjcfytb);
     chartMjzjcfy.series[2].setData(result.mjzjcfyhb);
     chartMjzjcfy.xAxis[0].setCategories(result.mjzfyX);

     //发病人次数前十名疾病诊断分析
     chartFbrcqs.xAxis[0].setCategories(result.brrcqsX);
     chartFbrcqs.series[0].setData(result.mzbls);
     });

     $.get("bigscreen/queryYpfy!highChartsJsonMjz.action?"+queryString,function(data){
     var result=$.parseJSON(data);
     //门急诊药品总费用
     chartMjzYpZfy.series[0].setData(result.mjzfyZfy);
     chartMjzYpZfy.series[1].setData(result.mjzfyZb);
     chartMjzYpZfy.series[2].setData(result.mjzfyHb);
     chartMjzYpZfy.series[3].setData(result.mjzfyTb);
     chartMjzYpZfy.xAxis[0].setCategories(result.mjzfyX);

     //门急诊抗菌药使用情况分析
     chartMjzKjySyfx.series[0].setData(result.mjzZyRc);
     chartMjzKjySyfx.series[1].setData(result.zyKjySyRc);
     chartMjzKjySyfx.series[2].setData(result.zyKjySyl);
     chartMjzKjySyfx.series[3].setData(result.zyKjySylHb);
     chartMjzKjySyfx.series[4].setData(result.zyKjySylTb);
     chartMjzKjySyfx.xAxis[0].setCategories(result.mjzKjyfyX);

     });

     $.get("tjfx/showClinicAnalys!highChartsJsonMz.action?"+queryString, function (data) {
     var result = $.parseJSON(data);
     //门诊基药处方使用率分析
     chartMzjycfsylfx.series[0].setData(result.mzcfs);
     chartMzjycfsylfx.series[1].setData(result.mzjycfs);
     chartMzjycfsylfx.series[2].setData(result.mzjycfsyl);
     chartMzjycfsylfx.series[3].setData(result.mzjyhb);
     chartMzjycfsylfx.series[4].setData(result.mzjytb);
     chartMzjycfsylfx.xAxis[0].setCategories(result.mzjycfsylfxOrg);
     //门诊基药费用率分析
     chartMzjyfylfx.series[0].setData(result.mzjyje);
     chartMzjyfylfx.series[1].setData(result.mzjyfyl);
     chartMzjyfylfx.series[2].setData(result.mzjyfyhb);
     chartMzjyfylfx.series[3].setData(result.mzjyfytb);
     chartMzjyfylfx.xAxis[0].setCategories(result.mzjyfylfxOrg);

     });

     $.get("bigscreen/queryYpfy!highChartsJsonKjy.action?"+queryString,function(data){
     var result=$.parseJSON(data);
     chartMjzKjyFyfx.series[0].setData(result.mjzfKjyJe);
     chartMjzKjyFyfx.series[1].setData(result.mjzYfyl);
     chartMjzKjyFyfx.series[2].setData(result.mjzfyHb);
     chartMjzKjyFyfx.series[3].setData(result.mjzfyTb);
     chartMjzKjyFyfx.xAxis[0].setCategories(result.mjzfyX);
     });

     $.get("bigscreen/BigscreenAction!highChartsJson3.action?"+queryString,function(data){
     var result=$.parseJSON(data);
     //药品用量前十名
     containerTop10.xAxis[0].setCategories(result.drugNameX);
     containerTop10.series[0].setData(result.drugNum);
     });*/


}

function setTab(name,cursel,n){
    $(".current").removeClass("current");
    for(i=1;i<=n;i++){
        var menu=document.getElementById(name+i);
        var con=document.getElementById("con_"+name+"_"+i);
        var aa=$("#a"+i);
        //menu.className=i== cursel ? "hover" : "";
        con.style.display=i== cursel ? "block" : "none";
        if(i==cursel){
            aa.addClass("current");
        }
    }
}
/**
 * Dark blue theme for Highcharts JS
 * @author Torstein Honsi
 */

Highcharts.theme = {
    colors: ["#008080", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
        "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
    chart: {
        backgroundColor: {
            linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
            stops: [
                [0, 'rgb(48, 48, 96)'],
                [1, 'rgb(0, 0, 0)']
            ]
        },
        borderColor: '',
        borderWidth: 2,
        className: 'dark-container',
        plotBackgroundColor: 'rgba(255, 255, 255, .1)',
        plotBorderColor: '#CCCCCC',
        plotBorderWidth: 1
    },
    title: {
        style: {
            color: '#C0C0C0',
            font: 'bold 16px "Trebuchet MS", Verdana, sans-serif'
        }
    },
    subtitle: {
        style: {
            color: '#666666',
            font: 'bold 8px "Trebuchet MS", Verdana, sans-serif'
        }
    },
    xAxis: {
        gridLineColor: '#333333',
        gridLineWidth: 1,
        labels: {
            style: {
                color: '#A0A0A0'
            }
        },
        lineColor: '#A0A0A0',
        tickColor: '#A0A0A0',
        title: {
            style: {
                color: '#CCC',
                fontWeight: 'bold',
                fontSize: '8px',
                fontFamily: 'Trebuchet MS, Verdana, sans-serif'

            }
        }
    },
    yAxis: {
        gridLineColor: '#333333',
        labels: {
            style: {
                color: '#A0A0A0'
            }
        },
        lineColor: '#A0A0A0',
        minorTickInterval: null,
        tickColor: '#A0A0A0',
        tickWidth: 1,
        title: {
            style: {
                color: '#CCC',
                fontWeight: 'bold',
                fontSize: '8px',
                fontFamily: 'Trebuchet MS, Verdana, sans-serif'
            }
        }
    },
    tooltip: {
        backgroundColor: 'rgba(0, 0, 0, 0.75)',
        style: {
            color: '#F0F0F0'
        }
    },
    toolbar: {
        itemStyle: {
            color: 'silver'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                color: '#CCC'
            },
            marker: {
                lineColor: '#333'
            }
        },
        spline: {
            marker: {
                lineColor: '#333'
            }
        },
        scatter: {
            marker: {
                lineColor: '#333'
            }
        },
        candlestick: {
            lineColor: 'white'
        }
    },
    legend: {
        itemStyle: {
            font: '9pt Trebuchet MS, Verdana, sans-serif',
            color: '#A0A0A0'
        },
        itemHoverStyle: {
            color: '#FFF'
        },
        itemHiddenStyle: {
            color: '#444'
        }
    },
    credits: {
        style: {
            color: '#666'
        }
    },
    labels: {
        style: {
            color: '#CCC'
        }
    },

    navigation: {
        buttonOptions: {
            symbolStroke: '#DDDDDD',
            hoverSymbolStroke: '#FFFFFF',
            theme: {
                fill: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0.4, '#606060'],
                        [0.6, '#333333']
                    ]
                },
                stroke: '#000000'
            }
        }
    },

    // scroll charts
    rangeSelector: {
        buttonTheme: {
            fill: {
                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                stops: [
                    [0.4, '#888'],
                    [0.6, '#555']
                ]
            },
            stroke: '#000000',
            style: {
                color: '#CCC',
                fontWeight: 'bold'
            },
            states: {
                hover: {
                    fill: {
                        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                        stops: [
                            [0.4, '#BBB'],
                            [0.6, '#888']
                        ]
                    },
                    stroke: '#000000',
                    style: {
                        color: 'white'
                    }
                },
                select: {
                    fill: {
                        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                        stops: [
                            [0.1, '#000'],
                            [0.3, '#333']
                        ]
                    },
                    stroke: '#000000',
                    style: {
                        color: 'yellow'
                    }
                }
            }
        },
        inputStyle: {
            backgroundColor: '#333',
            color: 'silver'
        },
        labelStyle: {
            color: 'silver'
        }
    },

    navigator: {
        handles: {
            backgroundColor: '#666',
            borderColor: '#AAA'
        },
        outlineColor: '#CCC',
        maskFill: 'rgba(16, 16, 16, 0.5)',
        series: {
            color: '#7798BF',
            lineColor: '#A6C7ED'
        }
    },

    scrollbar: {
        barBackgroundColor: {
            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
            stops: [
                [0.4, '#888'],
                [0.6, '#555']
            ]
        },
        barBorderColor: '#CCC',
        buttonArrowColor: '#CCC',
        buttonBackgroundColor: {
            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
            stops: [
                [0.4, '#888'],
                [0.6, '#555']
            ]
        },
        buttonBorderColor: '#CCC',
        rifleColor: '#FFF',
        trackBackgroundColor: {
            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
            stops: [
                [0, '#000'],
                [1, '#333']
            ]
        },
        trackBorderColor: '#666'
    },

    // special colors for some of the
    legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
    background2: 'rgb(35, 35, 70)',
    dataLabelsColor: '#444',
    textColor: '#C0C0C0',
    maskColor: 'rgba(255,255,255,0.3)'
};


