$LOAD_PATH << File.dirname(__FILE__)

require 'stores/memory_adapter'
require 'stores/twitter_adapter'

module TwitterDB
  class Client
    def initialize(store = TwitterDB::Stores::MemoryAdapter)
      @store = store.new
    end

    def insert(value)
      @store.insert(value)
    end

    def delete(id)
      @store.delete(id)
    end

    def get(id)
      @store.get(id)
    end
  end
end

if __FILE__ == $0
  ts = Time.now.to_i

  memory = TwitterDB::Client.new

  puts "Using MemoryAdapter"
  puts "adding a thing"
  id = memory.insert "Hello, world #{ts}"
  puts "got id: #{id}"

  puts "getting thing"
  puts memory.get(id)

  puts "deleting thing"
  memory.delete(id)

  twitter = TwitterDB::Client.new(TwitterDB::Stores::TwitterAdapter)
  puts "Using TwitterAdapter"

  puts "adding a thing"
  id = twitter.insert "Hello, world #{ts}"
  puts "got id: #{id}"

  puts "getting thing"
  puts twitter.get(id)

  puts "deleting thing"
  twitter.delete(id)
end
