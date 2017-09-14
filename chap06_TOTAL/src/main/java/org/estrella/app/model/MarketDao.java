package org.estrella.app.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketDao {

	@Autowired
	SqlSessionTemplate template;
	
	public int add (Map map) {
		return template.insert("market.add", map);
	}
	
	public List<Map> readAll(){
		return template.selectList("market.readAll");
	}
	
	public Map readOne(String num){
		return template.selectOne("market.readOne", num);
	}
	
	public List<Map> search(Map map){
		return template.selectList("market.search" , map);
	}
	public List<Map> csearch(Map map){
		return template.selectList("market.csearch" , map);
	}
	
	public List<Map> getAll() {
		return template.selectList("market.getAll");
	}
}
