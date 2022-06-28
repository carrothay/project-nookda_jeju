package com.ch.nookdajeju.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.nookdajeju.model.Askboard;

@Repository
public class AskboardDaoImpl implements AskboardDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Askboard askboard) {
		if (askboard.getSecret() == null || askboard.getSecret() == "") {
			askboard.setSecret("n");
		}
		return sst.insert("askns.insert", askboard);
	}

	@Override
	public List<Askboard> list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("askns.list", map);
	}

	@Override
	public int getTotal(Askboard askboard) {
		return sst.selectOne("askns.getTotal", askboard);
	}

	@Override
	public int maxNum() {
		return sst.selectOne("askns.maxNum");
	}
	
	@Override
	public void updateReadCount(int askno) {
		sst.update("askns.updateReadcount", askno);
	}

	@Override
	public Askboard select(int askno) {
		return sst.selectOne("askns.select", askno);
	}

	@Override
	public int update(Askboard askboard) {
		return sst.update("askns.update", askboard);
	}

	@Override
	public int delete(int askno) {
		return sst.update("askns.delete", askno);
	}

	@Override
	public void updateRe_step(Askboard askboard) {
		sst.update("askns.updateRe_step", askboard);
	}

}
