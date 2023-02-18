# README

API routes:

login: POST http://localhost:3000/users/tokens/sign_in

нужен password и email

register: POST http://localhost:3000/users/tokens/sign_up

нужен password и email

refresh token: POST http://localhost:3000/users/tokens/refresh

header Authorization {Bearer refresh_token}