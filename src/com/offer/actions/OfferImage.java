package com.offer.actions;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.offer.model.OfferService;
import com.offer.model.OfferVO;

public class OfferImage extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

			try {
				String off_no=req.getParameter("off_no");
				OfferService offerSve = new OfferService();
				OfferVO offerVO = offerSve.getOneOffer(off_no);
				byte[] buf = offerVO.getOff_image();
				out.write(buf);
	
			} catch (Exception e) {
				InputStream in = getServletContext().getResourceAsStream("/images/nopic.jpg");
				byte[] buf = new byte[in.available()];
				in.read(buf);
				out.write(buf);
				in.close();
			}

	}
}
