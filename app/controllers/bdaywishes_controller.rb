class BdaywishesController < ApplicationController
require 'koala'

	def get_token
		byebug
		@oauth = Koala::Facebook::OAuth.new(ENV["app_id"], ENV["app_secret"], ENV["callback_url"])
        @oauth_token = @oauth.get_app_access_token
        render json: { oauth_token: @oauth_token }
	end
	def get_updates
		access_token = JSON.parse(get_token)
		@graph = Koala::Facebook::API.new(access_token[:oauth_token])
		@profile = @graph.get_object("me")
		render json: {updates: @profile}
	end



	def get_access_token
		url = "#{ENV['base_url']}oauth/access_token?"+
		{ client_id:ENV["app_id"],
			client_secret:ENV["app_secret"],
			grant_type: "client_credentials"}.to_query

		uri = URI.parse(url)
		header = {'Content-Type': 'text/json'}
		binding.pry
		begin
		    # Create the HTTP objects
		    http = Net::HTTP.new(uri.host, uri.port)
		    request = Net::HTTP::Get.new(uri.request_uri, header)
		    http.use_ssl = true
		    response = http.request(request)
		    puts response.inspect


		rescue Exception => e
                 
		end
    end

	def get_app_access_token
		
	end
	# "http://www.example.com?" + { language: "ruby", status: "awesome" }.to_query
end