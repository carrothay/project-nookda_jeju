package com.ch.nookdajeju.service;

import java.util.List;

import com.ch.nookdajeju.model.Askboard;

public interface AskboardService {
	int insert(Askboard askboard);
	
	List<Askboard> list(int startRow, int endRow);
	int getTotal(Askboard askboard);
	int maxNum();
	void updateReadCount(int askno);
	Askboard select(int askno);
	int update(Askboard askboard);
	int delete(int askno);
	void updateRe_step(Askboard askboard);

}
