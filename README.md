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

формат данных:
         {
           "user_id": "2"
         }
user_logged_in? : GET http://localhost:3000/logged_in

формат данных:
        {
          "user_id": "2"
        }

create message: POST http://localhost:3000/create_message

формат данных:
       {
         "user_id": "1",
         "content": "text"
       }