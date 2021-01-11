class LicenciasController < ApplicationController
  # before_action :set_licencia
  # before_action :set_member, only: [:new, :create]
  # before_action :set_secuencia, only: [:create]

  def index
  end

  def new
    @member = Member.find_by(id: params[:member_id])
    @licencia = @member.licencias.new
    
  end

  def create
    @member = Member.find_by(id: params[:licencia][:member_id])
    # ultimo_en_secuencia = @member.licencias.any? ? @member.licencias.last.secuencia : 0
    @licencia = @member.licencias.build(licencia_params)
    # @licencia.secuencia = ultimo_en_secuencia + 1

    if @licencia.save
      flash[:success] = "Se ha registrado exitosamente la Licencia."
      redirect_to members_path
    else
      render :new
    end
  end
  

  def show
  end

  private

    def licencia_params
      params.require(:licencia).permit(:inicio, :final, :member_id, :secuencia)
    end
    
  
end
