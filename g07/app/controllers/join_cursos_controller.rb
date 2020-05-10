class JoinCursosController < ApplicationController
  before_action :set_curso, only: [:unsuscribe, :create]

  def new
  end

  def create
    @join_curso = JoinCurso.new(uid: current_user.id , cid: @curso.id, tipo: params[:tipo])
    respond_to do |format|
      if @join_curso.save
        format.html { redirect_to curso_path(@curso), notice: 'Suscrito con exito!' }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  def unsuscribe
    JoinCurso.where(uid: current_user.id , cid: @curso.id).destroy_all
    redirect_to '/cursos/'+ @curso.id.to_s
  end

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end
end
