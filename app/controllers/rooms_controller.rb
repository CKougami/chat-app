class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save             # 保存が成功した場合 
      redirect_to root_path   # top画面に戻る
    else                      # 保存が失敗した場合
      render :new             #rooms/new.html.erbのページを表示
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
