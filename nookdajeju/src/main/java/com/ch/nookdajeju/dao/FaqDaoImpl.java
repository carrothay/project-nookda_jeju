package com.ch.nookdajeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.nookdajeju.model.Faq;

@Repository
public class FaqDaoImpl implements FaqDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getfaqTotal(Faq faq) {
		return sst.selectOne("faqns.getfaqTotal", faq); // faq 총 수
	}

	@Override
	public List<Faq> faqList(Faq faq) {
		return sst.selectList("faqns.faqList", faq); // faq 리스트
	}

	@Override
	public int delete(Faq faq) {
		return sst.delete("faqns.delete", faq);
	}

	@Override
	public Faq select(int fno) {
		return sst.selectOne("faqns.select", fno);
	}

	@Override
	public int update(Faq faq) {
		return sst.update("faqns.update", faq);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("faqns.getMaxNum");
	}

	@Override
	public int insert(Faq faq) {
		return sst.insert("faqns.insert", faq);
	}
	
}
