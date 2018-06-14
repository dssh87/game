package org.zerock.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sound.midi.Soundbank;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class DBEncryptes {
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void test() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement("select mid, mpw from tbl_amember_secu", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String mid = rs.getString(1);
				String mpw = rs.getString(2);
				
				System.out.println(mid + " : " + mpw);
				String enStr = encoder.encode(mpw);
				rs.updateString(2, enStr);
				rs.updateRow();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(Exception e) {}}
			if(rs!=null) {try {pstmt.close();}catch(Exception e) {}}
			if(rs!=null) {try {con.close();}catch(Exception e) {}}
		}
	}
	
}