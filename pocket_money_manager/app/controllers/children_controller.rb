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
      redirect_to(parents_path)
    else
      render('new')
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :username, :balance, :password)
  end

end
