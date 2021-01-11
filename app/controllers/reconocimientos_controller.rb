class ReconocimientosController < ApplicationController
  # Next line is wrong because in both cases @member is located at different place
  # before_action :set_member, only: [ :new, :create ]

  def index
  end

  def show
  end

  def edit
  end

  def new
    @member = Member.find_by(id: params[:member_id])
    @reconocimiento = @member.reconocimientos.new
  end

  def create
    @member = Member.find_by(id: params[:reconocimiento][:member_id])
    @reconocimiento = @member.reconocimientos.build(reconocimiento_params)

    if @reconocimiento.save
      flash[:success] = "Se ha registrado exitosamente el Reconocimiento."
      redirect_to members_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

    def reconocimiento_params
      params.require(:reconocimiento).permit(:reconocimiento, :servicio_reconocido, :member_id)
    end
end
