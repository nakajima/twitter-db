require 'json'
require 'twitter'

module TwitterDB
  module Stores
    class TwitterAdapter
      def initialize
        @consumer_key        = ENV['CONSUMER_KEY']
        @consumer_secret     = ENV['CONSUMER_SECRET']
        @access_token        = ENV['ACCESS_TOKEN']
        @access_token_secret = ENV['ACCESS_TOKEN_SECRET']
      end

      def insert(text)
        twitter.update(text).id
      end

      def delete(id)
        twitter.destroy_status(id)
      end

      def get(id)
        twitter.status(id).text
      end

      private

      def twitter
        @twitter ||= Twitter::REST::Client.new do |config|
          config.consumer_key        = @consumer_key
          config.consumer_secret     = @consumer_secret
          config.access_token        = @access_token
          config.access_token_secret = @access_token_secret
        end
      end
    end
  end
end
