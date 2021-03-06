class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  before_action :set_room, only: [:show, :new, :update, :create, :destroy, :edit]
  before_action :set_campu, only: [:show, :new, :update, :create, :destroy, :edit]

  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)
    @evento.room_id = @room.id

    respond_to do |format|
      if @evento.save
        format.html { redirect_to campu_room_evento_path(@campu, @room, @evento), notice: 'Evento was successfully created.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update evento_params
        format.html { redirect_to campu_room_evento_path(@campu, @room, @evento), notice: 'Evento was successfully updated.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    JoinEvent.where(:eid => @evento.id).destroy_all
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to campu_room_path(@campu, @room), notice: 'Evento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end


    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_campu
      @campu = Campu.find(params[:campu_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:fecha_creacion, :tipo)
    end
end
