#!/bin/bash

# Update the system
dnf update -y

# Install Apache (httpd on Amazon Linux)
dnf install -y httpd

# Start Apache and enable it on boot
systemctl start httpd
systemctl enable httpd

# Create the website
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Armond | AWS Cloud Student</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #050505, #111827);
            color: #f3f4f6;
        }

        header {
            background-color: #0b1220;
            text-align: center;
            padding: 70px 20px;
            border-bottom: 3px solid #b91c1c;
        }

        header h1 {
            margin: 0;
            font-size: 3.2em;
            color: #ef4444;
        }

        header p {
            margin-top: 15px;
            font-size: 1.2em;
            color: #d1d5db;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 20px;
        }

        section {
            background-color: #111827;
            margin-bottom: 30px;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 0 18px rgba(0, 0, 0, 0.35);
            border-left: 6px solid #dc2626;
        }

        h2 {
            color: #ef4444;
            margin-top: 0;
        }

        p, li {
            font-size: 1.05em;
            line-height: 1.7;
            color: #e5e7eb;
        }

        ul {
            padding-left: 20px;
        }

        img {
            width: 180px;
            display: block;
            margin: 20px auto;
            background-color: white;
            padding: 10px;
            border-radius: 12px;
        }

        .contact-box {
            background-color: #0f172a;
            padding: 15px;
            border-radius: 10px;
        }

        footer {
            text-align: center;
            padding: 25px;
            background-color: #0b1220;
            color: #9ca3af;
            border-top: 2px solid #b91c1c;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Hi, My name is Armond </h1>
        <p>Cloud Foundations Student | Still learning AWS</p>
    </header>

    <div class="container">
        <section>
            <h2>About Me</h2>
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Amazon_Web_Services_Logo.svg/320px-Amazon_Web_Services_Logo.svg.png" alt="AWS Logo">
            <p>
                I am a college student currently learning cloud computing through the TheoWAF Cloud Foundations program.
                The web application is hosted on an AWS EC2 instance and deployed automatically using a Bash startup script.
            </p>
        </section>

        <section>
            <h2>Project Description</h2>
            <p>
                This project demonstrates Linux automation using EC2 User Data. When the instance launches,
                the startup script automatically configures the web server and deploys a static HTML page.
            </p>
            <ul>
                <li>Updates the system packages</li>
                <li>Installs the Apache web server</li>
                <li>Creates and writes a custom HTML page</li>
                <li>Starts and enables Apache at boot</li>
                <li>Serves the webpage publicly over HTTP</li>
            </ul>
        </section>

        <section>
            <h2>Contact</h2>
            <div class="contact-box">
                <p><strong>GitHub:</strong> github.com/YOUR_USERNAME</p>
                <p><strong>Program:</strong> TheoWAF Cloud Foundations</p>
                <p><strong>Platform:</strong> AWS EC2 on Amazon Linux</p>
            </div>
        </section>
    </div>

    <footer>
        <p>Hosted on AWS EC2 | Deployed with Bash User Data | Lab 2</p>
    </footer>
</body>
</html>
EOF

# Restart Apache
systemctl restart httpd