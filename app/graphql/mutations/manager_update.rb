module Mutations
  class ManagerUpdate < BaseMutation
    argument :args_manager, Types::ArgsManager, required: true
    
    field :self, Types::ManagerType, null: false
    field :msg, String, null: false

    def resolve(args_manager:)
      self.me?
      me.update!(args_manager.to_h)
      message = "You have sucessfully updated your account"
      {msg: message, self: me}
    end
  end
end
