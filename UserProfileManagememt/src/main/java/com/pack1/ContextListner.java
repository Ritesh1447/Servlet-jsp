package com.pack1;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListner implements ServletContextListener,ServletContextAttributeListener
{
	@Override
	public void contextInitialized(ServletContextEvent sce)
	{
		System.out.println("Context Object created");
		ServletContext context=sce.getServletContext();
		System.out.println("Our Application is deployed into : "+context.getServerInfo());
	}
	
	public void contextDestroyed(ServletContextEvent sce)
	{
		System.out.println("Context Object destroyed");
	}
	public void attributeAdded(ServletContextAttributeEvent scae)
	{
		System.out.println("Attributed added");
		String name=scae.getName();
		System.out.println("Attribute Name :"+name);
	}
	public void attributeRemoved(ServletContextAttributeEvent scae)
	{
		System.out.println("Attribute removed");
	}
}
