class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @dolls = Doll.first(3)
  end
end
