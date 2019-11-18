module Mutations
  class ManagerSignin < BaseMutation
      null true
      argument :args, Types::ArgsManager, required: true
      field :token, String, null: true
      field :manager, Types::ManagerType, null: true

      def resolve(args:)
          return unless args[:email]
          manager = Manager.find_by email: args[:email]
          return GraphQL::ExecutionError.new("Manager with that email not found") unless manager
          return GraphQL::ExecutionError.new("Password was incorrect") unless manager.authenticate(args[:password])
          crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
          token = crypt.encrypt_and_sign("manager-id:#{ manager.id }")
          { token: token, manager: manager }
      rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
  end
end