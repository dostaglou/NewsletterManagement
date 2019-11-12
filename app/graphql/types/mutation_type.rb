module Types
  class MutationType < Types::BaseObject
    field :create_manager, mutation: Mutations::CreateManager
    field :create_subscriber, mutation: Mutations::CreateSubscriber
  end
end
