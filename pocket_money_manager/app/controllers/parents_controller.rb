class ParentsController < ApplicationController
  def index

  end

  def new
    @parent = Parent.new
  end

end
