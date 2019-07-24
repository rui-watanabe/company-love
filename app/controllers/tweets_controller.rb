class TweetsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  # ツイート一覧、詳細表示の表示を除いて

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    #記述された日時は　、tweetsテーブルのcretated_atカラムにされいているのでそれを元に降順設定をしている
    #orderメソッドを用いいないデフォルトの状態はid順番となる
  end

  def new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    flash[:notice] = "投稿しました"
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    flash[:notice] = "投稿を削除しました"
    redirect_to root_path
      #後置ifをすることで、一文にまとめられる（elsifやelseがない場合）
      #if tweet.user_id == current_user.id
      #tweet.destroy
  end

 def edit
  @tweet = Tweet.find(params[:id])
 end

 def update
  tweet = Tweet.find(params[:id])
  if tweet.user_id == current_user.id
    tweet.update(tweet_params)
    flash[:notice] = "投稿を更新しました"
    redirect_to root_path
  end
 end

 def show
  @tweet = Tweet.find(params[:id])
  @comments = @tweet.comments.includes(:user)
 end

  private
  def tweet_params
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    #ユーザーがサインインしていない時インデックスアクションとばす
  end
end
  
  
  
