class ApplicationMailer < ActionMailer::Base
  default from: Email.new('notificaciones@colegionotariosaguascalientes.com')
  layout 'mailer'
end
