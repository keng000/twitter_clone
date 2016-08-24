class TwitController < ApplicationController
  def index
    @tweet = Twitmodel.all
  end
  
  def new
    if params[:back]
      @tweet = Twitmodel.new(twit_params)
    else
      @tweet = Twitmodel.new
    end
  end 
  
  def create
    @tweet = Twitmodel.new(twit_params)
    if @tweet.save
      redirect_to twit_index_path,notice:"投稿しました"
    else
      render action: 'new'
    end
  end
  
  def edit
    set_twit
  end
  
  def update
    set_twit
    if @tweet.update(twit_params)
      @tweet.update(twit_params)
      redirect_to twit_index_path,notice:"編集しました"
    else
      render action: 'edit'
    end
  end
  
  def destroy
    set_twit
    @tweet.destroy
    redirect_to twit_index_path, notice:"削除しました"
  end
  
  def confirm
    @tweet = Twitmodel.new(twit_params)
    render :new if @tweet.invalid?
  end
  
  private
    def twit_params
      params.require(:twitmodel).permit(:content)
    end
    
    def set_twit
      @tweet = Twitmodel.find(params[:id])
    end
end
