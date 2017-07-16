package com.shop.util;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;  
import javax.servlet.http.HttpSessionListener;  
  
  
public class MySessionListener implements HttpSessionListener,HttpSessionAttributeListener  {  
	
    private long counts=0L;  
  
   
    public void sessionCreated(HttpSessionEvent event) {  
        // TODO Auto-generated method stub  
        System.out.println("counts is----"+counts);
    	this.counts=this.counts+1L;  
                                //保存在application作用域  
        event.getSession().getServletContext().setAttribute("counts", counts);  
    }  
  
    public void sessionDestroyed(HttpSessionEvent event) {  
        // TODO Auto-generated method stub  
    	  System.out.println("counts is----"+counts);
    	this.counts=this.counts-1L;  
        event.getSession().getServletContext().setAttribute("counts", counts);  
    }  
  
    
    public void attributeAdded(HttpSessionBindingEvent sbe) {  
    	this.counts=this.counts+1L;  
        //保存在application作用域  
    	sbe.getSession().getServletContext().setAttribute("counts", counts);  
    }  
    
 // 修改、删除session中添加对象时触发此操作  
    public void attributeRemoved(HttpSessionBindingEvent arg0) {  
          
    	this.counts=this.counts-1L;  
    	arg0.getSession().getServletContext().setAttribute("counts", counts);  
    }  
  
    public void attributeReplaced(HttpSessionBindingEvent arg0) {  
        System.out.println("77777777");  
    }  
    
}  
