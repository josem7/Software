class SalaOcupadasController < ApplicationController
  before_action :set_sala_ocupada, only: [:show, :edit, :update, :destroy]
  before_action :set_room, only: [:new, :update, :create, :destroy, :show]
  before_action :set_campu, only: [:new, :update, :create, :destroy, :show]

  # GET /sala_ocupadas
  # GET /sala_ocupadas.json
  def index
    @sala_ocupadas = SalaOcupada.all
  end

  # GET /sala_ocupadas/1
  # GET /sala_ocupadas/1.json
  def show
  end

  # GET /sala_ocupadas/new
  def new
    @sala_ocupada = SalaOcupada.new
  end

  # GET /sala_ocupadas/1/edit
  def edit
  end

  # POST /sala_ocupadas
  # POST /sala_ocupadas.json
  def create
    termino = "#{params[:sala_ocupada]['termino(1i)']}-#{params[:sala_ocupada]['termino(2i)']}-#{params[:sala_ocupada]['termino(3i)']} #{params[:sala_ocupada]['termino(4i)']}:#{params[:sala_ocupada]['termino(5i)']}"
    termino = DateTime.parse(termino)
    inicio = "#{params[:sala_ocupada]['inicio(1i)']}-#{params[:sala_ocupada]['inicio(2i)']}-#{params[:sala_ocupada]['inicio(3i)']} #{params[:sala_ocupada]['inicio(4i)']}:#{params[:sala_ocupada]['inicio(5i)']}"
    inicio = DateTime.parse(inicio)
    @sala_ocupada = @room.sala_ocupadas.create(evento: params[:sala_ocupada][:evento], room_id: @room.id,
      inicio: inicio, termino: termino)

    respond_to do |format|
      if @sala_ocupada.save
        format.html { redirect_to campu_room_sala_ocupada_path(@campu, @room, @sala_ocupada), notice: 'Sala ocupada was successfully created.' }
        format.json { render :show, status: :created, location: @sala_ocupada }
      else
        format.html { render :new }
        format.json { render json: @sala_ocupada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sala_ocupadas/1
  # PATCH/PUT /sala_ocupadas/1.json
  def update
    respond_to do |format|
      if @sala_ocupada.update(sala_ocupada_params)
        format.html { redirect_to campu_room_sala_ocupada_path(@campu, @room, @sala_ocupada), notice: 'Sala ocupada was successfully updated.' }
        format.json { render :show, status: :ok, location: @sala_ocupada }
      else
        format.html { render :edit }
        format.json { render json: @sala_ocupada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sala_ocupadas/1
  # DELETE /sala_ocupadas/1.json
  def destroy
    @sala_ocupada.destroy
    respond_to do |format|
      format.html { redirect_to campu_room_path(@campu, @room), notice: 'Sala ocupada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala_ocupada
      @sala_ocupada = SalaOcupada.find(params[:id])
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_campu
      @campu = Campu.find(params[:campu_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sala_ocupada_params
      params.require(:sala_ocupada).permit(:sala, :evento, :hora_termino)
    end
end
