class RecipesController < InheritedResources::Base
  respond_to :html, :json
  belongs_to :user, :optional => true

  def tags
    respond_with(Recipe.tag_counts)
  end

  protected

  def permitted_params
    params.permit(recipe: [:title, :description, :image_url,
                              :ingredients_attributes => ["id", "amount", "unit", "description", "recipe_id", "_destroy"],
                              :steps_attributes => ["id", "position", "description", "recipe_id", "_destroy"]])
  end

  def collection
    if params[:tag].present?
      @recipes ||= end_of_association_chain.tagged_with(params[:tag]).page(params[:page])
    elsif params[:search]
      @results = RecipeSearch.search(params[:search],params[:page])
      @results.each_with_index {|rs, i| @results[i] = rs.recipe }  # was .map(&:recipe), but we want to keep pagination intact
      @recipes = @results
    else
      @recipes ||= end_of_association_chain.page(params[:page])
    end
    @recipes
  end
end
