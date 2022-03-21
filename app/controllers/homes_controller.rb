class HomesController < ApplicationController
  def top
    @user = User.new
  end

  def help; end
end
