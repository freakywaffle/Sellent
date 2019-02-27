$(function(){
	
	Highcharts.chart('container', {
	    chart: {
	        type: 'pie',
	        options3d: {
	            enabled: true,
	            alpha: 45
	        }
	    },
	    title: {
	        text: '상품 관련 현황'
	    },

	    plotOptions: {
	        pie: {
	            innerSize: 100,
	            depth: 45
	        }
	    },
	    series: [{
	        name: 'Delivered amount',
	        data: [
	            ['', 8],
	            ['Kiwi', 3],
	            ['Mixed nuts', 1],
	            ['Oranges', 6],
	            ['Apples', 8],
	            ['Pears', 4],
	            ['Clementines', 4],
	            ['Reddish (bag)', 1],
	            ['Grapes (bunch)', 1]
	        ]
	    }]
	});
	
})


