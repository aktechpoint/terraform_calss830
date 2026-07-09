#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

sudo rm -rf /var/www/html/index.nginx-debian.html
sudo rm -rf /var/www/html/index.html


cat <<'EOT' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Abhishek Singh | Full Stack Java & Python Developer</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,Helvetica,sans-serif;
}

body{
    background:#f4f4f4;
    color:#333;
}

header{
    background:#0d6efd;
    color:white;
    text-align:center;
    padding:70px 20px;
}

header h1{
    font-size:42px;
}

header p{
    margin-top:15px;
    font-size:20px;
}

.container{
    width:90%;
    max-width:1100px;
    margin:auto;
    padding:40px 0;
}

section{
    margin-bottom:40px;
}

h2{
    color:#0d6efd;
    margin-bottom:15px;
}

.skills{
    display:flex;
    flex-wrap:wrap;
    gap:10px;
}

.skill{
    background:#0d6efd;
    color:white;
    padding:10px 18px;
    border-radius:25px;
}

.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:20px;
}

.card{
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,.1);
}

footer{
    background:#222;
    color:white;
    text-align:center;
    padding:20px;
}

.btn{
    display:inline-block;
    margin-top:20px;
    background:white;
    color:#0d6efd;
    text-decoration:none;
    padding:12px 25px;
    border-radius:30px;
    font-weight:bold;
}

.btn:hover{
    background:#ddd;
}
</style>

</head>
<body>

<header>
<h1>Abhishek Singh</h1>
<p>Senior Full Stack Java & Python Developer | DevOps Engineer | Cloud Architect</p>

<a href="#contact" class="btn">Contact Me</a>

</header>

<div class="container">

<section>

<h2>About Me</h2>

<p>
Experienced Full Stack Developer with 10+ years of experience building
enterprise applications using Java, Spring Boot, Python, Django,
Angular, React, Kubernetes, Docker, AWS, Azure and PostgreSQL.
Experienced in designing scalable cloud-native applications,
CI/CD pipelines, microservices, and DevOps automation.
</p>

</section>

<section>

<h2>Technical Skills</h2>

<div class="skills">

<div class="skill">Java</div>
<div class="skill">Spring Boot</div>
<div class="skill">Python</div>
<div class="skill">Django</div>
<div class="skill">Angular</div>
<div class="skill">React</div>
<div class="skill">Node.js</div>
<div class="skill">Docker</div>
<div class="skill">Kubernetes</div>
<div class="skill">OpenShift</div>
<div class="skill">Terraform</div>
<div class="skill">AWS</div>
<div class="skill">Azure</div>
<div class="skill">Linux</div>
<div class="skill">Jenkins</div>
<div class="skill">GitHub Actions</div>
<div class="skill">PostgreSQL</div>
<div class="skill">MySQL</div>

</div>

</section>

<section>

<h2>Projects</h2>

<div class="cards">

<div class="card">
<h3>Government Portal</h3>
<p>
Developed scalable citizen service portal handling 50,000+
users daily using Spring Boot, Angular and PostgreSQL.
</p>
</div>

<div class="card">
<h3>Cloud Migration</h3>
<p>
Migrated enterprise applications to AWS with Docker,
Kubernetes, Terraform and CI/CD automation.
</p>
</div>

<div class="card">
<h3>DevOps Automation</h3>
<p>
Designed complete CI/CD pipelines using Jenkins,
GitHub Actions, Docker, Kubernetes and Terraform.
</p>
</div>

</div>

</section>

<section>

<h2>Experience</h2>

<p>
✔ 10+ Years Full Stack Development<br><br>
✔ Java & Spring Boot Development<br><br>
✔ Python & Django Development<br><br>
✔ Angular & React Frontend<br><br>
✔ Kubernetes & Docker Administration<br><br>
✔ AWS & Azure Cloud Infrastructure<br><br>
✔ Terraform Infrastructure as Code<br><br>
✔ PostgreSQL & MySQL Database Design
</p>

</section>

<section id="contact">

<h2>Contact</h2>

<p><strong>Email:</strong> your-email@example.com</p>

<p><strong>Phone:</strong> +91-XXXXXXXXXX</p>

<p><strong>LinkedIn:</strong> linkedin.com/in/yourprofile</p>

<p><strong>GitHub:</strong> github.com/yourusername</p>

</section>

</div>

<footer>

<p>© 2026 Abhishek Singh | All Rights Reserved</p>

</footer>

</body>
</html>
EOT


sleep 5
sudo systemctl restart nginx