class Admin::HomesController < ApplicationController
  def top
    @boards = Board.all
    @tasks = Task.all
  end
end
