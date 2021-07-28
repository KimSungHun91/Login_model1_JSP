package kr.ac.green;

import java.util.Vector;

import javax.servlet.ServletContext;

public class MemberManager {
	public static Member getBlankMember() {
		Member member = new Member();
		member.setU_id("");
		member.setU_name("");
		member.setU_nick("");
		member.setU_pw("");
		
		return member;
	}

	// 회원가입한 멤버 리스트를 가져오는 메소드
	public static Vector<Member> getMemberList(ServletContext application) {
		Vector<Member> memberList = (Vector<Member>)application.getAttribute("memberList");
		
		if(memberList == null) {
			memberList = new Vector<Member>();
			application.setAttribute("memberList", memberList);
		}
		return memberList;
	}
	
	// 회원가입한 멤버 중에서 특정 멤버 찾는 메소드
	public static Member findMember(ServletContext application, String u_id) {
		Vector<Member> memberList = getMemberList(application);
		Member member = null;
		// 입력받은 파라미터 id로 가입한 사람이 있으면
		int idx = memberList.lastIndexOf(new Member(u_id));
		if(idx != -1) {
			// 그 멤버 리턴
			member = memberList.get(idx);
		}
		// 없으면 null 리턴
		return member;
	}
	
	// 새로운 멤버 추가 관련 메소드
	public static boolean addMember(ServletContext application, Member member) {
		// application 속성에서 멤버 리스트 꺼내와서
		Vector<Member> memberList = getMemberList(application);
		boolean flag = false;
		// 그 리스트에 동일한 멤버가 없으면(id 중복x)
		if (findMember(application, member.getU_id()) == null) {
			// 멤버 추가 후
			memberList.add(member);
			// true return
			flag = true;
		}
		// 동일한 멤버가 있으면(id 중복o) false return
		return flag;
	}
	
	public static boolean deleteMember(ServletContext application, String u_id) {
		Vector<Member> memberList = getMemberList(application);
		return memberList.remove(findMember(application, u_id));
	}
	
	// 회원정보 수정 관련 메소드
	public static boolean updateMember(ServletContext application, Member member) {
		// application 속성에서 멤버 리스트 꺼내와서
		Vector<Member> memberList = getMemberList(application);
		int idx = memberList.indexOf(member);
		boolean flag =false;
		// 멤버 리스트에 멤버가 있으면
		if (idx != -1) {
			// 멤버 정보 변경
			memberList.set(idx, member);
			// true return
			flag = true;
		}
		// 멤버 리스트에 멤버가 없으면 false return
		return flag;
	}
}
