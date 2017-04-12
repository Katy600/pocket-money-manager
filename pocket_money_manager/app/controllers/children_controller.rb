class ChildrenController < ApplicationController
  before_action :find_parent
  def index
  end

  def new
    @child = Child.new(:parent_id => @parent.id)
  end

  def create
    @child = Child.new(child_params)
   @child.parent_id = @parent
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

  def find_parent
    @parent = Parent.find(params[:parent_id])
    p @parent
  end

end
