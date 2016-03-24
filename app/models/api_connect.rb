
class ApiConnect

	def self.params
		"?client_id=65b0342c95ac0cc701d5&client_secret=a7dee4bb3c17bac8d9e1a955f04e16279d61eaa6"		
	end

	def self.get_user(user_name)
		github_user =  Hashie::Mash.new HTTParty.get("https://api.github.com/users/#{user_name}" + self.params).parsed_response	
		if  github_user.message.present? && github_user.message.to_s == "Not Found"
			github_user = nil
		end
		
		github_user
	end

	def self.get_user_repositories(user_login)
		user_repositories_hash = HTTParty.get("https://api.github.com/users/#{user_login}/repos" + self.params).parsed_response
		user_repositories = user_repositories_hash.map { |hash| Hashie::Mash.new(hash) }	
	end
end