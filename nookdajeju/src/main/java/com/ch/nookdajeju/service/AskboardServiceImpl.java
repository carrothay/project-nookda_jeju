package com.ch.nookdajeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.nookdajeju.dao.AskboardDao;
import com.ch.nookdajeju.model.Askboard;

@Service
public class AskboardServiceImpl implements AskboardService {
	@Autowired
	private AskboardDao ad;

	@Override
	public int insert(Askboard askboard) {
		return ad.insert(askboard);
	}

	@Override
	public List<Askboard> list(int startRow, int endRow) {
		return ad.list(startRow, endRow);
	}

	@Override
	public int getTotal(Askboard askboard) {
		return ad.getTotal(askboard);
	}

	@Override
	public int maxNum() {
		return ad.maxNum();
	}
	
	@Override
	public void updateReadCount(int askno) {
		ad.updateReadCount(askno);
	}

	@Override
	public Askboard select(int askno) {
		return ad.select(askno);
	}

	@Override
	public int update(Askboard askboard) {
		return ad.update(askboard);
	}

	@Override
	public int delete(int askno) {
		return ad.delete(askno);
	}

	@Override
	public void updateRe_step(Askboard askboard) {
		ad.updateRe_step(askboard);
	}

}
