module Types
  class MutationType < Types::BaseObject

    # Manager mutations
    field :manager_create, mutation: Mutations::ManagerCreate
    field :manager_signin, mutation: Mutations::ManagerSignin
    field :manager_update, mutation: Mutations::ManagerUpdate 
    field :manager_delete, mutation: Mutations::ManagerDelete

    # Newsletter mutations
    field :newsletter_create, mutation: Mutations::NewsletterCreate
    field :newsletter_update, mutation: Mutations::NewsletterUpdate
    field :newsletter_destroy, mutation: Mutations::NewsletterDestroy
    field :newsletter_email_subs, mutation: Mutations::NewsletterEmailSubs
    
    # Subscriber mutations
    field :subscriber_create, mutation: Mutations::SubscriberCreate
    field :subscriber_unsub, mutation: Mutations::SubscriberUnsub
    field :subscriber_remove, mutation: Mutations::SubscriberRemove

    # Template mutations
    field :template_create, mutation: Mutations::TemplateCreate
    field :template_update, mutation: Mutations::TemplateUpdate
    field :template_destroy, mutation: Mutations::TemplateDestroy

  end
end
