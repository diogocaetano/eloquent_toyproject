class Api::V1::UserSerializer < Api::V1::BaseSerializer
  embed :ids, :include => true

  attributes :id,:login,:avatar_url,:url,:html_url,:repos_url,:type,:public_repos,:company,:following,:location
  
end