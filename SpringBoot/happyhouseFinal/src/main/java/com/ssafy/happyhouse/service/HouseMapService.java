package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.HouseMapDao;
import com.ssafy.happyhouse.dto.HouseDealDto;

@Service
public class HouseMapService {

	@Autowired
	HouseMapDao dao;

	public List<HouseDealDto> getAptInDong(String dong) throws Exception {
		return dao.getAptInDong(dong);
	}

	public List<HouseDealDto> getAptSearch(String[] info) throws Exception {
//		return dao.getAptSearch(aptName);
//		System.out.println("service1 " + info[0]);
//		System.out.println("service2 " + info[1]);
		return dao.getAptSearch(info);
	}

	public HouseDealDto getDetail(String aptName, String dongCode) throws Exception {
		return dao.getDetail(aptName, dongCode);
	}

}
