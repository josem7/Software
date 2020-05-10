class CommentsController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy, :create, :new, :like, :dislike]
  before_action :set_publication, only: [:show, :edit, :update, :destroy, :create, :new]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(uid: current_user.id, autor: current_user.first_name,
      contenido: params[:comment][:contenido], pid: @publication.id)
    if @comment.save
      redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
    end
  end

  def update
      @comment.contenido = params[:comment][:contenido]
      @comment.save
      redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
  end

  def destroy
    @comment.destroy
    redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
  end

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_publication
    @publication = Publication.find(params[:publication_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
