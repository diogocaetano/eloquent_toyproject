require "spec_helper"
require "rails_helper"

describe ApiConnect do

	it "Usuário não cadastrado. Get user deve ser chamado uma vez." do
		get '/api/v1/messages'

		expect(ApiConnect).to receive(get_user).once
	end
end