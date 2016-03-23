class Api::V1::RepositorySerializer < Api::V1::BaseSerializer
  embed :ids, :include => true

  attributes :id,:user_id,:name,:full_name,:description,:private,:fork,:url,:html_url,:archive_url,:assignees_url,:collaborators_url,
  			 :commits_url,:contributors_url,:forks_url,:homepage,:created_at
  
  has_one :user
end