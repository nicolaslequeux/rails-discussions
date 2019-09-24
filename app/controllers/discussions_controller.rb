class DiscussionsController < ApplicationController

  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  
  # we can get rid of '@channels = Channel.all.order('created_at desc')'
  before_action :find_channels, only: [:index, :show, :new, :edit]
  
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @discussions = Discussion.all.order('created_at desc')
    # @channels = Channel.all.order('created_at desc')
  end

  def show
    @discussions = Discussion.all.order('created_at desc')
    # @channels = Channel.all.order('created_at desc')
  end

  def new
    @discussion = current_user.discussions.build
    # @channels = Channel.all.order('created_at desc')
  end
  
  def edit
    # @channels
  end

  def create
    @discussion = current_user.discussions.build(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: 'Discussion was successfully destroyed.' }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Je crée une methode que j'appelle avec before_action et autorise dans les actions listées
    def find_channels
      @channels = Channel.all.order('created_at desc')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:title, :content, :channel_id)
    end
end
