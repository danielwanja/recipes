class SearchesController < ApplicationController
  def show
    @query = params[:query]
    @results = RecipeSearch.search(@query,params[:page])
    @recipes = @results.map(&:recipe)
    render json: @recipes, meta: { current_page: @results.current_page, 
                                   num_pages: @results.num_pages,
                                   limit_value: @results.limit_value }
  end
end
