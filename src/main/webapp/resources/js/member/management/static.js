var data = [
  ['평균', '평점',{ role: 'style' }],
  ['월', 0,'b22222'],
  ['월', 0,'b22222'],
  ['월', 0,'b22222'],
  ['월', 0,'b22222'],
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

window.addEventListener("load",function(){
	var selects = document.querySelector(".select");
	
	var select = selects.value;
	var option = document.getElementById("options").options[document.getElementById("options").selectedIndex];
	var a = option.value;
	var optionValue = parseInt(a);
	//alert(a);
	 var xml = new XMLHttpRequest();
     xml.open('POST', 'sendStatic', true);
     xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
     xml.send("optionValue="+optionValue);
	 xml.onload=function(){
		
		var arr = JSON.parse(xml.responseText);
		var table = document.querySelector(".table");
		var thead = table.querySelector(".thead");
		var tbody = table.querySelector(".tbody");
		var tr1 = thead.querySelector(".tr1");
		var tr2 = tbody.querySelector(".tr2");
		
		
		data[1][0]= arr[0][0];
		data[1][1] = arr[0][1];
		for(var i=1;i<=arr.length;i++){
			data[i][0]=arr[i-1][0]+'월';
			data[i][1]=arr[i-1][1];
			
			var th = document.createElement('th');
			var td = document.createElement('td');
			td.classList.add('td');
			var thInput = document.createTextNode(data[i][0]);
			var tdInput = document.createTextNode(data[i][1]);
			
			th.appendChild(thInput);
			td.appendChild(tdInput);
			tr1.appendChild(th);
			tr2.appendChild(td);
		}
		  var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
		  chart.draw(google.visualization.arrayToDataTable(data), options);
	}
	
	selects.addEventListener("change",function(e){
		var select = e.target.nodeName;
		var option = document.getElementById("options").options[document.getElementById("options").selectedIndex];
		var a = option.value
		var optionValue = parseInt(a);
		//alert(a);
		 var xml = new XMLHttpRequest();
         xml.open('POST', 'sendStatic', true);
         xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
         xml.send("optionValue="+optionValue);
         xml.onload=function(){
     		
     		var arr = JSON.parse(xml.responseText);
     		var table = document.querySelector(".table");
     		var thead = table.querySelector(".thead");
     		var tbody = table.querySelector(".tbody");
     		//var tr1 = thead.querySelector(".tr1");
     		var tr2 = tbody.querySelector(".tr2");
     		//var td = document.querySelectorAll(".td");
     		var td1 = tr2.querySelectorAll('td');
     		alert(td1[0].innerText);
     		
     		data[1][0]= arr[0][0];
     		data[1][1] = arr[0][1];
     		for(var i=1;i<=arr.length;i++){
     			data[i][0]=arr[i-1][0]+'월';
     			data[i][1]=arr[i-1][1];

     			td1[i].innerText=data[i][1];
     		
     		}
     		  var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
     		  chart.draw(google.visualization.arrayToDataTable(data), options);
     	}
	});
});


