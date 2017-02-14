class MensajesController < ApplicationController
  before_action :set_message, only: [:edit, :update]

  def edit

  end

  def update
    if @mensaje.update(mensaje_params)
      flash[:success] = "Se actualizó exitosamente el mensaje de #{@mensaje.tipo}."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

    # Set the message to edit
    def set_message
      @mensaje = Mensaje.find_by(tipo: params[:tipo])
    end

    #Set strong params
    def mensaje_params
      params.require(:mensaje).permit(:tipo, :texto)
    end
end
