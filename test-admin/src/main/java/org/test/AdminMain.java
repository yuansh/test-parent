package org.test;


import org.apache.catalina.startup.Tomcat;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

public class AdminMain {
	private static Logger logger = LoggerFactory.getLogger(AdminMain.class);
	public static void main(String[] args) throws Exception {
		Tomcat tomcat=new Tomcat();
		tomcat.setPort(8086);
		tomcat.getConnector().setURIEncoding("UTF-8");
		String path=AdminMain.class.getResource("/").getPath();
		tomcat.addWebapp("", path.substring(0, path.indexOf("target")) + "src/main/webapp");
		tomcat.start();
		logger.info("Started tomcat");
		tomcat.getServer().await();
	}
}
