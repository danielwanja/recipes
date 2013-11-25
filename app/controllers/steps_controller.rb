class StepsController < InheritedResources::Base
  nested_belongs_to :user, :recipe
end
