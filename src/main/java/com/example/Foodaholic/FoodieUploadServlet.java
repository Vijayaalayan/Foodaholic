package com.example.Foodaholic;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FoodieUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FoodieUploadServlet extends HttpServlet{
    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
//        String lastName = request.getParameter("lastname");

//        int id = request.getParameter(id);

        String email = request.getParameter("email");
        String email1 = '"'+email+'"';

        String number = request.getParameter("number");
        String place = request.getParameter("place");
        String password = request.getParameter("password");
        String guide = request.getParameter("guide");
        String likemind = request.getParameter("likemind");
//        String place = request.getParameter("place");



        Part part = request.getPart("file");
        String fileName = extractFileName(part);//file name
        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodaholic", "root", "toor");
//            PreparedStatement pst = con.prepareStatement("insert into imagetest values(?,?,?,?,?)");

            PreparedStatement pst = con.prepareStatement("insert into foodie values(?,?,?,?,?,?,?,?)");

//            pst.setInt(1, id);
            pst.setString(1, name);
//            pst.setString(3, lastName);
//            pst.setString(4, dbFileName);
//            pst.setString(5, savePath);

//            pst.setString(1, shopName);
            pst.setString(2, email);
            pst.setString(3, number);
            pst.setString(4, place);
            pst.setString(5, password);

            pst.setString(6, guide);
            pst.setString(7, likemind);
            pst.setString(8, dbFileName);



            pst.executeUpdate();
//            out.println("<center><h1>Image inserted Succesfully......</h1></center>");
//            out.println("<center><a href='display.jsp?email="+ email1 +"'>Display</a></center>");
//            out.println("<center><a href='display.jsp?email="+ email1 +"'>Display</a></center>");
            out.println("Thank you for register ! Please <a href='index.html'>Login</a> to continue.");
            String redirectURL = "login.html";
            response.sendRedirect(redirectURL);

        } catch (Exception e) {
            out.println(e);
        }

    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
