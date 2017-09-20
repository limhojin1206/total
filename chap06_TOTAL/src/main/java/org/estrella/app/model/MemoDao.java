package org.estrella.app.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDao {

	@Autowired
	SqlSessionTemplate template;
	
	public int send(Map map) {
		return template.insert("memo.send", map);
	}
	
	public List<Map> readAll(String id) {
		return template.selectList("memo.readAll", id);
	}
	
	public List<Map> readBlist(Map map) {
		return template.selectList("memo.readBlist", map);
	}
}
