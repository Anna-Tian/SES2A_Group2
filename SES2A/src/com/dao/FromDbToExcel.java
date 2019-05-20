package com.dao;

import java.io.FileOutputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Student;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.util.HibernateUtil;

public class FromDbToExcel {
	public final static String url="jdbc:mysql://localhost:3306/uts_help";
	public final static String user="root";
	public final static String password="rootroot";
	
	
	
    public static void download(String table,String sql) throws Exception {
    	
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=(Connection) DriverManager.getConnection(url,user,password);
            
            Workbook book = new HSSFWorkbook();
            //String Table_Name="Report";
            Sheet sheet=book.createSheet(table);
            
            Statement st = (Statement) con.createStatement();
           // Integer id = 111;
           // sql="select studentId,sessionId from session where studentId="+id;
            //System.out.println("Testttttttttttttt");
            ResultSet rs=st.executeQuery(sql);
            Row row1=sheet.createRow(0);
            ResultSetMetaData rsmd=rs.getMetaData();
            int colnum = rsmd.getColumnCount();
            
            for (int i = 1; i <= colnum; i++) {
                String name = rsmd.getColumnName(i);
                Cell cell=row1.createCell(i-1);
                cell.setCellValue(name);
            }
            int idx=1;
            while(rs.next()) {
            	Row row=sheet.createRow(idx++);
            	for(int i=1;i<=colnum;i++) {
            		String str=rs.getString(i);
            		Cell cell=row.createCell(i-1);
            		cell.setCellValue(str);
            	}
            }
           
               
            book.write( new FileOutputStream("/Users/anna/Desktop/"+table+".xls"));//download path need to change
    	}
    public  static Student getStudent(String id) {
    	Session session = HibernateUtil.getCurrentSession();
    	Transaction transaction = session.beginTransaction();
    	Student student=session.get(Student.class, id);
    	transaction.commit();
    	return student;
    	
    }
   
    	
    
   
}