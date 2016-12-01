class RoomsController < ApplicationController
  before_action :require_admin
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :set_colors

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path, notice: 'Room was successfully created.' }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to rooms_path, notice: 'Room was successfully updated.' }
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
    end
  end

  private
    def room_params
      params.require(:room).permit(:name, :color)
    end

    def set_room
      @room = Room.find(params[:id])
    end

    def set_colors
      @colors = Room.colors
      @default_color = Room.default_color
    end
end
