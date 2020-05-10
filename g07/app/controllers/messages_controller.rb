class MessagesController < ApplicationController
    before_action :set_user, only: [:create, :new]

  def new
    @message = Message.new
  end

  def create
    if @user.id == current_user.id
      @message = Message.create(from: current_user.id , to: params[:messages][:to].to_i, subject:params[:messages][:subject], content:params[:messages][:message])
      redirect_to '/users/'+ current_user.id.to_s
    else
      @message = Message.create(from: current_user.id , to: @user.id, subject:params[:messages][:subject], content:params[:messages][:message])
      redirect_to '/users/'+ @user.id.to_s
    end
  end

  def destroy
    Message.where(id:params[:id]).destroy_all
    redirect_to '/users/'+ current_user.id.to_s
  end

  def show
    @message = Message.find(params[:id])
  end


  def set_user
    @user = User.find(params[:user_id])
  end
end
