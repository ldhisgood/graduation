package com.qykh.frame.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class SetUtil {
	@SuppressWarnings("unchecked")
	public static List toArray(Set set){
		List list =new ArrayList();
		for(Object obj:set){
			list.add(obj);
		}
		return list;
	}
}
