/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.BlogDAO;
import dal.CategoryDAO;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import model.Blog;
import model.CategoryBlog;



@WebServlet(name = "BlogController", urlPatterns = {"/blog"})
public class BlogController extends HttpServlet{
    
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

   private void processRequest(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        final int PAGE_SIZE = 6;  // Set total product each page
        BlogDAO bd = new BlogDAO();
// Set page
        int page = 1;
        String strPage = request.getParameter("page");
        if (strPage != null) {
            page = Integer.parseInt(strPage);
        }

        // Set key for search 
        String searchKey = "";
        String strSearchKey = request.getParameter("key");
        if (strSearchKey != null) {
            searchKey = strSearchKey;
        }

        // Set category
        String categoryId = "!= -1";
        String strCategoryId = request.getParameter("categoryId");
        if (strCategoryId != null) {
            categoryId = "= " + strCategoryId;
        }
        // Set sort 
        String value = "updated_date";
        String type = "";
        String strType = request.getParameter("type");
        String strValue = request.getParameter("value");
        if (strType != null) {
            type = strType;
        }
        if (strValue != null) {
            value = strValue;
        }

        // Set total page 
        int totalBlog = bd.getTotalBlog(searchKey, categoryId);
        int totalPage = totalBlog / PAGE_SIZE;
        if (totalBlog % PAGE_SIZE != 0) {
            totalPage += 1;
        }

   }
    
}
