class HomeController < ApplicationController
  def index
    @nombre = current_user.profile.nombre.blank? ? current_user.email : current_user.profile.nombre
  end
end
