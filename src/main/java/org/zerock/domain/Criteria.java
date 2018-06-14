package org.zerock.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {

	private int page;
	private String type, keyword;

	public Criteria() {
		this.page = 1;
	}
	//디폴트 생성자

	public Criteria(int page) {

		this.page = page;
	}

	public int getSkip() {
		return (this.page - 1) * 10;

	}

	public String[] getArr() {
		if (type == null) {
			return null;
		}
		return this.type.split("");
	}
	
	public String makeSearch(int page) {
        if(this.keyword!=null && this.type!=null && this.type!=""&& this.keyword!="") {
        
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance().queryParam("page", page).
                queryParam("type", this.type).
                queryParam("keyword", encoding(this.keyword)).build();
        return uriComponents.toUriString();}
        
        else {UriComponents uriComponents =
                UriComponentsBuilder.newInstance().queryParam("page", page).
                build();
        return uriComponents.toUriString();}
                    
    }
	
    
    private String encoding(String keyword) {
        if(keyword == null || keyword.trim().length()==0) {
            return "";
        }
        try {
            return URLEncoder.encode(keyword,"UTF-8");
        }catch(UnsupportedEncodingException e) {
            return "";
        }
    }
}
