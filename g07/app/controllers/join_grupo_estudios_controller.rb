class JoinGrupoEstudiosController < ApplicationController
  before_action :set_evento, only: [:unirme_cursos, :abandonar_cursos, :unirme_sala, :abandonar_sala]
  before_action :set_curso, only: [:unirme_cursos, :abandonar_cursos]
  before_action :set_room, only: [:unirme_sala, :abandonar_sala]
  before_action :set_campu, only: [:unirme_sala, :abandonar_sala]

  def new
  end

  def unirme_cursos
    @join_evento = JoinGrupoEstudio.new(uid: current_user.id , eid: @evento.id)
    respond_to do |format|
      if @join_evento.save
        format.html { redirect_to '/cursos/'+ @curso.id.to_s}
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def abandonar_cursos
    JoinGrupoEstudio.where(uid: current_user.id , eid: @evento.id).destroy_all
    redirect_to '/cursos/'+ @curso.id.to_s
  end

  def unirme_sala
    @join_evento = JoinGrupoEstudio.new(uid: current_user.id , eid: @evento.id)
    respond_to do |format|
      if @join_evento.save
        format.html { redirect_to '/campus/' + @campu.id.to_s + '/rooms/' + @room.id.to_s}
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def abandonar_sala
    JoinGrupoEstudio.where(uid: current_user.id , eid: @evento.id).destroy_all
    redirect_to '/campus/' + @campu.id.to_s + '/rooms/' + @room.id.to_s
  end

  def set_evento
    @evento = GrupoEstudio.find(params[:id])
  end

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_campu
    @campu = Campu.find(params[:campu_id])
  end

end
