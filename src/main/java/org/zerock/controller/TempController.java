package org.zerock.controller;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;



import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TempController {
	
	
	@RequestMapping(value="/display")
	public @ResponseBody ResponseEntity<byte[]> display(String file)throws Exception{
		
		System.out.println("file " + file);
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Content-Type", "image/jpg");
		
		String filePath = "C:\\zzz\\upload\\" + file;
		ByteArrayOutputStream baos 
		   = new ByteArrayOutputStream();
		File target = new File(filePath);
		
		FileCopyUtils.copy(new FileInputStream(target), baos);
		
		ResponseEntity<byte[]> result = 
				new ResponseEntity<>(baos.toByteArray(),headers,
						HttpStatus.OK);
		
		
		return result;
	}
	

	
}






