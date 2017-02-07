class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

      if @member.save
        flash[:success] = "Se agregó exitosamente el registro del Notario."
        redirect_to @member
      else
        render :new
      end

  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
      if @member.update(member_params)
        flash[:success] = "Se actualizó exitosamente el registro del Notario."
        redirect_to @member
      else
        render :edit
      end

  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    flash[:success] = "Se eliminó exitosamente el registro del Notario."
    redirect_to members_url

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:numero, :nombre, :email, :fechaNacimiento, :presidente)
    end
end
