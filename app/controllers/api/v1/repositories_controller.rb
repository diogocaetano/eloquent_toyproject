class Api::V1::RepositoriesController < Api::V1::BaseController
  
  before_action :authenticate

  def index
  	user = User.where(login: params[:github_user]).first
  	repositories = user.repositories

    render(
      json: ActiveModel::ArraySerializer.new(
        repositories,
        each_serializer: Api::V1::RepositorySerializer,
        root: 'respositories',
      )
    )
  end
end
