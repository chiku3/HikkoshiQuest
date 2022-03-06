class HomesController < ApplicationController
  def top
    @user = User.find_by_name(params[:name])
  end

  def help
  end
end
