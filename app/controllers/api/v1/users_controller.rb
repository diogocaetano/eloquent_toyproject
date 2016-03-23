class Api::V1::UsersController < Api::V1::BaseController
  
  before_action :authenticate

  def show
    user = User.where(login: params[:github_user]).first
    render(json: user)
  end
end
