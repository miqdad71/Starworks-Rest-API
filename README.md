# android2-backend
Beginner &amp; Intermediate Backend
<h1 align="center">ExpressJS - #StarworkS</h1>

#StarworkS merupakan aplikasi untuk perekrutan software engineer baik itu web developer, android developer, ataupun lainnya.
API StarworkS ini dibuat untuk menangani backend dari request client ke server.. 

[More about Express](https://en.wikipedia.org/wiki/Express.js)

## Built With

[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.14.15.0-green.svg?style=rounded-square)](https://nodejs.org/)

## Requirements

1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## How to run the app ?

1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name #nama_database, and Import file sql to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url.(ex. localhost:4000/)
8. You can see all the end point [here](#end-point)

## Set up .env file

Open .env file on your favorite code editor, and copy paste this code below :

```
DB_HOST = YOUR_DB_HOST
DB_USER = YOUR_DB_USER
DB_PASSWORD = YOUR_DB_PASSWORD
DB_DATABASE = YOUR_DATABASE
PORT = YOUR_PORT
JWT_KEY = YOUR_JWT_KEY


example:
DB_HOST     = localhost
DB_USER     = root
DB_PASS     = 
DB_DATABASE = starworks
PORT        = 4000
JWT_KEY     = ARKAANDROID
```

# Link Postman : 
https://documenter.getpostman.com/view/13426001/TVetc6jx


<!-- ## End-Point

 ```
1. Account
    - Login Account [POST]
      http://localhost/4000/account/login

    - Registrasi Engineer / Company [POST]
      http://localhost/4000/account

    - Update Account [PUT]
      http://localhost/4000/account

2. Enginner
    - List Engineer [GET]
      http://localhost/4000/engineer

    - Detail Engineer [GET]
      http://localhost/4000/engineer/detail/{id}

    - Update Engineer [PUT]
      http://localhost/4000/engineer/{id}

3. Company
    - List Company [GET]
      http://localhost/4000/company

    - Detail Company [GET]
      http://localhost/4000/company/detail/{id}

    - Update Company [PUT]
      http://localhost/4000/company/{id}

4. Skill
    - Add Skill [POST]
      http://localhost/4000/skill
    
    - List Skill [GET]
      http://localhost/4000/skill

    - Detail Skill [GET]
      http://localhost/4000/skill/detail/{id}

    - Update Skill [PUT]
      http://localhost/4000/skill/{id}

    - Delete Skill [DELETE]
      http://localhost/4000/skill/{id}

5. Experience
    - Add Experience [POST]
      http://localhost/4000/experience

    - List Experience [GET]
      http://localhost/4000/experience

    - Detail Experience [GET]
      http://localhost/4000/experience/{id}

    - Update Experience [PUT]
      http://localhost/4000/experience/{id}

    - Delete Experience [DELETE]
      http://localhost/4000/experience/{id}

6. Portfolio
    - Add Portfolio [POST]
      http://localhost/4000/portfolio

    - List Portfolio [GET]
      http://localhost/4000/portfolio
    
    - Detail Portfolio [GET]
      http://localhost/4000/portfolio/{id}

    - Update Portfolio [PUT]
      http://localhost/4000/portfolio/{id}

    - Delete Portfolio [DELETE]
      http://localhost/4000/portfolio/{id}

7. Project
    - Add Project [POST]
      http://localhost/4000/project

    - List Project [GET]
      http://localhost/4000/project

    - Detail Project [GET]
      http://localhost/4000/project/{id}

    - Update Project [PUT]
      http://localhost/4000/project/{id}

    - Delete Project [DELETE]
      http://localhost/4000/project/{id}

8. Hire
    - Hiring Proccess [POST]
      http://localhost/4000/hire

    - List Hire From Engineer [GET]
      http://localhost/4000/hire/engineer/{id}

    - List Hire From Project [GET]
      http://localhost/4000/hire/project/{id}

    - Update Status Hire [PUT]
      http://localhost/4000/hire/{id}
``` -->
