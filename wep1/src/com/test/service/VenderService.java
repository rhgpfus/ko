package com.test.service;

import java.util.List;

import com.test.DTO.VenderInfo;


public interface VenderService {

	public VenderInfo selectVender(VenderInfo vi);
	
	public List<VenderInfo> selectVenderList(VenderInfo vi);
	
	public int getTotalCount(VenderInfo vi);
	
	public int insertVender(VenderInfo vi);
	
	public int deleteVender(VenderInfo vi);
	
	public int updateVender(VenderInfo vi);
}
