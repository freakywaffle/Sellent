var data = [
  ['평균', '평점',{ role: 'style' }],
  ['10', 3.5,'b22222'],
  ['11', 2.5,'b22222'],
  ['12', 3.5,'b22222'],
  ['01', 2.0,'b22222'],
];
var options = {

  width: 800, height: 500,
  legend: {
      maxLines: 2,
      position: 'bottom'
    },
  colors:['b22222']

};
google.load('visualization', '1.0', {'packages':['corechart']});
google.setOnLoadCallback(function() {
  var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
  chart.draw(google.visualization.arrayToDataTable(data), options);
});
