class UsersController < ApplicationController
  def show
   @name = current_user.name
   # 現在ログインしているユーザーのニックネーム
   @tweets = current_user.tweets.page(params[:page]).per(5).order("created_at DESC")
   # アソシエーションを定義したことによって使える
   # 定義しないと、Tweet.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
   #現在ログインしているユーザーidがの投稿しているツイートを全て持ってくる
  end
 end
 
 