class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :destroy_session
  before_action :authenticate

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

	def destroy_session
		request.session_options[:skip] = true
	end

	def not_found
		render(json: {status: 404, errors: 'Not found'})
	end

private
 
  def authenticate
  	api_key = request.headers['api-key']
  	
  	api_key = ApiKey.where(access_token: api_key).first if api_key
  	  api_key = true
	  unless api_key
	    errors = ['Um cabeçalho HTTP necessário não foi especificado.']
    	render(json: {status: 400, errors: errors})
	  end
	end
end