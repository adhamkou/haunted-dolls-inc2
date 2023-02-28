class DollsController < ApplicationController
  def index
    @dolls = Doll.all
  end

  def new
    @doll = Doll.new
  end
end
