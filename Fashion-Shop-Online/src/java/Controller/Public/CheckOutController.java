/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Public;

import com.vnpay.common.Config;
import dal.CartDAO;
import dal.CustomerDAO;
import dal.OrderDao;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.SendMailOK;
import model.User;

/**
 *
 * @author son22
 */
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String method = request.getParameter("payment-method");

            if (method.equalsIgnoreCase("vnpay")) {
                int id = Integer.parseInt(request.getParameter("order_id"));
                int total_cost = Integer.parseInt(request.getParameter("total_cost"));
                String vnp_Version = "2.0.0";
                String vnp_Command = "pay";
                String vnp_OrderInfo = "" + id;
                String orderType = "billpayment";
                String vnp_TxnRef = id + "";
                String vnp_IpAddr = Config.getIpAddress(request);
                String vnp_TmnCode = Config.vnp_TmnCode;

                int amount = Math.round(total_cost) * 100;
                Map<String, String> vnp_Params = new HashMap<>();
                vnp_Params.put("vnp_Version", vnp_Version);
                vnp_Params.put("vnp_Command", vnp_Command);
                vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                vnp_Params.put("vnp_Amount", String.valueOf(amount));
                vnp_Params.put("vnp_CurrCode", "VND");
                String bank_code = "";
                if (bank_code != null && bank_code.isEmpty()) {
                    vnp_Params.put("vnp_BankCode", bank_code);
                }
                vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
                vnp_Params.put("vnp_OrderType", orderType);

                String locate = "vi";
                if (locate != null && !locate.isEmpty()) {
                    vnp_Params.put("vnp_Locale", locate);
                } else {
                    vnp_Params.put("vnp_Locale", "vn");
                }
                vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
                vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                Date dt = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String dateString = formatter.format(dt);
                String vnp_CreateDate = dateString;
                String vnp_TransDate = vnp_CreateDate;
                vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                //Build data to hash and querystring
                List fieldNames = new ArrayList(vnp_Params.keySet());
                Collections.sort(fieldNames);
                StringBuilder hashData = new StringBuilder();
                StringBuilder query = new StringBuilder();
                Iterator itr = fieldNames.iterator();
                while (itr.hasNext()) {
                    String fieldName = (String) itr.next();
                    String fieldValue = (String) vnp_Params.get(fieldName);
                    if ((fieldValue != null) && (fieldValue.length() > 0)) {
                        //Build hash data
                        hashData.append(fieldName);
                        hashData.append('=');
                        hashData.append(fieldValue);
                        //Build query
                        query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                        query.append('=');
                        query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                        if (itr.hasNext()) {
                            query.append('&');
                            hashData.append('&');
                        }
                    }
                }
                String queryUrl = query.toString();
                String vnp_SecureHash = Config.Sha256(Config.vnp_HashSecret + hashData.toString());
                queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
                String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
                request.setAttribute("code", "00");
                request.setAttribute("message", "success");
                request.setAttribute("data", paymentUrl);
                OrderDao od = new OrderDao();
                od.updateStatusOrder(id, 2);
                response.sendRedirect(paymentUrl);
            } else {
                response.sendRedirect("successful?vnp_OrderInfo=-1");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        CartDAO cd = new CartDAO();
        OrderDao od = new OrderDao();
        OrderDetailDAO odd = new OrderDetailDAO();
        ProductDAO pd = new ProductDAO();
        CustomerDAO cus = new CustomerDAO();
        HttpSession session = request.getSession();

        User u = (User) session.getAttribute("us");
        int user_id = u.getUser_Id();
        cd.deleteCartByUserId(user_id);
        Order o = od.getOrderNew(user_id);
        int saler_id = od.getAssignOrder();

        od.updateSalerOrder(o.getOrderID(), saler_id);
        od.updateStatusOrder(o.getOrderID(), 1);
        List<OrderDetail> listOrderDetail = odd.getAllByOderId(o.getOrderID());
        pd.updateQuantityProduct(listOrderDetail);
        Customer c = cus.checkCustomer(o.getFullName(), u.getEmail(), o.getMobile());

        if (c == null) {
            cus.storedNewCustomer(o.getFullName(), u.getEmail(), o.getMobile());
        }
        request.setAttribute("order_id", o.getOrderID());
        request.setAttribute("total_cost", o.getTotal_cost());

        String email = u.getEmail();

        try {
            String smtpServer = "smtp.gmail.com";
            String to = email;
            String from = "quangnphe160125@fpt.edu.vn";
            String subject = "Checkout For Order\n";
            String body
                    = "<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "    <head>\n"
                    + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                    + "        <title>JSP Page</title>\n"
                    + "    </head>\n"
                    + "    <body>\n"
                    + "    <td>\n"
                    + "        <table style=\"border-spacing:0;border-collapse:collapse;width:100%;margin:40px 0 20px\">\n"
                    + "            <tbody>\n"
                    + "                <tr>\n"
                    + "                    <td>\n"
                    + "            <center>\n"
                    + "                <table\n"
                    + "                    style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\n"
                    + "                    <tbody>\n"
                    + "                        <tr>\n"
                    + "                            <td>\n"
                    + "                                <table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\n"
                    + "                                    <tbody>\n"
                    + "                                        <tr>\n"
                    + "                                            <td>\n"
                    + "\n"
                    + "                                                <h1\n"
                    + "                                                    style=\"font-weight:normal;margin:0;font-size:30px;color:#333\">\n"
                    + "                                                    <a href=\"https://thevapeclub.vn\"\n"
                    + "                                                       style=\"font-size:30px;text-decoration:none;color:#333\"\n"
                    + "                                                       target=\"_blank\"\n"
                    + "                                                       data-saferedirecturl=\"https://www.google.com/url?q=https://thevapeclub.vn&amp;source=gmail&amp;ust=1655483413010000&amp;usg=AOvVaw3mqQmYH-B0jekACwJJY5LC\">Kingsman</a>\n"
                    + "                                                </h1>\n"
                    + "\n"
                    + "                                            </td>\n"
                    + "                                            <td\n"
                    + "                                                style=\"text-transform:uppercase;font-size:14px;text-align:right;color:#999\">\n"
                    + "                                                <span style=\"font-size:16px\">\n"
                    + "                                                    Đơn hàng " + o.getOrderID() + "\n"
                    + "                                                </span>\n"
                    + "                                            </td>\n"
                    + "                                        </tr>\n"
                    + "                                    </tbody>\n"
                    + "                                </table>\n"
                    + "                            </td>\n"
                    + "                        </tr>\n"
                    + "                    </tbody>\n"
                    + "                </table>\n"
                    + "            </center>\n"
                    + "    </td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\n"
                    + "    <tbody>\n"
                    + "        <tr>\n"
                    + "            <td style=\"padding-bottom:40px\">\n"
                    + "    <center>\n"
                    + "        <table\n"
                    + "            style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\n"
                    + "            <tbody>\n"
                    + "                <tr>\n"
                    + "                    <td>\n"
                    + "                        <h2 style=\"font-weight:normal;margin:0;font-size:24px;margin-bottom:10px\">\n"
                    + "                            Cám ơn bạn đã mua hàng!\n"
                    + "                        </h2>\n"
                    + "                        <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">\n"
                    + "                            Xin chào " + o.getFullName() + ", Chúng tôi đã nhận được đặt hàng của bạn và đã sẵn sàng để\n"
                    + "                            vận chuyển. Chúng tôi sẽ thông báo cho bạn khi đơn hàng được gửi đi.\n"
                    + "                        </p>\n"
                    + "\n"
                    + "                        <table\n"
                    + "                            style=\"border-spacing:0;border-collapse:collapse;width:100%;margin-top:20px\">\n"
                    + "                            <tbody>\n"
                    + "                                <tr>\n"
                    + "                                    <td>\n"
                    + "                                        <table\n"
                    + "                                            style=\"border-spacing:0;border-collapse:collapse;float:left;margin-right:15px\">\n"
                    + "                                            <tbody>\n"
                    + "                                                <tr>\n"
                    + "                                                    <td\n"
                    + "                                                        style=\"text-align:center;padding:20px 25px;border-radius:4px; background:#1666a2\">\n"
                    + "                                                        <a href=\"https://thevapeclub.vn/account/orders/3ef26b22e8af44548d6198e5f323371c\"\n"
                    + "                                                           style=\"font-size:16px;text-decoration:none;color:#fff\"\n"
                    + "                                                           target=\"_blank\">Xem đơn hàng</a>\n"
                    + "                                                    </td>\n"
                    + "                                                </tr>\n"
                    + "                                            </tbody>\n"
                    + "                                        </table>\n"
                    + "\n"
                    + "                                        <table\n"
                    + "                                            style=\"border-spacing:0;border-collapse:collapse;margin-top:19px\">\n"
                    + "                                            <tbody>\n"
                    + "                                                <tr>\n"
                    + "                                                    <td>\n"
                    + "                                                        <a href=\"https://thevapeclub.vn\"\n"
                    + "                                                           style=\"font-size:16px;text-decoration:none;color:#1666a2\"\n"
                    + "                                                           target=\"_blank\"><span\n"
                    + "                                                                style=\"font-size:16px;color:#999;display:inline-block;margin-right:10px\">hoặc</span>\n"
                    + "                                                            Đến cửa hàng của chúng tôi</a>\n"
                    + "                                                    </td>\n"
                    + "                                                </tr>\n"
                    + "                                            </tbody>\n"
                    + "                                        </table>\n"
                    + "                                    </td>\n"
                    + "                                </tr>\n"
                    + "                            </tbody>\n"
                    + "                        </table>\n"
                    + "                    </td>\n"
                    + "                </tr>\n"
                    + "            </tbody>\n"
                    + "        </table>\n"
                    + "    </center>\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<table style=\"border-spacing:0;border-collapse:collapse;width:100%;border-top:1px solid #e5e5e5\">\n"
                    + "    <tbody>\n"
                    + "        <tr>\n"
                    + "            <td style=\"padding:40px 0\">\n"
                    + "    <center>\n"
                    + "        <h3 style=\"font-weight:normal;margin:0;font-size:20px;margin-bottom:25px\">\n"
                    + "            Hướng dẫn mua hàng\n"
                    + "        </h3>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"images/cart-completion/htu1.png\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/289026647_373899921523981_4804343308795471022_n.png?_nc_cat=106&ccb=1-7&_nc_sid=ae9488&_nc_ohc=jkpkT4X38zYAX8IEMwd&_nc_ht=scontent.fhan9-1.fna&oh=03_AVL4XeRuJC2pXWYYc7xMVbpueyvuMdHK06PvT5KsY5xnZg&oe=62FB6075\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/293835749_584040990112050_5137791528487017844_n.png?_nc_cat=103&ccb=1-7&_nc_sid=ae9488&_nc_ohc=ZBkibLbBv9IAX9Gzbu_&_nc_ht=scontent.fhan9-1.fna&oh=03_AVJgSfNekGdW963MjKg6_rkO9ttlA0vyXL0SeZcSNmAM6Q&oe=62FBA55C\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/291754094_784358212564765_9066670101863646292_n.png?_nc_cat=102&ccb=1-7&_nc_sid=ae9488&_nc_ohc=7ugdRxv6TnMAX-DYMKP&_nc_ht=scontent.fhan9-1.fna&oh=03_AVJBH4G_auBVR3sqX5tfMyNl-VLmS0RaqXcjxE2DyeCffw&oe=62FB6E32\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/292472423_699070001625484_7690495944929767509_n.png?_nc_cat=111&ccb=1-7&_nc_sid=ae9488&_nc_ohc=PjK8RG95n1QAX_DNWm3&_nc_ht=scontent.fhan9-1.fna&oh=03_AVLP5oSSSOh2zBzbW4Ny1jMq8u9i5rUoroMCNYlgtuN8gQ&oe=62FB9499\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/292597228_3226866834237822_8142414351224193381_n.png?_nc_cat=104&ccb=1-7&_nc_sid=ae9488&_nc_ohc=I8UfCBwLS7sAX_UezBn&_nc_ht=scontent.fhan9-1.fna&oh=03_AVLing46qmQHCREcx2fTgCzxRsQ7Yw41yXFeXP0at07aLQ&oe=62FE75BA\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/292206738_788381875494474_2324776297711515739_n.png?_nc_cat=106&ccb=1-7&_nc_sid=ae9488&_nc_ohc=a0PaxxZNwTcAX9UeDac&_nc_ht=scontent.fhan9-1.fna&oh=03_AVJqJSdZxNcpvUoIWFCEY-FBYJNNrVix9gT_KTLapXMnEA&oe=62FBE2FF\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/289457996_585367882963812_2106902061823115253_n.png?_nc_cat=108&ccb=1-7&_nc_sid=ae9488&_nc_ohc=2L1D9UTuk-EAX9-EBSB&_nc_ht=scontent.fhan9-1.fna&oh=03_AVINvcRXKp1XWqpe4eqDsTbWLMD3Wdv9sWj1jf4g-QRKnQ&oe=62FB6333\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/289054491_602520614634550_4252195958001796417_n.png?_nc_cat=104&ccb=1-7&_nc_sid=ae9488&_nc_ohc=ZBsPsdhv3qcAX80BuL1&_nc_ht=scontent.fhan9-1.fna&oh=03_AVIdLti8bVoyxMZ8eU6A8J8gFWQN_ZU4NFedt4HT-9e6kQ&oe=62FC71D2\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/293507460_737939790619954_771660916449871452_n.png?_nc_cat=107&ccb=1-7&_nc_sid=ae9488&_nc_ohc=YO-jmG74-3EAX8WTRZk&_nc_ht=scontent.fhan9-1.fna&oh=03_AVJQO_GPwwCEDSzNSEwxzHlZKx0wCO9JHNDzrfZXvwlwXA&oe=62FBE038\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/289865789_429127732469198_1233054846320653452_n.png?_nc_cat=102&ccb=1-7&_nc_sid=ae9488&_nc_ohc=n9FTNkYSFYsAX9yERBu&_nc_ht=scontent.fhan9-1.fna&oh=03_AVLy6brqwFn02ByDjEq8zd1KUMERnzTbwbc0vnkA5Vz-cg&oe=62FD1D56\"><br><br>\n"
                    + "                        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.fhan9-1.fna.fbcdn.net/v/t1.15752-9/294099320_5655533047810898_1909416988049908147_n.png?_nc_cat=107&ccb=1-7&_nc_sid=ae9488&_nc_ohc=bmppb5qU44AAX_bVbNu&_nc_ht=scontent.fhan9-1.fna&oh=03_AVIQv7U3y_PxY-FraZHfXqLuhC80EIFGygYfoOhVpdM5fg&oe=62FB96EA\">"
                    + "<h3 style=\"font-weight:normal;margin:0;font-size:20px;margin-bottom:25px\">\n"
                    + "            Bạn có thể thanh toán tại nhà bằng phương thức thanh toán COD\n"
                    + "        </h3>\n"
                    + "    </center>\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<table style=\"border-spacing:0;border-collapse:collapse;width:100%;border-top:1px solid #e5e5e5\">\n"
                    + "    <tbody>\n"
                    + "        <tr>\n"
                    + "            <td style=\"padding:40px 0\">\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<table style=\"border-spacing:0;border-collapse:collapse;width:100%;border-top:1px solid #e5e5e5\">\n"
                    + "    <tbody>\n"
                    + "        <tr>\n"
                    + "            <td style=\"padding:35px 0\">\n"
                    + "    <center>\n"
                    + "        <table\n"
                    + "            style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\n"
                    + "            <tbody>\n"
                    + "                <tr>\n"
                    + "                    <td style=\"\">\n"
                    + "                        <p style=\"margin:0;color:#999;line-height:150%;font-size:14px\">\n"
                    + "                            Nếu\n"
                    + "                            bạn\n"
                    + "                            có\n"
                    + "                            bất\n"
                    + "                            cứ\n"
                    + "                            câu\n"
                    + "                            hỏi\n"
                    + "                            nào,\n"
                    + "                            đừng\n"
                    + "                            ngần\n"
                    + "                            ngại\n"
                    + "                            liên\n"
                    + "                            lạc\n"
                    + "                            với\n"
                    + "                            chúng\n"
                    + "                            tôi\n"
                    + "                            tại\n"
                    + "                            <a href=\"mailto:thevapeclub@helix.com.vn\"\n"
                    + "                               style=\"font-size:14px;text-decoration:none;color:#1666a2\"\n"
                    + "                               target=\"_blank\">sonntthe151167@fpt.edu.vn</a>\n"
                    + "                        </p>\n"
                    + "                    </td>\n"
                    + "                </tr>\n"
                    + "            </tbody>\n"
                    + "        </table>\n"
                    + "    </center>\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<img src=\"https://ci4.googleusercontent.com/proxy/AkPYSwbfCTPpa9UY2iemTt-8uuNCxd9wMi-MxiDXCwCclRn4IrvavPQy53Rok8pDmYePvpYw7glbcjctupZqDJjD9WVBMoR1vQ=s0-d-e1-ft#http://hstatic.net/0/0/global/notifications/spacer.png\"\n"
                    + "     height=\"0\" style=\"min-width:600px;height:0\" class=\"CToWUd\">\n"
                    + "</body>\n"
                    + "</html>";
            String password = "nguyenquang0208";
            SendMailOK.send(smtpServer, to, from, password, subject, body);

        } catch (Exception ex) {
            System.out.println("Usage: " + ex.getMessage());
        }
        request.setAttribute("notification", "Hãy kiểm tra hòm thư của bạn");

        request.getRequestDispatcher("cartCompletion.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
