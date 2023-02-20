# README

API routes:

login: POST http://localhost:3000/login

формат данных:
          {
          "user":
               {
               "username": "ked1",
               "password": "123456"
               }
          }               


register: POST http://localhost:3000/register

формат данных:
         {
          "user":
              {
              "username": "ked1",
              "password": "123456",     
              "password_confirmation": "12345"
              }
         }    

logout: DELETE http://localhost:3000/logout

