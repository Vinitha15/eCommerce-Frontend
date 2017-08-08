package com.niit.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalDefaultExceptionHandler {
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handleNoHandlerFoundException(){
		
		ModelAndView mv=new ModelAndView("error");
		mv.addObject("title","404");
		mv.addObject("errortitle","Page Not Found");
		mv.addObject("errordes","The Page you are looking for is unavailable");
		return  mv;
	}
	
	@ExceptionHandler(ProductNotFoundException.class)
	public ModelAndView handleProductNotFoundException(){
		
		ModelAndView mv=new ModelAndView("error");
		mv.addObject("title","Product Unavailable");
		mv.addObject("errortitle","Product Not Found");
		mv.addObject("errordes","Product you are looking for is currently unavailable");
		return  mv;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e){
		
		ModelAndView mv=new ModelAndView("error");
		mv.addObject("title","error");
		mv.addObject("errortitle","Contact your Administrator");
		mv.addObject("errordes",e.toString());
		return  mv;
	}

}
