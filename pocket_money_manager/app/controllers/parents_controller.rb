class ParentsController < ApplicationController

  before_action :confirm_logged_in, :except => [:new, :create]

  def index

  end

  def show
    @parent = Parent.find(params[:id])
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      flash[:notice] = "Your account has been created"
      redirect_to(login_login_path)
    else
      render('new')
    end
  end

  private

  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :email, :password)
  end

end
