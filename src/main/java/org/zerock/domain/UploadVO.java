package org.zerock.domain;

import java.util.Date;

import lombok.Data;
@Data
public class UploadVO {
	
	private String uuid, fileName;
	private Date regdate;

}
