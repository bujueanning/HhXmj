package com.adminlte.utils;

import java.util.UUID;

import org.apache.commons.lang3.StringUtils;

public class IDUtil {
	public static String get32UUID(){
		return StringUtils.replace(UUID.randomUUID().toString(), "-", "");
	}
}
