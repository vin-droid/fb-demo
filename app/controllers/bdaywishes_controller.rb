class BdaywishesController < ApplicationController
require 'koala'

	def get_token
		@oauth = Koala::Facebook::OAuth.new(ENV["app_id"], ENV["app_secret"], ["callbackurl"])
        @oauth_token = @oauth.get_app_access_token
        render json: { oauth_token: @oauth_token }
	end
	def get_updates
		access_token = JSON.parse(get_token)
		@graph = Koala::Facebook::API.new(access_token[:oauth_token])
		@profile = @graph.get_object("me")
		render json: {updates: @profile}
	end
	# "http://www.example.com?" + { language: "ruby", status: "awesome" }.to_query
end
