package com.test.service;

import com.test.service.Implement.VenderServiceImpl;

public class ServiceFactory {

	private static VenderService venderService = new VenderServiceImpl();
	
	public static VenderService getVenderService(){
		return venderService;
	}
	
	
}
