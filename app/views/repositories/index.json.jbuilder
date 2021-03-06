json.array!(@repositories) do |repository|
  json.extract! repository, :id, :user_id, :name, :full_name, :description, :private, :fork, :url, :html_url, :archive_url, :assignees_url, :collaborators_url, :commits_url, :contributors_url, :forks_url, :homepage
  json.url repository_url(repository, format: :json)
end
