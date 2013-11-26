class StepsController < InheritedResources::Base
  nested_belongs_to :user, :recipe
  actions :all, :except => [:show]

  protected
  def permitted_params
    params.permit(ingredient: [:position, :description])
  end
end
