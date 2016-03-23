require "spec_helper"
require "rails_helper"

describe ApiConnect do

	it "Usuário não cadastrado (diogocaetano). Após a chamada para a API do GitHub o usuário e repositorios devem ser salvos." do
		get "/diogocaetano"
		expect(response).to be_success
		expect(User.all.count).to eq(1)
		expect(Repository.all.count).to eq(1)
	end
end