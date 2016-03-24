class Api::V1::RepositoriesController < Api::V1::BaseController
  
  def index
  	user = User.where(login: params[:github_user]).first
    if user
    	repositories = user.repositories
      render(json: repositories)
    else
      render( json: "null")
    end
  end
end
