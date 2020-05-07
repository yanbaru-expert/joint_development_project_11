class MessagesController < ApplicationController
#新規作成
  def new
    @message = Message.new
  end
#新規作成
  def create
    @message=Message.new(message_params)
    if @message.save
      redirect_to messages_path
      flash[:notice] = "登録完了"
    else
      flash.now[:alert] = "メンバーの登録に失敗しました。"
    render :new
    end
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
    flash[:notice]="削除完了"
    redirect_to messages_path
  end
  def edit
    @message = Message.find(params[:id])
  end
  def update
    @message =Message.find(params[:id])
    if @message.update(message_params)
     flash[:notice]="更新完了"
     redirect_to messages_path
    else
      flash[:notice]="更新失敗"
      render :edit
    end
  end







  private
  def message_params
    params.require(:message).permit(:title,:content)
  end

end