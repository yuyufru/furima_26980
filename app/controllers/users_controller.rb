class UsersController < ApplicationController
  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      # format.json
    end
  end

  def new
    @user = User.new
  end

  def create
    
    @uses = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birth_day,
    )
  end


  def show
    @nickname = current_user.nickname
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
