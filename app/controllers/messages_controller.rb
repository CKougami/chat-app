class MessagesController < ApplicationController
  def index
    @message = Message.new               # Messageモデルのインスタンス情報を代入
    @room = Room.find(params[:room_id])  # roomsモデルの「room_id」を代入

    # ルーティングをネストしているため/rooms/:room_id/messagesといったパスになります。
    # パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、
    # room_idという値が存在しています。
    # そのため、params[:room_id]と記述することでroom_idを取得できます。
  end

  def create
    @room = Room.find(params[:room_id])  # @room = room_id
    @message = @room.messages.new(message_params) #room_idとuser_idに紐づいたメッセージ
    if @message.save
      redirect_to room_messages_path(@room)  #room_idに紐づいたメッセージ一覧
    else
      render :index
    end
  end


  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
    # パラメーターの中に、ログインユーザーのidと紐付いたメッセージの内容contentを受け取れるように許可。
  end
end
