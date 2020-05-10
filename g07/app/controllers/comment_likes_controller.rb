class CommentLikesController < ApplicationController
  before_action :set_comment, only: [:like, :dislike]
  before_action :set_publication, only: [:like, :dislike]
  before_action :set_curso, only: [:like, :dislike]
  def new

  end

  def like
    if CommentLike.exists?(uid: current_user.id, cid: @comment.id)
      @l = CommentLike.where(uid: current_user.id, cid: @comment.id)[0]
      @l.tipo = 1
      @l.save
    else
      CommentLike.create(uid: current_user.id, cid: @comment.id, tipo: 1)
    end
    redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
  end

  def dislike
    if CommentLike.exists?(uid: current_user.id, cid: @comment.id)
      @l = CommentLike.where(uid: current_user.id, cid: @comment.id)[0]
      @l.tipo = 0
      @l.save
    else
      CommentLike.create(uid: current_user.id, cid: @comment.id, tipo: 0)
    end
    redirect_to '/cursos/'+ @curso.id.to_s + '/publications/'+ @publication.id.to_s
  end

  def set_publication
    @publication = Publication.find(params[:publication_id])
  end

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
