class MessagesController < ApplicationController
  def index
    @message = Message.new               
    @room = Room.find(params[:room_id])  
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])  
    @message = @room.messages.new(message_params) #room_idとuser_idに紐づいたメッセージ
    if @message.save
      redirect_to room_messages_path(@room)  #room_idに紐づいたメッセージ一覧
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end


  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    # パラメーターの中に、ログインユーザーのidと紐付いたメッセージの内容[content]と[image]の引き渡しを許可。
  end
end




# <indexアクション>
  # Messageモデルのインスタンス情報を代入
  # @room = room_id
  # ルーティングをネストしているため/rooms/:room_id/messagesというパスになる
  # チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義
  # 一覧画面で表示するメッセージ情報には、ユーザー情報も紐付いて表示される
  # メッセージに紐付くユーザー情報の取得でN+1問題が発生するため、includes(:user)でユーザー情報を1度のアクセスでまとめて取得している

# <cerateアクション>
  # @room = room_id
# <destroyアクション>


# <privateアクション>