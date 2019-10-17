package bean;

public class BeanDB1 {
	// insert 메서드
	public void insertMember(BeanTest1 bt1) {
		//1단계 드라이버로더
		//2단계 디비연결
		//3단계 sql ?
		// id값 가져오기
		System.out.println(bt1);
		System.out.println(bt1.getId());
		//4단계 실행 
	}
}
