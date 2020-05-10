class RatesController < ApplicationController
  before_action :set_room, only: [:show, :new, :update, :create, :destroy, :edit, :create]
  before_action :set_campu, only: [:show, :new, :update, :create, :destroy, :edit, :create]
  def new
    @rate = Rate.new
  end

  def create
    if Rate.exists?(uid: current_user.id, rid: @room.id)
      @rate = Rate.where(uid: current_user.id, rid: @room.id)[0]
      @rate.disp =  params[:rates][:disponibilidad]
      @rate.enchufe = params[:rates][:ptje_enchufes]
      @rate.ruido =  params[:rates][:ruido]
      @rate.save
    else
      @rate = Rate.create(uid: current_user.id , rid: @room.id, disp:params[:rates][:disponibilidad], enchufe:params[:rates][:ptje_enchufes], ruido:params[:rates][:ruido])
    end

    respond_to do |format|
      if @rate.save
        format.html { redirect_to campu_room_path(@campu, @room), notice: 'Rate was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_campu
    @campu = Campu.find(params[:campu_id])
  end
end
