# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do\
#добавляем конфигурацию CORS middleware перед всеми другими middleware.
  allow do #разрешаем доступ.
    origins 'http://localhost:8080' #определяем разрешенные источники, которые могут отправлять запросы на сервер.
    #определяем все ресурсы, доступные для этого разрешенного источника.
    #разрешаем любые заголовки в запросе.
    #определяем разрешенные HTTP-методы для запросов.
    #разрешаем передавать куки и авторизационные заголовки.
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end