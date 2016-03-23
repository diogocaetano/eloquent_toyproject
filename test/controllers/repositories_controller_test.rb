require 'test_helper'

class RepositoriesControllerTest < ActionController::TestCase
  setup do
    @repository = repositories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repositories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repository" do
    assert_difference('Repository.count') do
      post :create, repository: { archive_url: @repository.archive_url, assignees_url: @repository.assignees_url, collaborators_url: @repository.collaborators_url, commits_url: @repository.commits_url, contributors_url: @repository.contributors_url, description: @repository.description, fork: @repository.fork, forks_url: @repository.forks_url, full_name: @repository.full_name, homepage: @repository.homepage, html_url: @repository.html_url, name: @repository.name, private: @repository.private, url: @repository.url, user_id: @repository.user_id }
    end

    assert_redirected_to repository_path(assigns(:repository))
  end

  test "should show repository" do
    get :show, id: @repository
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repository
    assert_response :success
  end

  test "should update repository" do
    patch :update, id: @repository, repository: { archive_url: @repository.archive_url, assignees_url: @repository.assignees_url, collaborators_url: @repository.collaborators_url, commits_url: @repository.commits_url, contributors_url: @repository.contributors_url, description: @repository.description, fork: @repository.fork, forks_url: @repository.forks_url, full_name: @repository.full_name, homepage: @repository.homepage, html_url: @repository.html_url, name: @repository.name, private: @repository.private, url: @repository.url, user_id: @repository.user_id }
    assert_redirected_to repository_path(assigns(:repository))
  end

  test "should destroy repository" do
    assert_difference('Repository.count', -1) do
      delete :destroy, id: @repository
    end

    assert_redirected_to repositories_path
  end
end
