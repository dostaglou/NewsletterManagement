module Types
  class MutationType < Types::BaseObject
    field :create_manager, mutation: Mutations::CreateManager
    field :create_subscriber, mutation: Mutations::CreateSubscriber
    field :create_newsletter, mutation: Mutations::CreateNewsletter
    field :signin_manager, mutation: Mutations::SigninManager

    ## following new naming scheme

    # Manager mutations
    field :manager_update, mutation: Mutations::ManagerUpdate 
    field :manager_delete, mutation: Mutations::ManagerDelete

    # Newsletter mutations
    field :newsletter_create, mutation: Mutations::NewsletterCreate
    field :newsletter_update, mutation: Mutations::NewsletterUpdate
    field :newsletter_destroy, mutation: Mutations::NewsletterDestroy
    
  end
end
