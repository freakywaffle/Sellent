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
	        text: '게시물 현황'
	    },

	    plotOptions: {
	        pie: {
	            innerSize: 0,
	            depth: 45
	        }
	    },
	    series: [{
	        name: 'Delivered amount',
	        data: [
	            ['IT개발', 7],
	            ['디자인', 3],
	            ['레슨', 0],
	            ['번역', 1],
	            ['비즈니스', 8],
	            ['영상/애니', 4],
	            ['음악', 1],
	            ['이벤트', 0],
	        ]
	    }]
	});
	
})

$(function(){
	$("tspan").css("font-weight","bold")
	$(".highcharts-credits").css("display","none")
	
})


