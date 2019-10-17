package test;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class CalTest {
	
	@Test
	public void addTest() {
		// 테스트 하고자 하는 함수 호출
		double result;
		result=Cal.add(10, 10);
		assertTrue("result 20",result==20);
	}

}
