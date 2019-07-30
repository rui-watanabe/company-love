class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.where.not(id: current_user.id, status: 0)
  end

  def show
    @user=User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
   

  def edit
    @user=User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end
  #フォローする

  def unfollow
      @user = User.find(params[:user_id])
      current_user.stop_following(@user)
      redirect_to user_path(@user)
  end
  #フォローを外す


  def follow_list
    @user = User.find(params[:user_id])
  end
  #フォローしてる人の一覧ページ

  def follower_list
    @user = User.find(params[:user_id])
  end
  #フォロワーの一覧ページ

  def release
    @user =  User.find(params[:user_id])
    @user.released! unless @user.released?
    redirect_to  "/users/#{@user.id}/edit", notice: 'このアカウントを公開しました'
  end

  def nonrelease
    @user =  User.find(params[:user_id])
    @user.nonreleased! unless @user.nonreleased?
    redirect_to "/users/#{@user.id}/edit", notice: 'このアカウントを非公開にしました'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
  
 end
 
 