//先拿到目前的時間
	startday = new Date();
	clockStart = startday.getTime();
	function initStopwatch() 
		{ 
			var myTime = new Date(); 
			var timeNow = myTime.getTime(); 
			var timeDiff = timeNow - clockStart; //現在的時間和起始的時間相減得到已經過的時間
			this.diffSecs = timeDiff/1000; //除以1000就是秒
			return(this.diffSecs); //將差異秒數回傳給getSecs函數
		} 
	function getSecs() 
		{ 
		var mySecs = initStopwatch(); 
		var mySecs1 = ""+mySecs; //將數字變成文字
		mySecs1= 5 - eval(mySecs1.substring(0,mySecs1.indexOf("."))) + "秒"; //算出倒數的時間
		document.form1.timespent.value = mySecs1; //將倒數時間顯示在頁面空隔中
		window.setTimeout('getSecs()',1000); //每1秒重新執行一次
	}