class JoinEventController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy, :create]
  before_action :set_room, only: [:show, :new, :update, :create, :destroy, :edit, :create]
  before_action :set_campu, only: [:show, :new, :update, :create, :destroy, :edit, :create]

  def new
  end

  def create
    @join_event = JoinEvent.new(uid: current_user.id , eid: @evento.id)
    respond_to do |format|
      if @join_event.save
        format.html { redirect_to campu_room_evento_path(@campu, @room, @evento), notice: 'Successfully joined.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_evento
    @evento = GrupoEstudio.find(params[:evento_id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_campu
    @campu = Campu.find(params[:campu_id])
  end
end
