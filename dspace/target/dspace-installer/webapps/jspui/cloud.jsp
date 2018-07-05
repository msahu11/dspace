<%-- 
    Document   : index.jsp
    Created on : 15 Jun, 2018, 7:10:34 PM
    Author     : prem
--%>


<%@page import="org.dspace.cloudtag.Genes2Word.cloud" %>
<%@page import="org.dspace.cloudtag.parser.LogParser" %>
<%@page import="java.util.Random" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cloud tag</title>
    </head>
    <body>
    	<div style="border-style:inset"
       <%
       int r,g,b; //colors
		String path[] = new String[3];
		path[0] = "/home/dspace/log";
		LogParser l = new LogParser();
		l.main(path);
       Random rand = new Random();
       String orgs[]= new String[3];
       //setting the path of documents in org[0]
       //orgs[0] = "docs-1/Input";
       orgs[0] = "/home/dspace/dspace-6.2-src-release/dspace-jspui/src/main/webapp/parse/Input";
       cloud c=new cloud();
       //sending the path to the cloud class
       c.main(orgs);
       //retrieving WORDS,FREQ and temp
       String WORDS[]= c.getWORDS();
       int FREQ[] = c.getFREQ();
       int temp = c.getTemp();
       for(int i=1;i<100;i++){
        //generating 3 random colors in every iteration
        r = rand.nextInt(256);
        g = rand.nextInt(256);
        b = rand.nextInt(256);
		int f = (FREQ[i]*10)/temp;
		if(f>100)
			f = 100; %>
        <font style="font-size:<%= f%>px;color:rgb(<%=r%>,<%=g%>,<%=b%>)"><% out.println(WORDS[i]);%> </font>
       <% } %>
   	</div>
    </body>
</html>
