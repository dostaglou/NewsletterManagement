module Mutations
  class ManagerDelete < BaseMutation
    field :msg, String, null: false
    field :manager, Types::ManagerType, null: false

    def resolve
      me?
      me.destroy 
      message = "Your manager account and all its newsletters have been deleted"
      {msg: message, manager: me}
    end
  end
end