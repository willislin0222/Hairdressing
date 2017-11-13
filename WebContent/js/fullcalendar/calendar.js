$(document).ready(function() {
	var memno = $("#memno").val();
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next,today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		editable: true,
		selectable: true,
		selectHelper: true,
		select: function(start, end) {
			$('#calendar').fullCalendar('unselect');
			var date = new Date(start);
			var day = (date.getUTCDate()<10 ? '0' : '')+date.getUTCDate();  //設定取出日期為兩位數(使用三源運算子)
			var month = ("0" + (date.getUTCMonth() + 1)).slice(-2); //設定取出月份為兩位數(使用slice(-2)涵式補位)
			var year = date.getUTCFullYear();   
			var hour = date.getUTCHours();
			var minute =(date.getUTCMinutes()<10 ? '0' : '')+date.getUTCMinutes(); //設定取出分鐘為兩位數(使用三源運算子)
			var resdate = year + "-" + month + "-" + day;
			$("#resdate").val(resdate);	     //利用jquery設定預約日期值
			if(hour != 0 && hour>0){
				$("#timestart").val(hour + ":" + minute);	     //利用jquery設定預約開始時間(如果有點選時間);
			}else{
				$("#timestart").val("");	     //利用jquery清除預約開始時間(沒有點選時間);
			}
			$("#resdata").click();	     //利用jquery執行onclick函式，用於彈跳出預約的表單
		},
		editable: true,
		eventLimit: true, // allow "more" link when too many events	
		theme:true,
		height:800,
		firstDay:0,
//		events:  "/Hairdressing/reservation/events.json",	
//		events:  "/Hairdressing/reservation/actions/getReservationsByMemno.action?mem_no="+ memno,	
		eventSources:[
				function(start, end, timezone, callback) {
			        $.ajax({
			            url: 'reservation/actions/getAllReservations.action',
			            dataType: 'json',
			            success: function(result) {
			                var events = [];
			                result.forEach(function(element) {
			                    events.push({
			                        title: element.title,
			                        start: moment(element.start).format('YYYY-MM-DD'), 
			                    });
			                });
	
			                callback(events);
			            }
			        });
				},
				function(start1, end1, timezone1, callback1) {
			        $.ajax({
			            url: '/Hairdressing/dayoff/actions/getAllDayoffs.action',
			            dataType: 'json',
			            success: function(result) {
			                var events = [];
			                result.forEach(function(element) {
			                    events.push({
			                        title: element.title,
			                        start: moment(element.start).format('YYYY-MM-DD'), 
			                        color: "red" 
			                    });
			                });
	
			                callback1(events);
			            }
			        });
				}
		]
	});	
	
});






