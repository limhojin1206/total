package org.estrella.app.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDao {

	@Autowired
	SqlSessionTemplate template;
	
	public int createOne(Map map) {
		return template.insert("reply.createNewOne", map);
	}
	
	public List<Map> readSome(Map map){
		return template.selectList("reply.readSome", map);
	}
	
	public int delOne(Map map) {
		return template.delete("reply.delOne",map);
	}
}
