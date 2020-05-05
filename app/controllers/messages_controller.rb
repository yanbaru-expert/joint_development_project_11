class MessagesController < ApplicationController
#新規作成
  def new
    @message = Message.new
  end
#新規作成
  def create
    Message.create(message_params)
  end
  #一覧画面
  def index
    @messages = Message.all 
  end
  def show
    @message = Message.find(params[:id])
  end
  def destroy
    message= Message.find(params[:id])
    message.delete
  end
  def edit
    @message = Message.find(params[:id])
  end
  def update
    @message =Message.find(params[:id])
    @message.update(message_params)
  

  end







  private
  def message_params
    params.require(:message).permit(:title,:content)
  end

end