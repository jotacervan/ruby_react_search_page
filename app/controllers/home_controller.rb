class HomeController < ApplicationController
  def index
    @countries = Country.all.order(:name).as_json(only: [:id, :name])
  end
end
