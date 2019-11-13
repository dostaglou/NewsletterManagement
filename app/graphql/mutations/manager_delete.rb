module Mutations
  class ManagerDelete < BaseMutation
    field :msg, String, null: false
    field :self, Types::ManagerType, null: false

    def resolve
      me?
      me.destroy 
      message = "Your manager account and all its newsletters have been deleted"
      {msg: message, self: me}
    end
  end
end