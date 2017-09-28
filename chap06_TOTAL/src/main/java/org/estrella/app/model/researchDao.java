package org.estrella.app.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class researchDao {

	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> result(){
		return template.selectList("research.result");
	}
	
	public Map result_2(int score){
		return template.selectOne("research.result_2", score);
	}
}
