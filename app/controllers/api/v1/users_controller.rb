class Api::V1::UsersController < Api::V1::BaseController
  
  before_action :authenticate

  def show
    user = User.where('login',params[:github_user])
    render(json: Api::V1::UserSerializer.new(repositories).to_json)
  end
end
