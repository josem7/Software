class ModeratorsController < ApplicationController
  before_action :set_curso, only: [:accept, :create, :reject, :remove]
  before_action :set_user, only: [:accept, :reject, :remove]

  def new
  end

  def create
    if Moderator.exists?(uid: current_user.id, cid: @curso.id)
      @l = Moderator.where(uid: current_user.id, cid: @curso.id)[0]
      @l.save
    else
      Moderator.create(uid: current_user.id, cid: @curso.id, estado: 0)
    end
    redirect_to '/cursos/'+ @curso.id.to_s
  end

  def accept
    if Moderator.exists?(uid: @user.id, cid: @curso.id)
      @l = Moderator.where(uid: @user.id, cid: @curso.id)[0]
      @l.estado = 1
      @l.save
    end
    redirect_to '/users/'+ current_user.id.to_s
  end

  def remove
    if Moderator.exists?(uid: @user.id, cid: @curso.id)
      Moderator.where(uid: @user.id , cid: @curso.id).destroy_all
    end
    redirect_to '/users/'+ current_user.id.to_s
  end

  def reject
    Moderator.where(uid: @user.id , cid: @curso.id).destroy_all
    redirect_to '/users/'+ current_user.id.to_s
  end

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
