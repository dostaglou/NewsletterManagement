module Mutations
  class CreateManager < BaseMutation
    argument :args_manager, Types::ArgsManager, required: true

    field :manager, Types::ManagerType, null: false
    field :msg, String, null: false
    
    def resolve(args_manager:)
      entry = Manager.create!( args_manager.to_h )
      message = "Manager Account Created!"
      {msg: message , manager: entry}
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Account could not be created")
    end
  end
end