class RecipesController < InheritedResources::Base
  belongs_to :user

  protected
  def permitted_params
    params.permit(recipe: [:title, :description])
  end
end
