class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Bienvenido de vuelta #{user.name}"
      redirect_to root_path
    else
      flash.now[:danger] = 'Combinación no válida de email/password. Intente de nuevo.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
