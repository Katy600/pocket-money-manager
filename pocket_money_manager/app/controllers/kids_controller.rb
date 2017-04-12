class kidsController < ApplicationController

  before_action :find_parent

  def index
    @kids = @parent.kids
  end

  def show
    @kid = kid.find(params[:id])
  end

  def new
    @kid = kid.new(:parent_id => @parent.id)
  end

  def create
    @kid = kid.new(kid_params)
    @kid.parent_id = @parent
    if @kid.save
      flash[:notice] = "You've created a new account for #{@kid.name}"
      redirect_to(parents_path(:parent_id => @parent.id))
    else
      render('new')
    end
  end

  private

  def kid_params
    params.require(:kid).permit(:name, :username, :balance, :password)
  end

  def find_parent
    @parent = Parent.find(params[:subject_id])
  end

end
