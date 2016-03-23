
class ApiConnect

	def self.get_user(user_name)
		github_user =  Hashie::Mash.new HTTParty.get("https://api.github.com/users/#{user_name}").parsed_response		
	end

	def self.get_user_repositories(user_login)
		user_repositories_hash = HTTParty.get("https://api.github.com/users/#{user_login}/repos").parsed_response
		user_repositories = user_repositories_hash.map { |hash| Hashie::Mash.new(hash) }	
		
	end
end