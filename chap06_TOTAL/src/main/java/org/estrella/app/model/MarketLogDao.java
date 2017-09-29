package org.estrella.app.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketLogDao {

	@Autowired
	SqlSessionTemplate template;
	
	public int tender(Map map) {
		return template.insert("market.tender", map);
	}
	
	public List<Map> tenderlist(Map map) {
		return template.selectList("market.tenderlist", map);
	}
	
	public int updatetender(Map map) {
		return template.update("market.updatetender", map);
	}
}
