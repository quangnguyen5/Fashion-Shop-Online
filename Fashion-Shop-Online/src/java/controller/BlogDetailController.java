/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.BlogDAO;
import dal.CategoryDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Blog;
import model.CategoryBlog;

 @WebServlet(name = "BlogDetailController", urlPatterns = {"/blogDetail"})
public class BlogDetailController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
      response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        int blog_id = Integer.parseInt(request.getParameter("blog_id"));
        
        BlogDAO dao = new BlogDAO();
        Blog listBlogDetail_BlogDetail = dao.getBlogByBlogId(blog_id);
        request.setAttribute("listBlogById", listBlogDetail_BlogDetail);
        
        UserDAO ud = new UserDAO();
        String author = ud.getAuthorById(listBlogDetail_BlogDetail.getAuthor_id());
        request.setAttribute("author", author);
             
        List<CategoryBlog> listCategoryBlog_BlogList = new CategoryDAO().getAllCategoryBlog();
        session.setAttribute("listCategoryBlog", listCategoryBlog_BlogList);
        
        request.getRequestDispatcher("BlogDetail.jsp").forward(request, response);
     }
}
