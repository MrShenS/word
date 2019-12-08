package com.briup.pattern.behavior.ChainOfResponsibility;

public class MyHandler implements Handler {  
	  
    private String name;  
    private Handler next_handler;  
  
    public MyHandler(String name) {  
        this.name = name;  
    } 

    public Handler getHandler() {  
        return next_handler;  
    }  
    public void setHandler(Handler handler) {  
        this.next_handler = handler;  
    }  
  
    public void operator() {  
        System.out.println("name = "+name);  
        if(next_handler!=null){  
        	next_handler.operator();  
        }  
    }  
}  
