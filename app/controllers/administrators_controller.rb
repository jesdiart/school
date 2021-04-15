class AdministratorsController < ApplicationController

  def show
    @administrator = Administrator.find(params[:id])
  end

end
