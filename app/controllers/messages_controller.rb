class MessagesController < ApplicationController
  before_action :set_message, only: [:update]

  def create
    @message = Message.new(message_params)
    @cipher = CalculateCipher.new(@message).do

    respond_to do |format|
      if @message.save
        format.html { redirect_to "/cipher/#{@message.user.slug}",
           notice: 'user was successfully created.' }
        format.json { 
           render json: @cipher }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @message.update(message_params)
    @cipher = CalculateCipher.new(@message).do

    respond_to do |format|
      if @message.save
        format.html { redirect_to "/cipher/#{@message.user.slug}",
           notice: 'user was successfully created.' }
        format.json { render json: { cipher: @cipher }, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find_by_id(params[:id])
    end

    def message_params
      params.require(:message).permit(:text, :digit, :user_id)
    end
end
