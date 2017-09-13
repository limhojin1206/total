package org.estrella.app.model;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Autowired
	SqlSessionTemplate template;
	
	public int join (Map map) {
		int rst = 0;
		rst += template.insert("member.join", map);
		rst += template.insert("member.addDetail",map);
		return rst;
	}
	
	public List<Map> getDetail (Map map) {
		return template.selectList("member.getDetail", map);
	}
	
	public List<Map> emailcheck (Map map) {
		return template.selectList("member.emailcheck", map);
	}
	
	public Map login (Map map) {
		return template.selectOne("member.login", map);
	} 
	
}
