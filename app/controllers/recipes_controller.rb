class RecipesController < InheritedResources::Base
  belongs_to :user, :optional => true

  protected

  def permitted_params
    params.permit(recipe: [:title, :description])
  end

  def collection
    @recipes ||= end_of_association_chain.page(params[:page])
  end
end
