class DashboardController < ApplicationController
  
  #github teste = julianalucena

  def index

    @user = User.where(login: params[:github_user]).first
    
    if not @user
      
      @user = github_user = ApiConnect.get_user(params[:github_user])

      if not @user.nil?

        @repositories = user_repositories = ApiConnect.get_user_repositories(github_user.login)
        
        user = User.create(
          login: github_user.login, 
          avatar_url: github_user.avatar_url, 
          url: github_user.url,
          html_url: github_user.html_url,
          repos_url: github_user.repos_url,
          type: github_user.type,
          public_repos: github_user.public_repos,
          company: github_user.company,
          following: github_user.following,
          location: github_user.location
        )
          
        user_repositories.each do |repository|
        
            Repository.create(
              user_id: user.id, 
              name: repository.name, 
              full_name: repository.full_name,
              description: repository.description,
              private: repository.private,
              fork: repository.fork,
              url: repository.url,
              html_url: repository.html_url,
              archive_url: repository.archive_url,
              assignees_url: repository.assignees_url,
              collaborators_url: repository.collaborators_url,
              commits_url: repository.commits_url,
              contributors_url: repository.contributors_url,
              forks_url: repository.forks_url,
              created_at: repository.created_at
            )

        end  

      end

    else    
      
        @repositories = ApiConnect.get_user_repositories(@user.login)
  
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :avatar_url, :url, :html_url, :repos_url, :type)
  end

end 