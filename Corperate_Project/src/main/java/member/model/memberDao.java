package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("memberDao") //��ü ����
public class memberDao {

	private final String namespace = "member.MemberBean";

	@Autowired // ��ü ���� root-context ��ü�� ����־��.
	SqlSessionTemplate sqlSessionTemplate; //����Ŭ �����ض� ������ ����.


	}//memberDao
