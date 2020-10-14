class ReservasController < ApplicationController
  before_action :set_reserva, only: [:show, :edit, :update, :destroy]

  # GET /reservas
  # GET /reservas.json
  def index
    @reservas = Reserva.all

  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show

    @sala = Sala.joins("INNER JOIN reservas ON reservas.sala_id = salas.id
                        WHERE reservas.id = #{params[:id]}")
                .select('salas.descricao')

    @user = User.joins("INNER JOIN reservas ON reservas.user_id = users.id
                        WHERE reservas.id = #{params[:id]}")
                .select('users.email')                

  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
    @salas = Sala.all
    @users = User.where(email: current_user.email)
  end

  # GET /reservas/1/edit
  def edit
    @salas = Sala.includes(:reservas).where(reservas: { id: params[:id] }).select('descricao')
    @users = User.where(email: current_user.email)

  end

  # POST /reservas
  # POST /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to @reserva, notice: 'Reserva was successfully created.' }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1
  # PATCH/PUT /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to @reserva, notice: 'Reserva was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: 'Reserva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:evento, :inicio, :termino, :sala_id, :user_id)
    end
end