// Set new default font family and font color to mimic Bootstrap's default styling
(Chart.defaults.global.defaultFontFamily = "Nunito"),
'-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#858796";

function number_format(number, decimals, dec_point, thousands_sep) {
    // *     example: number_format(1234.56, 2, ',', ' ');
    // *     return: '1 234,56'
    number = (number + "").replace(",", "").replace(" ", "");
    var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = typeof thousands_sep === "undefined" ? "," : thousands_sep,
        dec = typeof dec_point === "undefined" ? "." : dec_point,
        s = "",
        toFixedFix = function(n, prec) {
            var k = Math.pow(10, prec);
            return "" + Math.round(n * k) / k;
        };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : "" + Math.round(n)).split(".");
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || "").length < prec) {
        s[1] = s[1] || "";
        s[1] += new Array(prec - s[1].length + 1).join("0");
    }
    return s.join(dec);
}

// chartData는 DB에 있는 값을 읽어온 것
function displayChart(chartData) {
    var ctx = document.getElementById("myBarChart");
    var myBarChart = new Chart(ctx, {
        type: "bar",
        data: {
            labels: ["월", "화", "수", "목", "금", "토", "일"],
            datasets: [{
                label: "착용 시간",
                backgroundColor: "#4e73df",
                hoverBackgroundColor: "#2e59d9",
                borderColor: "#4e73df",
                data: chartData,
            }, ],
        },
        options: {
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0,
                },
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: "day",
                    },
                    gridLines: {
                        display: false,
                        drawBorder: false,
                    },
                    ticks: {
                        maxTicksLimit: 6,
                    },
                    maxBarThickness: 25,
                }, ],
                yAxes: [{
                    ticks: {
                        // 그래프 최대 최소값 설정 가능
                        min: 0,
                        max: 24,
                        maxTicksLimit: 5,
                        padding: 10,
                        // Include a dollar sign in the ticks
                        callback: function(value, index, values) {
                            return number_format(value) + " 시간";
                        },
                    },
                    gridLines: {
                        // 목표 달성치 선 색
                        color: "rgb(234, 236, 244)",
                        zeroLineColor: "rgb(234, 236, 244)",
                        drawBorder: false,
                        borderDash: [2],
                        zeroLineBorderDash: [2],
                    },
                }, ],
            },
            legend: {
                display: false,
            },
            tooltips: {
                titleMarginBottom: 10,
                titleFontColor: "#6e707e",
                titleFontSize: 14,
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: "#dddfeb",
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                intersect: false,
                mode: "index",
                caretPadding: 10,
                callbacks: {
                    label: function(tooltipItem, chart) {
                        var datasetLabel =
                            chart.datasets[tooltipItem.datasetIndex].label || "";
                        return (
                            datasetLabel + ": " + number_format(tooltipItem.yLabel) + "시간"
                        );
                    },
                },
            },
        },
    });
}



