class ChildrenController < ApplicationController

  def index
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      flash[:notice] = "You've created a new account for #{@child.name}"
      redirect_to(parent_path)
    else
      render('new')
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :user_name, :balance, :password)
  end

end
