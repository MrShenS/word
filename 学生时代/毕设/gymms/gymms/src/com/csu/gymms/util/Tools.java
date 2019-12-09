package com.csu.gymms.util;

import java.io.UnsupportedEncodingException;

public class Tools {
	
	public static String convert(String oldstr) {
		String newstr="";
		try {
			byte oldStrByte[] = oldstr.getBytes("ISO-8859-1");
			newstr = new String(oldStrByte,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newstr;
	}
}
