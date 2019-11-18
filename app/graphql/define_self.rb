module DefineSelf
  
  # The methods below will check if there is a current user
  # me? for raising errors
  # me for getting the current_user object conveniently
  # no_access is a generic error than can be called
  # crisis allow easy, editable, error raising
  
  def me?
    raise GraphQL::ExecutionError.new("Must be signed in to access this feature") unless context[:current_user]
  end

  def me
      context[:current_user]
  end

  def no_access
    raise GraphQL::ExecutionError.new("The item either doesn't exist or you don't have access")
  end

  def crisis(string)
    raise GraphQL::ExecutionError.new(string)
  end

end