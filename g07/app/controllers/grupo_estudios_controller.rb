class GrupoEstudiosController < ApplicationController
  before_action :set_grupo_estudio, only: [:show, :edit, :update, :destroy]
  before_action :set_room, only: [:new, :update, :edit, :create, :destroy, :show]
  before_action :set_campu, only: [:new, :update, :edit, :create, :destroy, :show]
  before_action :set_curso, only: [:new, :create, :edit, :show, :update, :destroy]

  # GET /grupo_estudios
  # GET /grupo_estudios.json
  def index
    @grupo_estudios = GrupoEstudio.all
  end

  # GET /grupo_estudios/1
  # GET /grupo_estudios/1.json
  def show
  end

  # GET /grupo_estudios/new
  def new
    @grupo_estudio = GrupoEstudio.new
  end

  # GET /grupo_estudios/1/edit
  def edit
    @grupo_estudio = GrupoEstudio.find(params[:id])
  end

  # POST /grupo_estudios
  # POST /grupo_estudios.json
  def create
    if not @curso
      @kurso = Curso.find(params[:grupo_estudio][:curso_sel])
      termino = "#{params[:grupo_estudio]['termino(1i)']}-#{params[:grupo_estudio]['termino(2i)']}-#{params[:grupo_estudio]['termino(3i)']} #{params[:grupo_estudio]['termino(4i)']}:#{params[:grupo_estudio]['termino(5i)']}"
      termino = DateTime.parse(termino)
      inicio = "#{params[:grupo_estudio]['inicio(1i)']}-#{params[:grupo_estudio]['inicio(2i)']}-#{params[:grupo_estudio]['inicio(3i)']} #{params[:grupo_estudio]['inicio(4i)']}:#{params[:grupo_estudio]['inicio(5i)']}"
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
      @grupo_estudio = @room.grupo_estudios.create(curso: @kurso.nombre, capacidad: params[:grupo_estudio][:capacidad],
        termino: termino, inicio: inicio, room_id: params[:grupo_estudio][:room_id], cid: @kurso.id, creador_id: current_user.id, validacion: val)
      respond_to do |format|
        if @grupo_estudio.save
          format.html { redirect_to campu_room_grupo_estudio_path(@campu, @room, @grupo_estudio), notice: 'Grupo estudio was successfully created.' }
          format.json { render :show, status: :created, location: @grupo_estudio }
        else
          format.html { render :new }
          format.json { render json: @grupo_estudio.errors, status: :unprocessable_entity }
        end
      end
    end

    if not @room
      @rum = Room.find(params[:grupo_estudio][:room_sel])
      termino = "#{params[:grupo_estudio]['termino(1i)']}-#{params[:grupo_estudio]['termino(2i)']}-#{params[:grupo_estudio]['termino(3i)']} #{params[:grupo_estudio]['termino(4i)']}:#{params[:grupo_estudio]['termino(5i)']}"
      termino = DateTime.parse(termino)
      inicio = "#{params[:grupo_estudio]['inicio(1i)']}-#{params[:grupo_estudio]['inicio(2i)']}-#{params[:grupo_estudio]['inicio(3i)']} #{params[:grupo_estudio]['inicio(4i)']}:#{params[:grupo_estudio]['inicio(5i)']}"
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
      @grupo_estudio = @rum.grupo_estudios.create(curso: @curso.nombre, capacidad: params[:grupo_estudio][:capacidad],
        termino: termino, inicio: inicio, room_id: params[:grupo_estudio][:room_id], cid: @curso.id, creador_id: current_user.id, validacion: val)

      respond_to do |format|
        if @grupo_estudio.save
          format.html { redirect_to curso_grupo_estudio_path(@curso, @grupo_estudio), notice: 'Grupo estudio was successfully created.' }
          format.json { render :show, status: :created, location: @grupo_estudio }
        else
          format.html { render :new }
          format.json { render json: @grupo_estudio.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /grupo_estudios/1
  # PATCH/PUT /grupo_estudios/1.json
  def update
    if not @curso
      @curso = Curso.find(params[:grupo_estudio][:curso_sel])
      termino = "#{params[:grupo_estudio]['termino(1i)']}-#{params[:grupo_estudio]['termino(2i)']}-#{params[:grupo_estudio]['termino(3i)']} #{params[:grupo_estudio]['termino(4i)']}:#{params[:grupo_estudio]['termino(5i)']}"
      termino = DateTime.parse(termino)
      inicio = "#{params[:grupo_estudio]['inicio(1i)']}-#{params[:grupo_estudio]['inicio(2i)']}-#{params[:grupo_estudio]['inicio(3i)']} #{params[:grupo_estudio]['inicio(4i)']}:#{params[:grupo_estudio]['inicio(5i)']}"
      inicio = DateTime.parse(inicio)
      @grupo_estudio.update(curso: @curso.nombre, capacidad: params[:grupo_estudio][:capacidad], termino: termino, inicio: inicio, room_id: @room.id, cid: @curso.id, creador_id: current_user.id)
      @grupo_estudio.save
      redirect_to campu_room_path(@campu, @room)
    elsif not @room
      @room = Room.find(params[:grupo_estudio][:room_sel])
      termino = "#{params[:grupo_estudio]['termino(1i)']}-#{params[:grupo_estudio]['termino(2i)']}-#{params[:grupo_estudio]['termino(3i)']} #{params[:grupo_estudio]['termino(4i)']}:#{params[:grupo_estudio]['termino(5i)']}"
      termino = DateTime.parse(termino)
      inicio = "#{params[:grupo_estudio]['inicio(1i)']}-#{params[:grupo_estudio]['inicio(2i)']}-#{params[:grupo_estudio]['inicio(3i)']} #{params[:grupo_estudio]['inicio(4i)']}:#{params[:grupo_estudio]['inicio(5i)']}"
      inicio = DateTime.parse(inicio)
      @grupo_estudio.update(curso: @curso.nombre, capacidad: params[:grupo_estudio][:capacidad], termino: termino, inicio: inicio, room_id: @room.id, cid: @curso.id, creador_id: current_user.id)
      @grupo_estudio.save
      redirect_to curso_path(@curso)
    end
  end

  # DELETE /grupo_estudios/1
  # DELETE /grupo_estudios/1.json
  def destroy
    @grupo_estudio.destroy
    if not @curso
      respond_to do |format|
        format.html { redirect_to campu_room_path(@campu, @room), notice: 'Grupo estudio was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    if not @room
      respond_to do |format|
        format.html { redirect_to curso_path(@curso), notice: 'Grupo estudio was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo_estudio
      @grupo_estudio = GrupoEstudio.find(params[:id])
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
    def grupo_estudio_params
      params.require(:grupo_estudio).permit(:curso, :capacidad, :hora_termino, :fecha_creacion)
    end
end
