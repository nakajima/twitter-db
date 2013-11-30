module TwitterDB
  module Stores
    class MemoryAdapter
      def initialize
        @idx = 0
        @records = {}
      end

      def insert(text)
        id = @idx += 1
        id.tap { @records[id] = text }
      end

      def delete(id)
        @records.delete id
      end

      def get(id)
        @records[id]
      end
    end
  end
end
