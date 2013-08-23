google.load("visualization", "1", {packages:["corechart"]});
function drawChart(credit, debt) {
    var data = google.visualization.arrayToDataTable([
        ['Category', 'Value'],
        ['Credit',     credit],
        ['Debt',    debt]
    ]);

    var options = {
        is3D: true,
        legend: {position: 'none'}
    };

    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}
//google.setOnLoadCallback(drawChart);
