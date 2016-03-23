
class ApiConnect

	def self.get_user(user_name)
		github_user = HTTParty.get("https://api.github.com/users/#{user_name}").parsed_response
		
		user = User.create(
			login: github_user['login'], 
			avatar_url: github_user['avatar_url'], 
			url: github_user['url'],
			html_url: github_user['html_url'],
			repos_url: github_user['repos_url'],
			type: github_user['type']
		)

		user
	end

	def self.get_user_repositories(user)
		user_repositories = HTTParty.get("https://api.github.com/users/#{user.login}/repos").parsed_response
		
		user_repositories.each do |repository|
			
			saved_repositories = Repository.where(user_id: user.id, name: repository['name'])

			if saved_repositories.empty?
				Repository.create(
					user_id: user.id, 
					name: repository['name'], 
					full_name: repository['full_name'],
					description: repository['description'],
					private: repository['private'],
					fork: repository['fork'],
					url: repository['url'],
					html_url: repository['html_url'],
					archive_url: repository['archive_url'],
					assignees_url: repository['assignees_url'],
					collaborators_url: repository['collaborators_url'],
					commits_url: repository['commits_url'],
					contributors_url: repository['contributors_url'],
					forks_url: repository['forks_url'],
					created_at: repository['created_at']
				)
			end
		end 
	end
end