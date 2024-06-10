<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>3G_INFOTECH</title>
<style>
    
body {
	font-family: 'lato', sans-serif;
}

.container {
	max-width: 1000px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 10px;
	padding-right: 10px;
}

.responsive-table {li { border-radius:3px;
	padding: 25px 30px;
	display: flex ;
	justify-content: space-between;
	margin-bottom: 25px;
}

.table-header {
	background-color: #95A5A6;
	font-size: 14px;
	text-transform: uppercase;
	letter-spacing: 0.03em;
}

.table-row {
	background-color: #ffffff;
	box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
}

.col-1 {
	flex-basis: 10%;
}

.col-2 {
	flex-basis: 20%;
}

.col-3 {
	flex-basis: 40%;
}

.col-4 {
	flex-basis: 10%;
}
.col-5 {
	flex-basis: 10%;
}
.col-6 {
	flex-basis: 10%;
}
}
#button:hover{
    background-color: rgb(93,97,101); 

}
</style>
</head>
<body style="background-color: rgb(213, 216, 220);">
	<nav class="navbar navbar-expand-lg navbar-light "
		style="display: flex; background-color: rgb(94, 165, 237);">
		<div class="container-fluid" style="width: 90%;">
			<img alt="" src="./image/logoYT-removebg-preview.png"
				style="height: 70px;">
		</div>
		<div>
			<button class="bg-blue-500 text-white py-2 px-4  "
				style="margin-top: 30px; border-radius: 2cap; margin-bottom: 10px; margin-right: 50px;"
				onclick="window.location.href='index.html'">Logout</button>

		</div>
	</nav>
	<div class="min-h-screen flex">

		<div class="w-64 bg-dark text-white flex flex-col items-center py-4">
                        <% String id = (String) session.getAttribute("userid");%>
                         <img class="rounded-full mb-4" src="displayImage?id=<%=id %>"  style="height: 100px; widht: 100px; backgroung-color: white;" alt="User Photo">
		       
        <span class="text-xl font-semibold mb-4">Test User</span>
        <nav class="flex flex-col w-full px-4">
            <a href="home.jsp" class="flex items-center py-2 px-4  rounded" id="button">
                <span class="material-icons">grid_view</span> <span class="ml-2">Home</span>
            </a> 
            <a href="createform.jsp" class="flex items-center py-2 px-4 rounded mt-2" id="button">
                <span class="material-icons">add_circle</span> <span class="ml-2">Create Form</span>
            </a> 
            <a href="#" class="flex items-center py-2 px-4 bg-cyan-500  rounded mt-2">
                <span class="material-icons">list</span> <span class="ml-2">List of Forms</span>
            </a>
        </nav>
    </div>
		<div class="flex-1 p-6 ">
			<div class="container">

				<ul class="responsive-table">
					<li class="table-header">
						<div class="col col-1">#</div>
						<div class="col col-2">From_TITLE</div>
						<div class="col col-3">DESCRIPTION</div>
						<div class="col col-4">PREVIEW</div>
						<div class="col col-5">SHARE LINK</div>
						<div class="col col-6">QRCODE</div>
					</li>

					<%
					String url = "jdbc:mysql://localhost:3306/y";
					String user = "root";
					String password = "@admin123";
					//String id = (String) session.getAttribute("userid");
					Connection conn = null;
					ResultSet rs = null;
					Statement stmt = null;
					int i = 1;
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection(url, user, password);
						String sql = "SELECT * FROM form WHERE id=?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();

						while (rs.next()) {

							String title = rs.getString("form_title");
							String desct = rs.getString("desct");
					%>
					<li class="table-row">
					<div class="col col-1" data-label="Job Id"><%=i++%></div>
						<div class="col col-2" data-label="Job Id"><%=title%></div>
						<div class="col col-3" data-label="Customer Name"><%=desct%></div>
						<div class="col col-4" data-label="Amount"><a href="Preview.jsp?qid=<%= rs.getString("question_id")%>"><i class="fa-solid fa-eye"></i></a></div>
						<div class="col col-5" data-label="Payment Status"><i class="fa-solid fa-link"></i></div>
						<div class="col col-6" data-label="Payment Status"><i class='fas fa-qrcode' style='font-size:36px'></i></div>
					</li>

					<%
					}
					} catch (Exception e) {
					out.println("<p>Error: " + e.getMessage() + "</p>");
					e.printStackTrace();
					}
					%>
					
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<script src="https://cdn.tailwindcss.com"></script>
</body>
</html>
