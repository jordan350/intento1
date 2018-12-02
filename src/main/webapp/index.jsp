<%-- 
    Document   : barras
    Created on : 1/12/2018, 12:17:32 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="org.jfree.chart.*"%>
<%@page import="org.jfree.chart.plot.*"%>
<%@page import="org.jfree.data.general.*"%>
<%@page import="org.jfree.data.category.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                
        <%
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/graficas","root","root");
            Statement cmd=cn.createStatement();
            String query="SELECT * FROM ventas";
            ResultSet rs=cmd.executeQuery(query);
            
            DefaultCategoryDataset data1 = new DefaultCategoryDataset();
            while(rs.next()){
            data1.setValue(rs.getInt(1),"ingresos", rs.getString(2));
            }
        //--------------------------------------------titulo de la grafica,titulo abajo,titulo izquierda, datos,orientacion,decoraciones activas
        JFreeChart grafico1=ChartFactory.createBarChart("ingresos año 2018","meses","promedio", data1, PlotOrientation.VERTICAL, true, true,true);
        //donde se visualizara la grafica
        response.setContentType("image/JPEG");
        //la salida de la grafica
        OutputStream sa1=response.getOutputStream();
        //impresion
        //---------------------------salida,grafico,tamaños
        ChartUtilities.writeChartAsPNG(sa1, grafico1, 350, 350);
            %>
    </body>
</html>
