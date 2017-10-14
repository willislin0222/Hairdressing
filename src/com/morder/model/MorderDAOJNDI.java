package com.morder.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.member.model.MemberVO;
import com.orderlist.model.OrderListVO;
import com.product.model.ProductVO;

import hibernate.util.HibernateUtil;

public class MorderDAOJNDI implements MorderDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Hair");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = 
			  "INSERT INTO MORDER (MORD_no, MEM_NO, MORD_PRICE, MORD_CREATEDATE, MORD_STATUS)"
			+ "VALUES (MORD_seq.nextval, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = 
			  "UPDATE MORDER SET MEM_NO = ?, MORD_PRICE = ?, MORD_CREATEDATE = ?, MORD_STATUS = ? WHERE MORD_no = ?";
	private static final String FIND_BY_PK = "SELECT * FROM MORDER WHERE MORD_no = ?";
	private static final String GET_ALL = "SELECT * FROM MORDER";

	
	@Override
	public void insert(MorderVO morderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, morderVO.getMemberVO().getMem_no());
			pstmt.setInt(2, morderVO.getMord_price());
			pstmt.setDate(3, morderVO.getMord_createdate());
			pstmt.setInt(4, morderVO.getMord_status());
			
			pstmt.executeUpdate();

		} catch (SQLException se){
			throw new RuntimeException("A database error occured. " + se.getMessage());
			
		} finally {
			if(pstmt != null){
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
			
		}
		
	}

	@Override
	public void update(MorderVO morderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, morderVO.getMemberVO().getMem_no());
			pstmt.setInt(2, morderVO.getMord_price());
			pstmt.setDate(3, morderVO.getMord_createdate());
			pstmt.setInt(4, morderVO.getMord_status());
			pstmt.setString(5, morderVO.getMord_no());
			
			pstmt.executeUpdate();

		} catch (SQLException se){
			throw new RuntimeException("A database error occured. " + se.getMessage());
			
		} finally {
			if(pstmt != null){
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
			
		}
		
	}

	@Override
	public void delete(String mord_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			MorderVO morderVO = (MorderVO) session.get(MorderVO.class, mord_no);
			session.delete(morderVO);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public MorderVO findByPrimarykey(String mord_no) {
		MorderVO morderVO = new MorderVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_PK);
			
			pstmt.setString(1, mord_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				morderVO.setMord_no(rs.getString("mord_no"));
				
				MemberVO memberVO = new MemberVO();
				memberVO.setMem_no(rs.getString("mem_no"));
				morderVO.setMemberVO(memberVO);
				morderVO.setMord_price(rs.getInt("mord_price"));
				morderVO.setMord_createdate(rs.getDate("mord_createdate"));
				morderVO.setMord_status(rs.getInt("mord_status"));
	
			}

		} catch (SQLException se){
			throw new RuntimeException("A database error occured. " + se.getMessage());
			
		} finally {
			if( rs != null ){
				try {
					rs.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			
			if( pstmt != null ){
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			
			if ( con != null ) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
			
		}
		
		return morderVO;
	}

	@Override
	public List<MorderVO> getAll() {
		List<MorderVO> MorderList = new ArrayList<>();
		MorderVO morderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				morderVO = new MorderVO();
				morderVO.setMord_no(rs.getString("mord_no"));
				MemberVO memberVO = new MemberVO();
				memberVO.setMem_no(rs.getString("mem_no"));
				morderVO.setMemberVO(memberVO);
				morderVO.setMord_price(rs.getInt("mord_price"));
				morderVO.setMord_createdate(rs.getDate("mord_createdate"));
				morderVO.setMord_status(rs.getInt("mord_status"));
				
				MorderList.add(morderVO);
			}

		} catch (SQLException se){
			throw new RuntimeException("A database error occured. " + se.getMessage());
			
		} finally {
			if( rs != null ){
				try {
					rs.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			
			if( pstmt != null ){
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			
			if ( con != null ) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
			
		}
		return MorderList;
		
	}



}
