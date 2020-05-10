class FavouritesController < ApplicationController
  before_action :set_publication, only: [:create, :destroy]
  before_action :set_curso, only: [:create, :destroy]

  def new
  end

  def create
    Favourite.create(uid: current_user.id, pid: @publication.id)
    redirect_to '/cursos/'+ @curso.id.to_s
  end

  def destroy
    if Favourite.exists?(uid: current_user.id, pid: @publication.id)
      Favourite.where(uid: current_user.id , pid: @publication.id).destroy_all
    end
      redirect_to '/cursos/'+ @curso.id.to_s
  end

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

end
