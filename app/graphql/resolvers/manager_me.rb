module Resolvers
  class ManagerMe < Resolvers::Base
    type Types::ManagerType, null: true

    def resolve
      self.me?
      me
    end
  end
end

