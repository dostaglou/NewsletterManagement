module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
      null false

        # The methods below will check if there is a current user
        # me? for raising errors
        # me for getting the current_user object conveniently

        def me?
            raise GraphQL::ExecutionError.new("Must be signed in to access this feature") unless context[:current_user]
        end
        def me
            context[:current_user]
        end
    end
end
