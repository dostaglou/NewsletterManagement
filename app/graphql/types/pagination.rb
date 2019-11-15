module Types
  class Pagination < BaseInputObject
    description "Universal Pagination Arguments"

    argument :offset, Integer, required: false, default_value: 0
    argument :limit, Integer, required: false, default_value: 10

    def prepare
      return GraphQL::ExecutionError.new("limit must be between 1 and 30") unless (1..31).include?(limit)
      {offset: offset, limit: limit}
      # [offset, limit]
    end
  end
end