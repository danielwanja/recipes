class RecipesController < InheritedResources::Base
  respond_to :html, :json
  belongs_to :user, :optional => true

  protected

  def permitted_params
    params.permit(recipe: [:title, :description, :image_url])
  end

  def collection
    if params[:tag].blank?
      @recipes ||= end_of_association_chain.page(params[:page])
    else
      @recipes ||= end_of_association_chain.tagged_with(params[:tag]).page(params[:page])
    end
  end
end
