class ClasesBuscosController < ApplicationController
  before_action :set_clases_busco, only: [:show, :edit, :update, :destroy]
  before_action :set_room, only: [:new, :update, :create, :destroy, :show]
  before_action :set_campu, only: [:new, :update, :create, :destroy, :show]
  before_action :set_curso, only: [:new, :update, :create, :destroy, :show]

  # GET /clases_buscos
  # GET /clases_buscos.json
  def index
    @clases_buscos = ClasesBusco.all
  end

  # GET /clases_buscos/1
  # GET /clases_buscos/1.json
  def show
  end

  # GET /clases_buscos/new
  def new
    @clases_busco = ClasesBusco.new
  end

  # GET /clases_buscos/1/edit
  def edit
  end

  # POST /clases_buscos
  # POST /clases_buscos.json
  def create
    if not @curso
      @kurso = Curso.find(params[:clases_busco][:curso_sel])
      termino = "#{params[:clases_busco]['termino(1i)']}-#{params[:clases_busco]['termino(2i)']}-#{params[:clases_busco]['termino(3i)']} #{params[:clases_busco]['termino(4i)']}:#{params[:clases_busco]['termino(5i)']}"
      termino = DateTime.parse(termino)
      inicio = "#{params[:clases_busco]['inicio(1i)']}-#{params[:clases_busco]['inicio(2i)']}-#{params[:clases_busco]['inicio(3i)']} #{params[:clases_busco]['inicio(4i)']}:#{params[:clases_busco]['inicio(5i)']}"
      inicio = DateTime.parse(inicio)
      val = true
      @room.sala_ocupadas.each do |so|
        if so.inicio < inicio and inicio < so.termino
          val = false
          break
        elsif so.inicio < termino and termino < so.termino
          val = false
          break
        end
      end

      @clases_busco = @room.clases_buscos.create(cid: @kurso.id, inicio: inicio, termino: termino,
      room_id: params[:clases_busco][:room_id], validacion: val)

      respond_to do |format|
        if @clases_busco.save
          format.html { redirect_to campu_room_clases_busco_path(@campu, @room, @clases_busco), notice: 'Clases busco was successfully created.' }
          format.json { render :show, status: :created, location: @clases_busco }
        else
          format.html { render :new }
          format.json { render json: @clases_busco.errors, status: :unprocessable_entity }
        end
      end
    end

    if not @room
      @rum = Room.find(params[:clases_busco][:room_sel])
      termino = "#{params[:clases_busco]['termino(1i)']}-#{params[:clases_busco]['termino(2i)']}-#{params[:clases_busco]['termino(3i)']} #{params[:clases_busco]['termino(4i)']}:#{params[:clases_busco]['termino(5i)']}"
      termino = DateTime.parse(termino)
      inicio = "#{params[:clases_busco]['inicio(1i)']}-#{params[:clases_busco]['inicio(2i)']}-#{params[:clases_busco]['inicio(3i)']} #{params[:clases_busco]['inicio(4i)']}:#{params[:clases_busco]['inicio(5i)']}"
      inicio = DateTime.parse(inicio)
      val = true
      @rum.sala_ocupadas.each do |so|
        if so.inicio < inicio and inicio < so.termino
          val = false
          break
        elsif so.inicio < termino and termino < so.termino
          val = false
          break
        end
      end

      @clases_busco = @rum.clases_buscos.create(cid: @curso.id, inicio: inicio, termino: termino,
      room_id: params[:clases_busco][:room_id], validacion: val)

      respond_to do |format|
        if @clases_busco.save
          format.html { redirect_to curso_clases_busco_path(@curso, @clases_busco), notice: 'Clases busco was successfully created.' }
          format.json { render :show, status: :created, location: @clases_busco }
        else
          format.html { render :new }
          format.json { render json: @clases_busco.errors, status: :unprocessable_entity }
        end
      end
    end
    @join_evento = JoinClasesBusco.new(uid: current_user.id , eid: @clases_busco.id)
    @join_evento.save
  end

  # PATCH/PUT /clases_buscos/1
  # PATCH/PUT /clases_buscos/1.json
  def update
    if not @curso
      @curso = Curso.find(params[:clases_busco][:curso_sel])
      @clases_busco.update(cid: @curso.id, hora_termino: params[:clases_busco][:hora_termino], room_id: @room.id)
      @clases_busco.save
      redirect_to campu_room_path(@campu, @room)
    elsif not @room
      @room = Room.find(params[:clases_busco][:room_sel])
      @clases_busco.update(cid: @curso.id, hora_termino: params[:clases_busco][:hora_termino], room_id: @room.id)
      @clases_busco.save
      redirect_to curso_path(@curso)
    end
  end

  # DELETE /clases_buscos/1
  # DELETE /clases_buscos/1.json
  def destroy
    @clases_busco.destroy
    if not @curso
      respond_to do |format|
        format.html { redirect_to campu_room_path(@campu, @room), notice: 'Clases busco was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    if not @room
      respond_to do |format|
        format.html { redirect_to curso_path(@curso), notice: 'Clases busco was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clases_busco
      @clases_busco = ClasesBusco.find(params[:id])
    end

    def set_room
      if params[:room_id]
        @room = Room.find(params[:room_id])
      end
    end

    def set_campu
      if params[:campu_id]
        @campu = Campu.find(params[:campu_id])
      end
    end

    def set_curso
      if params[:curso_id]
        @curso = Curso.find(params[:curso_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clases_busco_params
      params.require(:clases_busco).permit(:curso, :hora_termino)
    end
end
