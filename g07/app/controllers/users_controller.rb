class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
  end


  def show
    @user = User.find(params[:id])
  end





  def stats
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    # @user.titulo = params[:publication][:titulo]
    # @publication.contenido = params[:publication][:contenido]
    # @publication.descripcion = params[:publication][:descripcion]
    # @publication.save
    redirect_to "/users/" + @user.id.to_s
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :about, :avatar)
  end
end
