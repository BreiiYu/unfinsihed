class UsersController < ApplicationController
  before_action :only_loggedin_users, only: [:edit, :update, :index, :destroy, :following, :followers]
  def show
    @user = User.find(params[:id])
    # @totallearn = Lesson.select("distinct(lessons.category_id), lessons.id, lessons.user_id , lessons.created_at, lessons.updated_at")
    #               .joins("LEFT JOIN categories ON lessons.category_id = categories.id LEFT JOIN answers ON answers.lesson_id = lessons.id")
    #               .where("lessons.user_id = #{current_user.id}")
    @lessonact = Lesson.where(user_id: params[:id])
    @relationact = Relationship.where(follow_id: params[:id])
    @feed = Activity.where(user_id: params[:id])

  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url
    else
      render 'new'
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="Saved successfully"
      render 'edit'
    else
      flash[:danger]="Invalid content. Try again."
      render 'edit'
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="Saved successfully"
      redirect_to @user
    else
      flash[:danger]="Invalid content. Try again."
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:danger]="Delete Successfully"
    redirect_to users_url
  end 

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 6)
    @all_users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 6)
    @all_users = @user.followers
    render 'show_follow'
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :account_type, :password, :password_confirmation)
  end

  def only_loggedin_users
    redirect_to login_url unless logged_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end