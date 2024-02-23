module Api
  class UsersController < ApplicationController
    def tasks
      user = User.find(params[:user_id])
      #@tasks = user.tasks
      @tasks = Task.where(assigned_to: params[:user_id])
      render json: @tasks
    end
  end
end
