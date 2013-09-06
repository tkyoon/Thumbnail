<%@ page import="com.Thumbnail"
	contentType="text/html;charset=euc-kr"%>

<%

try{

	int zoom  = request.getParameter("zoom") == null ? 5 : Integer.parseInt(request.getParameter("zoom"));
	String bdcolor  = request.getParameter("bdcolor") == null ? "#FFFFFF" : request.getParameter("bdcolor");
	boolean border= request.getParameter("border").equals("1");
	String filenm = request.getParameter("filenm");

	System.out.println("@@ zoom = " + zoom);
	System.out.println("@@ bdcolor = " + bdcolor);
	System.out.println("@@ border = " + border);

	String path = application.getRealPath("/jsp/img/"+filenm);
	out.clear();
	out=pageContext.pushBody();
	Thumbnail.createImage(request, response, path, zoom, border, bdcolor);

}catch(Exception e){
	e.printStackTrace();
}

	//Thumbnail.createImage(request, response, application.getRealPath("/test.jpg"), 400, 200, border, bdcolor);
%>
