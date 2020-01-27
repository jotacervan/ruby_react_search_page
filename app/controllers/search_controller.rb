class SearchController < ApplicationController  
  def index
    if params[:filters].count > 0
      results = SearchPage.search(params[:search], where: {country: params[:filters]}, fields: ["title^10", "description", "price", "tags"], operator: "or")
    else
      results = SearchPage.search(params[:search], fields: ["title^10", "description", "price", "tags"], operator: "or")

    end

    render json: results
  end
end
