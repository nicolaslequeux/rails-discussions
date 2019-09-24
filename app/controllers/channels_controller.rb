class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  def index
    @channels = Channel.all
    @discussions = Discussion.all.order('created_at desc')
  end

  def show
    @discussions = Discussion.where('channel_id = ?', @channel.id)
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def edit
  end

  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to channels_path, notice: 'Channel was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to channels_path, notice: 'Channel was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:channel)
    end
end
