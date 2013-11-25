class UsersController < InheritedResources::Base

  protected
  def permitted_params
    params.permit(user: [:twitter])
  end
end
