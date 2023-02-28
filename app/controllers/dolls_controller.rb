class DollsController < ApplicationController
  def index
    @dolls = Doll.all
  end
end
