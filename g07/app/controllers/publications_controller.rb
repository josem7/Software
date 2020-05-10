class PublicationsController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy, :create, :new, :like, :dislike]
  before_action :set_publication, only: [:show, :edit, :update, :destroy, :like, :dislike]

  def new
  end

  def show
  end

  def edit
  end

  def update
      @publication.titulo = params[:publication][:titulo]
      @publication.contenido = params[:publication][:contenido]
      @publication.descripcion = params[:publication][:descripcion]
      @publication.save
      redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
  end

  def destroy
    @publication.destroy
    redirect_to '/cursos/'+ @curso.id.to_s
  end

  def like
    actual = @publication.likes
    nuevo = actual + 1
    @publication.likes = nuevo
    @publication.save
    redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
  end

  def dislike
    actual = @publication.dislikes
    nuevo = actual + 1
    @publication.dislikes = nuevo
    @publication.save
    redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
  end

  def create
    @publication = Publication.new(titulo: params[:titulo],
      aid: current_user.id , autor: current_user.first_name , cid: @curso.id, curso: @curso.nombre,
      contenido: params[:contenido] , descripcion: params[:descripcion],
      likes: 0, dislikes: 0)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to curso_path(@curso), notice: 'Successfully published.' }
        format.json { render :show, status: :created, location: @publication }
      end
    end
  end

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_publication
    @publication = Publication.find(params[:id])
  end

end
