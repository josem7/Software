class LikesController < ApplicationController
  before_action :set_publication, only: [:like, :dislike]
  before_action :set_curso, only: [:like, :dislike]

  def new

  end

  def like
    if Like.exists?(uid: current_user.id, pid: @publication.id)
      @l = Like.where(uid: current_user.id, pid: @publication.id)[0]
      @l.tipo = 1
      @l.save
    else
      Like.create(uid: current_user.id, pid: @publication.id, tipo: 1)
    end
    redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
  end

  def dislike
    if Like.exists?(uid: current_user.id, pid: @publication.id)
      @l = Like.where(uid: current_user.id, pid: @publication.id)[0]
      @l.tipo = 0
      @l.save
    else
      Like.create(uid: current_user.id, pid: @publication.id, tipo: 0)
    end
    redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
  end

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end
end