// Bar Chart Example
// DB 값 넣어서 data 값 변경하기
// onload이벤트 쓰면 함수 실행가능하다.
// 얘를 함수화 시켜서 배열을 매개변수로 받아라
//var chartApi = {
//    displayChart: function(chartData) {
//        var ctx = document.getElementById("myBarChart");
//        var myBarChart = new Chart(ctx, {
//            type: "bar",
//            data: {
//                labels: ["월", "화", "수", "목", "금", "토", "일"],
//                datasets: [{
//                    label: "착용 시간",
//                    backgroundColor: "#4e73df",
//                    hoverBackgroundColor: "#2e59d9",
//                    borderColor: "#4e73df",
//
//                    // DB에서 착용 시간 값 불러서 넣기
//                    // data: [3, 2, 7, 8, 7, 13, 10],
//                    data: chartData,
//                }, ],
//            },
//            options: {
//                maintainAspectRatio: false,
//                layout: {
//                    padding: {
//                        left: 10,
//                        right: 25,
//                        top: 25,
//                        bottom: 0,
//                    },
//                },
//                scales: {
//                    xAxes: [{
//                        time: {
//                            unit: "day",
//                        },
//                        gridLines: {
//                            display: false,
//                            drawBorder: false,
//                        },
//                        ticks: {
//                            maxTicksLimit: 6,
//                        },
//                        maxBarThickness: 25,
//                    }, ],
//                    yAxes: [{
//                        ticks: {
//                            // 그래프 최대 최소값 설정 가능
//                            min: 0,
//                            max: 24,
//                            maxTicksLimit: 5,
//                            padding: 10,
//                            // Include a dollar sign in the ticks
//                            callback: function(value, index, values) {
//                                return number_format(value) + " 시간";
//                            },
//                        },
//                        gridLines: {
//                            // 목표 달성치 선 색
//                            color: "rgb(234, 236, 244)",
//                            zeroLineColor: "rgb(234, 236, 244)",
//                            drawBorder: false,
//                            borderDash: [2],
//                            zeroLineBorderDash: [2],
//                        },
//                    }, ],
//                },
//                legend: {
//                    display: false,
//                },
//                tooltips: {
//                    titleMarginBottom: 10,
//                    titleFontColor: "#6e707e",
//                    titleFontSize: 14,
//                    backgroundColor: "rgb(255,255,255)",
//                    bodyFontColor: "#858796",
//                    borderColor: "#dddfeb",
//                    borderWidth: 1,
//                    xPadding: 15,
//                    yPadding: 15,
//                    displayColors: false,
//                    intersect: false,
//                    mode: "index",
//                    caretPadding: 10,
//                    callbacks: {
//                        label: function(tooltipItem, chart) {
//                            var datasetLabel =
//                                chart.datasets[tooltipItem.datasetIndex].label || "";
//                            return (
//                                datasetLabel + ": " + number_format(tooltipItem.yLabel) + "시간"
//                            );
//                        },
//                    },
//                },
//            },
//        });
//    }
//}


// 혹시 모르니까 니는 주석
// var ctx = document.getElementById("myBarChart");
// var myBarChart = new Chart(ctx, {
//     type: "bar",
//     data: {
//         labels: ["월", "화", "수", "목", "금", "토", "일"],
//         datasets: [{
//             label: "착용 시간",
//             backgroundColor: "#4e73df",
//             hoverBackgroundColor: "#2e59d9",
//             borderColor: "#4e73df",

//             // DB에서 착용 시간 값 불러서 넣기
//             data: [3, 2, 7, 8, 7, 13, 10],
//         }, ],
//     },
//     options: {
//         maintainAspectRatio: false,
//         layout: {
//             padding: {
//                 left: 10,
//                 right: 25,
//                 top: 25,
//                 bottom: 0,
//             },
//         },
//         scales: {
//             xAxes: [{
//                 time: {
//                     unit: "day",
//                 },
//                 gridLines: {
//                     display: false,
//                     drawBorder: false,
//                 },
//                 ticks: {
//                     maxTicksLimit: 6,
//                 },
//                 maxBarThickness: 25,
//             }, ],
//             yAxes: [{
//                 ticks: {
//                     // 그래프 최대 최소값 설정 가능
//                     min: 0,
//                     max: 24,
//                     maxTicksLimit: 5,
//                     padding: 10,
//                     // Include a dollar sign in the ticks
//                     callback: function(value, index, values) {
//                         return number_format(value) + " 시간";
//                     },
//                 },
//                 gridLines: {
//                     // 목표 달성치 선 색
//                     color: "rgb(234, 236, 244)",
//                     zeroLineColor: "rgb(234, 236, 244)",
//                     drawBorder: false,
//                     borderDash: [2],
//                     zeroLineBorderDash: [2],
//                 },
//             }, ],
//         },
//         legend: {
//             display: false,
//         },
//         tooltips: {
//             titleMarginBottom: 10,
//             titleFontColor: "#6e707e",
//             titleFontSize: 14,
//             backgroundColor: "rgb(255,255,255)",
//             bodyFontColor: "#858796",
//             borderColor: "#dddfeb",
//             borderWidth: 1,
//             xPadding: 15,
//             yPadding: 15,
//             displayColors: false,
//             intersect: false,
//             mode: "index",
//             caretPadding: 10,
//             callbacks: {
//                 label: function(tooltipItem, chart) {
//                     var datasetLabel =
//                         chart.datasets[tooltipItem.datasetIndex].label || "";
//                     return (
//                         datasetLabel + ": " + number_format(tooltipItem.yLabel) + "시간"
//                     );
//                 },
//             },
//         },
//     },
// });