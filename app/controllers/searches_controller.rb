class SearchesController < ApplicationController
  def show
    @query = params[:query]
    @results = RecipeSearch.search(@query,params[:page])
    @recipes = @results.map(&:recipe)
  end
end
