class ClasesOfrezcosController < ApplicationController
  before_action :set_clases_ofrezco, only: [:show, :edit, :update, :destroy]
  before_action :set_room, only: [:new, :update, :create, :destroy, :show]
  before_action :set_campu, only: [:new, :update, :create, :destroy, :show]
  before_action :set_curso, only: [:new, :update, :create, :destroy, :show]

  # GET /clases_ofrezcos
  # GET /clases_ofrezcos.json
  def index
    @clases_ofrezcos = ClasesOfrezco.all
  end

  # GET /clases_ofrezcos/1
  # GET /clases_ofrezcos/1.json
  def show
  end

  # GET /clases_ofrezcos/new
  def new
    @clases_ofrezco = ClasesOfrezco.new
  end

  # GET /clases_ofrezcos/1/edit
  def edit
  end

  # POST /clases_ofrezcos
  # POST /clases_ofrezcos.json
  def create
    if not @curso
      @kurso = Curso.find(params[:clases_ofrezco][:curso_sel])
      termino = "#{params[:clases_ofrezco]['termino(1i)']}-#{params[:clases_ofrezco]['termino(2i)']}-#{params[:clases_ofrezco]['termino(3i)']} #{params[:clases_ofrezco]['termino(4i)']}:#{params[:clases_ofrezco]['termino(5i)']}"
      termino = DateTime.parse(termino)
      inicio = "#{params[:clases_ofrezco]['inicio(1i)']}-#{params[:clases_ofrezco]['inicio(2i)']}-#{params[:clases_ofrezco]['inicio(3i)']} #{params[:clases_ofrezco]['inicio(4i)']}:#{params[:clases_ofrezco]['inicio(5i)']}"
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
      @clases_ofrezco = @room.clases_ofrezcos.create(cid: @kurso.id, inicio: inicio, termino: termino,
        room_id: params[:clases_ofrezco][:room_id], precio: params[:clases_ofrezco][:precio], uid: current_user.id, validacion: val)

      respond_to do |format|
        if @clases_ofrezco.save
          format.html { redirect_to campu_room_clases_ofrezco_path(@campu, @room, @clases_ofrezco), notice: 'Clases ofrezco was successfully created.' }
          format.json { render :show, status: :created, location: @clases_ofrezco }
        else
          format.html { render :new }
          format.json { render json: @clases_ofrezco.errors, status: :unprocessable_entity }
        end
      end
    end

    if not @room
      @rum = Room.find(params[:clases_ofrezco][:room_sel])
      termino = "#{params[:clases_ofrezco]['termino(1i)']}-#{params[:clases_ofrezco]['termino(2i)']}-#{params[:clases_ofrezco]['termino(3i)']} #{params[:clases_ofrezco]['termino(4i)']}:#{params[:clases_ofrezco]['termino(5i)']}"
      termino = DateTime.parse(termino)
      inicio = "#{params[:clases_ofrezco]['inicio(1i)']}-#{params[:clases_ofrezco]['inicio(2i)']}-#{params[:clases_ofrezco]['inicio(3i)']} #{params[:clases_ofrezco]['inicio(4i)']}:#{params[:clases_ofrezco]['inicio(5i)']}"
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
      @clases_ofrezco = @rum.clases_ofrezcos.create(cid: @curso.id, inicio: inicio, termino: termino,
      room_id: params[:clases_ofrezco][:room_id], precio: params[:clases_ofrezco][:precio], uid: current_user.id, validacion: val)

      respond_to do |format|
        if @clases_ofrezco.save
          format.html { redirect_to curso_clases_ofrezco_path(@curso, @clases_ofrezco), notice: 'Clases ofrezco was successfully created.' }
          format.json { render :show, status: :created, location: @clases_ofrezco }
        else
          format.html { render :new }
          format.json { render json: @clases_ofrezco.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /clases_ofrezcos/1
  # PATCH/PUT /clases_ofrezcos/1.json
  def update
    if not @curso
      @curso = Curso.find(params[:clases_ofrezco][:curso_sel])
      @clases_ofrezco.update(cid: @curso.id, hora_termino: params[:clases_ofrezco][:hora_termino], room_id: @room.id, precio: params[:clases_ofrezco][:precio], uid: current_user.id)
      @clases_ofrezco.save
      redirect_to campu_room_path(@campu, @room)
    elsif not @room
      @room = Room.find(params[:clases_ofrezco][:room_sel])
      @clases_ofrezco.update(cid: @curso.id, hora_termino: params[:clases_ofrezco][:hora_termino], room_id: @room.id, precio: params[:clases_ofrezco][:precio], uid: current_user.id)
      @clases_ofrezco.save
      redirect_to curso_path(@curso)
    end
  end

  # DELETE /clases_ofrezcos/1
  # DELETE /clases_ofrezcos/1.json
  def destroy
    @clases_ofrezco.destroy
    if not @curso
      respond_to do |format|
        format.html { redirect_to campu_room_path(@campu, @room), notice: 'Clases ofrezco was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    if not @room
      respond_to do |format|
        format.html { redirect_to curso_path(@curso), notice: 'Clases ofrezco was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clases_ofrezco
      @clases_ofrezco = ClasesOfrezco.find(params[:id])
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
    def clases_ofrezco_params
      params.require(:clases_ofrezco).permit(:uid, :precio, :hora_termino)
    end
end
