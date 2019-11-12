module Types
  class QueryType < Types::BaseObject
    field :managers, Types::ManagerType, null: true


    def managers
      Manager.first
    end
  end
end
