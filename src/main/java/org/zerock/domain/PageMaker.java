package org.zerock.domain;



import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageMaker {

	private boolean prev, next;
	private int page, start, end, total;

	private Criteria cri;

	public PageMaker(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.page = cri.getPage() > 0 ? cri.getPage() : 1;

		int tempLast = (int) (Math.ceil(page / 10.0) * 10);

		this.start = tempLast - 9;

		prev = (start != 1);// true

		if (tempLast * 10 >= total) {
			tempLast = (int) (Math.ceil(total / 10.0));

		} else {
			this.next = true;
		}
		this.end = tempLast;
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).build();
		return uriComponents.toUriString();
	}

}
