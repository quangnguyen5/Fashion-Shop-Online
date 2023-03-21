package Controller.Public;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


import  model.SendMailOK;

public class ContactController {
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        SendMailOK eSendMailOK= new SendMailOK();
        try {
            eSendMailOK.send("smtp.gmail.com", email, "toanbvhe163899@fpt.edu.vn"," ", "Thanks You"+ name, message);
            response.sendRedirect("contact.jsp?success=true");
        } catch (Exception e) {
            response.sendRedirect("contact.jsp?success=false");
        }
    }

}