module Resolvers
    class Base < GraphQL::Schema::Resolver
        # The methods below will check if there is a current user
        # me? for raising errors
        # me for getting the current_user object conveniently

        def me?
          raise GraphQL::ExecutionError.new("Must be signed in to access this feature") unless context[:current_user]
        end

        def me
            context[:current_user]
        end

        def no_access
          raise GraphQL::ExecutionError.new("The item either doesn't exist or you don't have access")
        end
    end
end