<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Not Found</title>
    <style>
        /* Base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #333;
            overflow: hidden;
        }
        
        .container {
            text-align: center;
            padding: 2rem;
            max-width: 600px;
            width: 90%;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }
        
        /* Error number animation */
        .error-number {
            font-size: 8rem;
            font-weight: bold;
            color: #4a6ee0;
            margin-bottom: 1rem;
            position: relative;
            animation: bounce 2s ease infinite;
            text-shadow: 2px 2px 8px rgba(74, 110, 224, 0.3);
        }
        
        /* Message styling with animation */
        .error-message {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: #333;
            animation: slideIn 1s ease-out;
        }
        
        .error-description {
            font-size: 1.1rem;
            margin-bottom: 2rem;
            color: #666;
            line-height: 1.6;
            animation: fadeIn 1.5s ease-in-out;
        }
        
        /* Button styling with animation */
        .home-button {
            display: inline-block;
            padding: 12px 30px;
            background-color: #4a6ee0;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            animation: pulse 2s infinite;
            box-shadow: 0 5px 15px rgba(74, 110, 224, 0.4);
        }
        
        .home-button:hover {
            background-color: #3a5bbf;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(74, 110, 224, 0.6);
            animation: none;
        }
        
        /* Decorative elements */
        .circles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }
        
        .circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(74, 110, 224, 0.1);
            animation: float 8s infinite;
        }
        
        .circle:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }
        
        .circle:nth-child(2) {
            width: 120px;
            height: 120px;
            top: 70%;
            left: 80%;
            animation-delay: 1s;
            animation-duration: 10s;
        }
        
        .circle:nth-child(3) {
            width: 60px;
            height: 60px;
            top: 30%;
            left: 80%;
            animation-delay: 2s;
            animation-duration: 6s;
        }
        
        .circle:nth-child(4) {
            width: 100px;
            height: 100px;
            top: 80%;
            left: 20%;
            animation-delay: 1.5s;
            animation-duration: 9s;
        }
        
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes slideIn {
            from {
                transform: translateY(-30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        
        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-15px);
            }
        }
        
        @keyframes pulse {
            0% {
                transform: scale(1);
                box-shadow: 0 5px 15px rgba(74, 110, 224, 0.4);
            }
            50% {
                transform: scale(1.05);
                box-shadow: 0 5px 20px rgba(74, 110, 224, 0.6);
            }
            100% {
                transform: scale(1);
                box-shadow: 0 5px 15px rgba(74, 110, 224, 0.4);
            }
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0) translateX(0);
            }
            25% {
                transform: translateY(-20px) translateX(10px);
            }
            50% {
                transform: translateY(0) translateX(20px);
            }
            75% {
                transform: translateY(20px) translateX(10px);
            }
        }
        
        /* Responsive styles */
        @media (max-width: 768px) {
            .error-number {
                font-size: 6rem;
            }
            
            .error-message {
                font-size: 1.5rem;
            }
            
            .error-description {
                font-size: 1rem;
            }
        }
        
        @media (max-width: 480px) {
            .error-number {
                font-size: 4rem;
            }
            
            .error-message {
                font-size: 1.2rem;
            }
            
            .container {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="circles">
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
    </div>
    
    <div class="container">
        <div class="error-number">404</div>
        <h1 class="error-message">Page Not Found</h1>
        <p class="error-description">
            Oops! The page you're looking for seems to have gone on vacation.
            It might be exploring the digital wilderness or just hiding from the internet.
        </p>
        <a href="<%= request.getContextPath() %>/" class="home-button">Return Home</a>
        
        <%-- Optional: Display timestamp for logging purposes --%>
        <% if(false) { %>
            <p style="margin-top: 2rem; font-size: 0.8rem; color: #999;">
                Error occurred at: <%= new Date() %>
            </p>
        <% } %>
    </div>
</body>
</html>
