<%@ page import="java.net.URLEncoder" contentType="text/html; charset=euc-kr"%>
<%
	String zoom  = request.getParameter("zoom") == null ? "5"  	 : request.getParameter("zoom");
	String border = request.getParameter("border")== null ? "0"   : request.getParameter("border");
	String bdcolor = request.getParameter("bdcolor")== null ? "#FFFFFF"   : request.getParameter("bdcolor");
%>

<body leftmargin="20" topmargin="50">
<table width="100%" height="500" border="0" align="center" background="/jsp/img/loading.gif" style="background-repeat:no-repeat;background-position:center;">
	<tr>
		<td>
			<img src="/Thumbnail/jsp/test.jsp?filenm=1.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
			<img src="/Thumbnail/jsp/test.jsp?filenm=2.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
			<img src="/Thumbnail/jsp/test.jsp?filenm=3.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
			<img src="/Thumbnail/jsp/test.jsp?filenm=4.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
			<img src="/Thumbnail/jsp/test.jsp?filenm=5.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
			<img src="/Thumbnail/jsp/test.jsp?filenm=6.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
			<img src="/Thumbnail/jsp/test.jsp?filenm=7.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
			<img src="/Thumbnail/jsp/test.jsp?filenm=8.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
			<img src="/Thumbnail/jsp/test.jsp?filenm=9.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
			<img src="/Thumbnail/jsp/test.jsp?filenm=10.jpg&zoom=<%=zoom%>&border=<%=border%>&bdcolor=<%=URLEncoder.encode(bdcolor, "euc-kr")%>">
		</td>
	</tr>
</table>
<center>
	<form name="form" method="post">

		ZoomOut<input type="text" name="zoom" value="<%=zoom%>" size="2" maxlength="2">
		Border<input type="checkbox" name="border" value="1" <%=(border.equals("1")) ? "checked" : "" %>>
		BorderColor
		<select name="bdcolor">
			<option value="">�����÷�</option>
			<option value="#000000" <%="#000000".equals(bdcolor) ? "selected" : "" %> style="color:#000000">����</option>
			<option value="#840000" <%="#840000".equals(bdcolor) ? "selected" : "" %> style="color:#840000">���</option>
			<option value="#008200" <%="#008200".equals(bdcolor) ? "selected" : "" %> style="color:#008200">���</option>
			<option value="#848200" <%="#848200".equals(bdcolor) ? "selected" : "" %> style="color:#848200">Ȳ��</option>
			<option value="#000084" <%="#000084".equals(bdcolor) ? "selected" : "" %> style="color:#000084">����</option>
			<option value="#840084" <%="#840084".equals(bdcolor) ? "selected" : "" %> style="color:#840084">����</option>
			<option value="#008284" <%="#008284".equals(bdcolor) ? "selected" : "" %> style="color:#008284">û��</option>
			<option value="#848284" <%="#848284".equals(bdcolor) ? "selected" : "" %> style="color:#848284">ȸ��</option>
			<option value="#c6c3c6" <%="#c6c3c6".equals(bdcolor) ? "selected" : "" %> style="color:#c6c3c6">����</option>
			<option value="#ff0000" <%="#ff0000".equals(bdcolor) ? "selected" : "" %> style="color:#ff0000">����</option>
			<option value="#00ff00" <%="#00ff00".equals(bdcolor) ? "selected" : "" %> style="color:#00ff00">����</option>
			<option value="#ffff00" <%="#ffff00".equals(bdcolor) ? "selected" : "" %> style="color:#ffff00">���</option>
			<option value="#0000ff" <%="#0000ff".equals(bdcolor) ? "selected" : "" %> style="color:#0000ff">�Ķ�</option>
			<option value="#ff00ff" <%="#ff00ff".equals(bdcolor) ? "selected" : "" %> style="color:#ff00ff">��ȫ</option>
			<option value="#00ffff" <%="#00ffff".equals(bdcolor) ? "selected" : "" %> style="color:#00ffff">�ϴ�</option>
			<option value="#ffffff" <%="#ffffff".equals(bdcolor) ? "selected" : "" %> style="color:#ffffff">���</option>
		</select>
		<input type="submit">
	</form>
</center>
</body>
