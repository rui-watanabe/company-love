class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create]
  
    def create
      if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
        @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
        respond_to do |format|
          format.html { redirect_to "/rooms/#{@message.room_id}"}
          format.json
        end
      else
        @messages = messages.includes(:user)
        flash.now[:alert] = "メッセージを入力してください。"
        render template: "room/new"
      end
    end
end