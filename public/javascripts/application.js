google.load("visualization", "1", {packages:["corechart"]});

function reDrawGraph(return_data){
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Date');
  data.addColumn('number', 'Daily value');
  data.addColumn('number', 'Daily variation');
  data.addRows(return_data.values);

  var options = {
    title: return_data.name
  };

  var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
  chart.draw(data, options);
}
$(document).ready(function(){
  $("select.fund_name").live("change", function () {
    var $this = $(this);
    $.get("/fund/" + $this.val(), null, reDrawGraph);
  });
});