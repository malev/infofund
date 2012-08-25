$(function () {
  var chart;
  $(document).ready(function() {
    var $fund1 = $("#fund0");
    var $fund2 = $("#fund1");
    var options = {
      container: $fund1.data("container"),
      title: $fund1.data("title"),
      xserie: $fund1.data("xserie"),
      dailyVariation: $fund1.data("daily-variation"),
      valueAtDate: $fund1.data("value-at-date")
    };
    chart1 = new Highcharts.Chart({
      chart: {
        renderTo: options.container,
        zoomType: 'xy'
      },
      title: {
        text: options.title
      },
      xAxis: [{
        categories: options.xserie
      }],
      yAxis: [{
        labels: {
          style: {
            color: '#89A54E'
          }
        },
        title: {
          text: 'Value at date',
          style: {
            color: '#89A54E'
          }
        },
        opposite: true
      },{
        title: {
          text: 'Daily variation',
          style: {
            color: '#4572A7'
          }
        },
        labels: {
          style: {
            color: '#4572A7'
          }
        }
      }],
      tooltip: {
        formatter: function() {
          return ''+ this.x +': '+ this.y;
        }
      },
      series: [{
        name: 'Daily variation',
        color: '#4572A7',
        type: 'spline',
        yAxis: 1,
        data: options.dailyVariation
      },{
        name: 'Value at date',
        color: '#89A54E',
        type: 'spline',
        data: options.valueAtDate
      }]
    });
    chart2 = new Highcharts.Chart({
      chart: {
        renderTo: $fund2.data("container"),
        zoomType: 'xy'
      },
      title: {
        text: $fund2.data("title")
      },
      xAxis: [{
        categories: $fund2.data("xserie")
      }],
      yAxis: [{
        labels: {
          style: {
            color: '#89A54E'
          }
        },
        title: {
          text: 'Value at date',
          style: {
            color: '#89A54E'
          }
        },
        opposite: true
      },{
        title: {
          text: 'Daily variation',
          style: {
            color: '#4572A7'
          }
        },
        labels: {
          style: {
            color: '#4572A7'
          }
        }
      }],
      tooltip: {
        formatter: function() {
          return ''+ this.x +': '+ this.y;
        }
      },
      series: [{
        name: 'Daily variation',
        color: '#4572A7',
        type: 'spline',
        yAxis: 1,
        data: $fund2.data("daily-variation")
      },{
        name: 'Value at date',
        color: '#89A54E',
        type: 'spline',
        data: $fund2.data("value-at-date")
      }]
    });
  });
});
