namespace :sendGridTest do
  
  desc "Send test email through sendGrid"
  task send_test: :environment do
    puts '***********************'
    puts 'Ejecutando task: sendGridTest@send_test'
    puts 'Enviando....'
    User.test_email
    puts 'Tarea terminada'
  end

end