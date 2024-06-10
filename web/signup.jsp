<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
        *{
            margin:0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }
        body{
            background: #dfe9f5;
        }
        
        .wrapper{
            width: 330px;
            padding:2rem 1rem;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            text-align: center;
            box-shadow:0 20px 35px rgba(0, 0,0, 0.1)
        }
        h1{
            font-size: 2rem;
            color: #07001f;
            margin-bottom: 1.2rem;
        }
        form input{
            width:92%;
            outline: none;
            border: 1px solid #fff;
            padding: 12px 20px ;
            margin-bottom: 10px;
            border-radius: 20px;
            background: #e4e4e4;
        }
        button{
            font-size: 1rem;
            margin-top: 1.8rem;
            border-radius: 20px;
            padding: 10px 0;
            outline: none;
            border: none;
            width: 90%;
            color: #fff;
            cursor: pointer;
            background:rgb(17, 107, 143);
        }
        botton:hover{
            background:rgb(131, 190, 224);
        }
        input:focus{
            border: 1px solid rgb(192 , 192 ,192);
        }
        .terms{
            margin-top: 0.2rem;
        }
        .terms input{
            height: 1em;
            width: 1em;
            vertical-align: middle;
            cursor: pointer;
        }
        .terms lable{
            font-size: 0.8rem;
        }
        .terms a{
            color: rgb(17, 107, 143);
            text-decoration: none;
        }
        .member{
            font-size: 0.8rem;
            margin-top: 1.5rem;
            color: #636363;
        }
        .member a{
            color: rgb(17, 107, 143);
            text-decoration: none;
        }
    </style>
   
    </head>
    <body>
        <%
       
        String name = request.getParameter("uname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String cpass= request.getParameter("cpass");
        String company = " ";
        String branchname = " ";
        String address = " ";
        String contact = " ";
        
        
        if(pass.equals(cpass)){
             String url = "jdbc:mysql://localhost:3306/y"; 
            String user = "root"; 
            String password = "@admin123"; 

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
             Statement stmt = null;
            try {
            Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection to the database
                conn = DriverManager.getConnection(url, user, password);
               
                String sql = "SELECT Email FROM login_data";

                // Create the Statement
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                boolean Cemail  = true;
                  while (rs.next()){
                    String id = rs.getString("email");
                       if(email.equals(id)){
                        Cemail=false;
                       break;
                    }
                 }
                
                if(!Cemail){
                %><script>
        alert("Already Register");
        </script>
        <jsp:include page="Signup.html" ></jsp:include>
        <%
                }
                else{
                String query = "INSERT INTO login_data (name, email,password , companyname , branchname , address ,contact) VALUES (?, ?,? ,?,?,?,?)";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, pass);
                pstmt.setString(4, company);
                pstmt.setString(5, branchname);
                pstmt.setString(6, address);
                pstmt.setString(7, contact);
                int rows = pstmt.executeUpdate();

                if(rows >0){  
                %><script>
        alert("Registration successful!");
        </script>
        <jsp:include page="Signup.html" ></jsp:include>
<%       
           } }         
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
           }else{
            %><script>
        alert("password not same!");
        </script>
        <jsp:include page="Signup.html" ></jsp:include>
<%
      
            }
       %>
       
    
    </body>
</html>
