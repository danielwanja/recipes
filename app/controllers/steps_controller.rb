class StepsController < InheritedResources::Base
  nested_belongs_to :user, :recipe
  actions :all, :except => [:show]

  protected
  def permitted_params
    params.permit(step: [:position, :description])
  end
end
