class DashboardController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user!
  # require "github"
  # GET /posts
  # GET /posts.json
  def index

    @user = false
    #  @user = User.first(params[:github_user])

    if(@user)
      @repos = @user
    else
      
      @repos = Github.repos.list user: params[:github_user]
      @user = Github.users user: params[:github_user]

      # @user = User.new(@repos)

      # respond_to do |format|
      #   if @user.save
      #     format.html { redirect_to @user, notice: 'User was successfully created.' }
      #     format.json { render :show, status: :created, location: @user }
      #   else
      #     format.html { render :new }
      #     format.json { render json: @user.errors, status: :unprocessable_entity }
      #   end
      # end
    end
    
    
  end

end
