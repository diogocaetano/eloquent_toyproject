class DashboardController < ApplicationController
  
  def index
    @user = User.where(login: params[:github_user]).first
    
    if not @user
      @user = ApiConnect.get_user(params[:github_user])
      ApiConnect.get_user_repositories(@user)
    else
      if @user.repositories.empty?
        @repositories = ApiConnect.get_user_repositories(@user)
      else
        @repositories = Repository.where(user_id: @user.id).order('name','created_at')
      end
    end
  end
end
