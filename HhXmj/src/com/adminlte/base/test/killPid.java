package com.adminlte.base.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class killPid {
	
	public void killByPid(String str) {
		final String[] Array = { "ntsd.exe", "-c", "q", "-p", str };
		int i = 0;
		try {
			Process process = Runtime.getRuntime().exec(Array);
			process.waitFor();
		} catch (InterruptedException e) {
			System.out.println("run err!");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (i != 0) {
			try {
				Process process = Runtime.getRuntime().exec(Array);
				process.waitFor();
			} catch (InterruptedException e) {
				System.out.println("err!");
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		killPid pid=new killPid();
		//pid.killByPid("4180");
		closeProcess("javaw.exe");
	}
	
	public static void closeProcess(String programName) {
		Process listprocess;
		 //= "eclipse.exe";
		try {
			listprocess = Runtime.getRuntime().exec("cmd.exe /c tasklist");
			InputStream is = listprocess.getInputStream();
			BufferedReader r = new BufferedReader(new InputStreamReader(is));
			// StringBuffer sb = new StringBuffer();
			String str = null;
			while ((str = r.readLine()) != null) {
				String id = null;
				Matcher matcher = Pattern.compile(programName + "[ ]*([0-9]*)").matcher(str);
				while (matcher.find()) {
					if (matcher.groupCount() >= 1) {
						id = matcher.group(1);
						if (id != null) {
							Integer pid = null;
							try {
								pid = Integer.parseInt(id);
							} catch (NumberFormatException e) {
								e.printStackTrace();
							}
							if (pid != null) {
								Runtime.getRuntime().exec("cmd.exe /c taskkill /f /pid " + pid);
								// System.out.println("kill progress"+pid);
							}
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
