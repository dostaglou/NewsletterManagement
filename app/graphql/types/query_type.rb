module Types
  class QueryType < Types::BaseObject
    field :manager_newsletter_list, resolver: Resolvers::ManagerNewsletterList
    field :manager_subscriber_list, resolver: Resolvers::ManagerSubscriberList
  end
end
