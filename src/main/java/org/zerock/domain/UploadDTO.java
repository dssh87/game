package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class UploadDTO {

	private int uploadCnt;
	private List<UploadVO> list;
}
