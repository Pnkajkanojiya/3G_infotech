<%-- 
    Document   : createform
    Created on : Jun 5, 2024, 5:48:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tailwindcss.com"></script>
<title>3G_INFOTECH</title>
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    /* Basic styling for form */
    #menu:hover{
        background-color: rgb(182,181,181);
    }

form {
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    
}

h2 {
    font-size: 24px;
    margin-bottom: 20px;
}

label {
    font-weight: bold;
}

input[type="text"],
textarea,
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

select {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    padding: 10px 40px 10px 10px;
    background-color: #fff;
    background-image: url('data:image/svg+xml;utf8,<svg fill="#333" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
    background-repeat: no-repeat;
    background-position: right 10px top 50%;
}

button[type="button"],
input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 16px;
}

button[type="button"]:hover,
input[type="submit"]:hover {
    background-color: #0056b3;
}

/* Styling for added question */
.question {
    margin-bottom: 20px;
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 4px;
}

.input-container {
    margin-top: 10px;
}

.input-container label {
    font-weight: normal;
}

.input-container select {
    width: auto;
    padding: 8px;
    margin-right: 10px;
}

.input-container input[type="number"] {
    width: 60px;
}

.input-container select,
.input-container input[type="number"] {
    margin-top: 5px;
}
/* Add this CSS to styles.css */
.star-rating {
    unicode-bidi: bidi-override;
    direction: rtl;
    text-align: right;
    position: relative;
}
.star-rating input {
    display: none;
}
.star-rating label {
    display: inline-block;
    font-size: 25px;
    color: #ccc;
    cursor: pointer;
}
.star-rating label:before {
    content: '\2605';
    position: relative;
    z-index: 1;
}
.star-rating input:checked ~ label {
    color: #ffdf00;
}
.star-rating input:checked ~ label:before {
    content: '\2605';
    position: relative;
    z-index: 1;
}
.smiley-rating {
    display: flex;
    justify-content: space-between;
    font-size: 30px;
    color: #ccc;
    cursor: pointer;
}

/* Add this CSS to styles.css */
.question {
    margin-bottom: 20px;
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 4px;
}

.question-row {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    
   
}

.question-row label {
    flex: 1;
    margin-right: 10px;
}

.question-row select {
    width: 150px;
}

</style>
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
</head>
<body style="background-color: rgb(213, 216, 220);">

	<nav class="navbar navbar-expand-lg navbar-light "
		style="display: flex; background-color: rgb(94 165 237);">
		<div class="container-fluid" style="width: 90%;">
			<img alt="" src="./image/logoYT-removebg-preview.png"
				style="height: 70px; ">
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
            <a href="home.jsp" class="flex items-center py-2 px-4  rounded" id="menu">
                <span class="material-icons">grid_view</span> <span class="ml-2">Home</span>
            </a> 
            <a href="#" class="flex items-center py-2 px-4 bg-cyan-500 rounded mt-2">
                <span class="material-icons">add_circle</span> <span class="ml-2">Create Form</span>
            </a> 
            <a href="form_list.jsp" class="flex items-center py-2 px-4  rounded mt-2" id="menu">
                <span class="material-icons">list</span> <span class="ml-2">List of Forms</span>
            </a>
        </nav>
    </div>
		<div class="flex-1 p-6 " style="margin-right: 30%;  margin-left: 2cap; background-color: rgb(213, 216, 220 );">
			  <form id="questionForm" method="post" action="Form_submit.jsp" >
        <div>
            <label for="formTitle">Form Title:</label><br>
            <input type="text" id="formTitle" name="formTitle" required><br><br>
        </div>
        <div>
            <label for="formDescription">Form Description:</label><br>
            <textarea id="formDescription" name="formDescription" rows="4" cols="50" required></textarea><br><br>
        </div>
        <div id="questions">
            <div class="question">
                <div class="question-row1">
                    <label for="questionText">Question:</label><br>
                    <input type="text" name="question[]" required style="font-weight: bold;">
                </div>
                <div class="question-row" >
                   
                    <select name="questionType[]" onchange="showInput(this)" required>
                        <option value="rating">Star Rating</option>
                        <option value="smiley">Smiley Rating</option>
                        <option value="short_answer">Short Answer</option>
                    </select>
                </div>
                <i class="fa fa-trash" onclick="deleteQuestion(this)"></i>
            </div>
        </div>
        <button type="button" onclick="addQuestion()">Add Question</button><br><br>
        <input type="submit" value="Submit">
    </form>

		</div>
	</div>

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">
    <script>
        function addQuestion() {
            var questionsDiv = document.getElementById('questions');
            var questionCount = questionsDiv.querySelectorAll('.question').length;
            if (questionCount >= 5) {
                alert('You can only add a maximum of 5 questions.');
                return;
            }

            var newQuestion = document.createElement('div');
            newQuestion.classList.add('question');
            newQuestion.innerHTML = `
                <div class="question-row">
                    <label for="questionText">Question:</label<br>
                    <input type="text" name="question[]" required>
                </div>
                <div class="question-row">

                    <select name="questionType[]" onchange="showInput(this)" required>
                        <option value="rating">Star Rating</option>
                        <option value="smiley">Smiley Rating</option>
                        <option value="short_answer">Short Answer</option>
                    </select>
                </div>
               <i class="fa fa-trash" onclick="deleteQuestion(this)"></i>
            `;
            questionsDiv.appendChild(newQuestion);
        }

        function deleteQuestion(button) {
            var questionDiv = button.parentNode;
            questionDiv.parentNode.removeChild(questionDiv);
        }

        function showInput(select) {
            var questionType = select.value;
            var parentDiv = select.parentNode;
            var inputContainer = parentDiv.querySelector('.input-container');

            // Remove existing input elements
            if (inputContainer) {
                parentDiv.removeChild(inputContainer);
            }

            // Show input elements based on selected question type
            if (questionType === 'rating') {
                var ratingInput = document.createElement('div');
                ratingInput.classList.add('input-container');
                ratingInput.innerHTML = `
                   
                    <div class="star-rating">
                        <input type="radio" id="star5" name="rating" value="5">
                        <label for="star5"></label>
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4"></label>
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3"></label>
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2"></label>
                        <input type="radio" id="star1" name="rating" value="1">
                        <label for="star1"></label>
                    </div>
                `;
                parentDiv.appendChild(ratingInput);
            } else if (questionType === 'smiley') {
                var smileyInput = document.createElement('div');
                smileyInput.classList.add('input-container');
                smileyInput.innerHTML = `
                  
                    <div class="smiley-rating">
                        <span>&#128512;</span>
                        <span>&#128578;</span>
                        <span>&#128528;</span>
                        <span>&#128533;</span>
                        <span>&#128546;</span>
                    </div>
                `;
                parentDiv.appendChild(smileyInput);
            }
        }
    </script>
</body>
</html>