package com.blog.model;

import java.util.List;

public interface BlogDAO {
	
	public abstract BlogVO selectByPost(String postNo);
	
	public abstract List<BlogVO> selectByIndex(int index, String postType);
	
	public abstract List<BlogVO> selectByMember(String memberId);
	
	public abstract List<BlogVO> selectByViews();
	
	public abstract boolean insertPost(BlogVO bean);
	
	public abstract boolean deletePost(java.util.Date date,String flag,String postNo);

	public abstract boolean updatePost();
	
	public abstract boolean updateViewAmount(String postNo);
	
	public abstract boolean updateAvgScore(double score, String postNo);
	public List<BlogVO> selectAll();
	public List<BlogVO> selectByFlagReport(int page);
	public boolean reportChange(String flag, String postNo);
	public List<BlogVO> selectByFlagDelete(int page);
	public boolean delete(String postNo);
	
}
