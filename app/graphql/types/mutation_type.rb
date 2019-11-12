module Types
  class MutationType < Types::BaseObject
    field :create_manager, mutation: Mutations::CreateManager
    field :create_subscriber, mutation: Mutations::CreateSubscriber
    field :create_newsletter, mutation: Mutations::CreateNewsletter
    field :signin_manager, mutation: Mutations::SigninManager
  end
end
