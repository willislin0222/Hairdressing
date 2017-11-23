package com.page.model;

import java.util.List;

public class PageBean {

	 private List<?> list; //根據hql從數據庫分頁查詢出來的list集合
	    
	    private int allRows; //總記錄數
	    
	    private int totalPage; //總頁數
	    
	    private int currentPage; //當前頁數

	    public List<?> getList() {
			return list;
		}

		public void setList(List<?> list) {
			this.list = list;
		}

		public int getAllRows()
	    {
	        return allRows;
	    }

	    public void setAllRows(int allRows)
	    {
	        this.allRows = allRows;
	    }

	    public int getTotalPage()
	    {
	        return totalPage;
	    }

	    public void setTotalPage(int totalPage)
	    {
	        this.totalPage = totalPage;
	    }

	    public int getCurrentPage()
	    {
	        return currentPage;
	    }

	    public void setCurrentPage(int currentPage)
	    {
	        this.currentPage = currentPage;
	    }
	    
	    /**
	     * 得到總頁數
	     * @param pageSize 每頁記錄數
	     * @param allRows  總記錄數
	     * @return 總頁數
	     */
	    public int getTotalPages(int pageSize, int allRows)
	    {
	        int totalPage = (allRows % pageSize == 0)? (allRows / pageSize): (allRows / pageSize) + 1;
	        
	        return totalPage;
	    }
	    
	    /**
	     * 得到當前開始記錄號
	     * @param pageSize 每頁記錄數
	     * @param currentPage 總記錄數
	     * @return
	     */
	    public int getCurrentPageOffset(int pageSize, int currentPage)
	    {
	        int offset = pageSize * (currentPage - 1);
	        
	        return offset;
	    }
	    
	    /**
	     * 得到當前頁， 如果為0 則開始第一頁，否則為當前頁
	     * @param page
	     * @return
	     */
	    public int getCurPage(int page)
	    {
	        int currentPage = (page == 0)? 1: page;
	        
	        return currentPage;
	    }
}
