require "spec_helper"
require "rails_helper"

describe ApiConnect do

  it "Usuário não cadastrado (diogocaetano). Após a chamada para a API do GitHub o usuário e repositorios devem ser salvos." do
	User.destroy_all
   	Repository.destroy_all

	get "/diogocaetano"
	expect(response).to be_success
	expect(User.all.count).to eq(1)
	expect(Repository.all.count).to eq(1)
  end


  it 'Usuário cadastrado a partir da APi do github deve ser disponibilizado via api pela aplicação.' do
   	User.destroy_all
   	Repository.destroy_all

   	get "/diogocaetano"

  	get '/api/v1/diogocaetano'

    json = JSON.parse(response.body)
    expect(json['login']).to eq('diogocaetano')
    expect(response).to be_success
  end

  it 'Repositórios cadastrado a partir da APi do github devem ser disponibilizados via api pela aplicação.' do
   	User.destroy_all
   	Repository.destroy_all

   	get "/diogocaetano"

  	get '/api/v1/repositories/diogocaetano'
  	
    json = JSON.parse(response.body)
    user = User.first
    
    expect(response).to be_success
    expect(json[0]['user_id']).to eq(user.id)
  end
end