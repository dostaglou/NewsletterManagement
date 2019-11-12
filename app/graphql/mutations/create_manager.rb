module Mutations
  class CreateManager < BaseMutation
    argument :manager_args, Types::ManagerArgs, required: true

    field :manager, Types::ManagerType, null: false
    field :msg, String, null: false
    
    def resolve(manager_args:)
      entry = Manager.create!( manager_args.to_h )
      message = "Manager Account Created!"
      {msg: message , manager: entry}
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Account could not be created")
    end
  end
end