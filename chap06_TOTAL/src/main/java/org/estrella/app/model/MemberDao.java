package org.estrella.app.model;


import java.util.HashMap;
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
	
	public Map getDetail (Map map) {
		return template.selectOne("member.getDetail", map);
	}
	
	public List<Map> idcheck (Map map) {
		return template.selectList("member.idcheck", map);
	}
	
	public List<Map> emailcheck (Map map) {
		return template.selectList("member.emailcheck", map);
	}
	
	public Map login (Map map) {
		return template.selectOne("member.login", map);
	} 
	
	public int addPic(Map map) {
		return template.insert("my.addPic", map);
	}
	
	public Map prePic(Map map) {
		return template.selectOne("my.prePic", map);
	}
	
	public List<Map> readAll() {
		return template.selectList("member.readAll");
	}
	
	public List<Map> readMlist(Map map) {
		return template.selectList("member.readMlist", map);
	}
	
	public List<Map> friendList(Map map){
		return template.selectList("member.friendlist", map);
	}
}
