require "spec_helper"
require "rails_helper"

describe ApiConnect do

  it "Usuário não cadastrado (julianalucena). Após a chamada para a API do GitHub o usuário e repositorios devem ser salvos." do
	User.destroy_all
   	Repository.destroy_all

	get "/julianalucena"
	expect(response).to be_success
	expect(User.all.count).to eq(1)
	expect(Repository.all.count).to be > 1
  end


  it 'Usuário cadastrado a partir da APi do github deve ser disponibilizado via api pela aplicação.' do
   	User.destroy_all
   	Repository.destroy_all

   	get "/julianalucena"

  	get '/api/v1/julianalucena', nil,  { 'api-key' => "15ae2edf99da63f614bf621cb4321eb7"}

    json = JSON.parse(response.body)
    expect(json['login']).to eq('julianalucena')
    expect(response).to be_success
  end

  it 'Repositórios cadastrado a partir da APi do github devem ser disponibilizados via api pela aplicação.' do
   	User.destroy_all
   	Repository.destroy_all

   	get "/julianalucena"

  	get '/api/v1/repositories/julianalucena', nil,  { 'api-key' => "15ae2edf99da63f614bf621cb4321eb7"}
  	
    json = JSON.parse(response.body)
    user = User.first
    
    expect(response).to be_success
    expect(json[0]['user_id']).to eq(user.id)
  end
end