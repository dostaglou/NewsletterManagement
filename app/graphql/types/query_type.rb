module Types
  class QueryType < Types::BaseObject

    # Manager queries
    field :manager_me, resolver: Resolvers::ManagerMe
    field :manager_newsletter_list, resolver: Resolvers::ManagerNewsletterList
    field :manager_subscriber_list, resolver: Resolvers::ManagerSubscriberList
    
  end
end
