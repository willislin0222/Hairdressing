package com.schedule.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.offer.model.OfferService;
import com.offer.model.OfferVO;

import java.util.*;

public class ScheduleServlet extends HttpServlet {
   
    
    Timer timer;
    int i=0;      
   
    public void init() throws ServletException {
      TimerTask task = new TimerTask(){ 
	        public void run() {
	        	OfferService offerSvc = new OfferService();
	        	List<OfferVO> list = offerSvc.getofferBYtoday();
	        	for(OfferVO offerVO : list){
	        		offerVO.setOff_status(0);
	        		offerSvc.updateOffer(offerVO);
	        		System.out.println(offerVO.getOff_title() + "優惠已結束");
	        	}
	        } 
      };
      timer = new Timer(); 
      Calendar cal = new GregorianCalendar(2017, Calendar.DECEMBER, 20, 23, 59, 00);//年月日時份秒
      timer.scheduleAtFixedRate(task, cal.getTime(), 24*60*60*1000);
      System.out.println("已建立排程!");       
    }
    

    public void doGet(HttpServletRequest req, HttpServletResponse res)
                               throws ServletException, IOException {
    }                           	

    public void destroy() {
        timer.cancel();
        System.out.println("已移除排程!");
    }
    
}