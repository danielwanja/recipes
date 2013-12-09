# Just to serve AngularJS template files. Could also simply serve plain assets
class TemplatesController < ApplicationController
  layout false

  def app
    render 'app', layout:'application'
  end

end