package org.estrella.app.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

	@Autowired
	SqlSessionTemplate template;

	public int write(Map map) {
		return template.insert("board.write", map);
	}

	public int updateCount(String num) {
		return template.update("board.updateCount", num);
	}

	public List<Map> readAll() {
		return template.selectList("board.readAll");
	}

	public Map readOne(String num) {
		return template.selectOne("board.readOne", num);
	}
	
	public List<Map> readBlist(Map map) {
		return template.selectList("board.readBlist", map);
	}
}
