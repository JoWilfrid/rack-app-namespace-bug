require 'rack/app'
require 'json'

class RackAppNamespaceBug < Rack::App

  #
  # Following URL works
  # GET http://localhost:9292/works
  #
  get '/works' do
    response.headers[Rack::CONTENT_TYPE] = 'application/json'
    return { success: true }.to_json
  end

  namespace '/api/v1.0.0' do

    #
    # Following URL does not work
    # GET http://localhost:9292/api/v1.0.0/does-not-work
    #
    # Following URL works
    # GET http://localhost:9292/api/v1.0/does-not-work
    #
    get '/does-not-work' do
      response.headers[Rack::CONTENT_TYPE] = 'application/json'
      return { success: false }.to_json
    end

  end

end

run RackAppNamespaceBug
