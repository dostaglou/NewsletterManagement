module Types
  class QueryType < Types::BaseObject

    # Manager queries
    field :manager_me, resolver: Resolvers::ManagerMe
    field :manager_newsletter_list, resolver: Resolvers::ManagerNewsletterList
    field :manager_subscriber_list, resolver: Resolvers::ManagerSubscriberList

    # Newsletter queries
    field :newsletter_single, resolver: Resolvers::NewsletterSingle
    field :newsletter_email_subs, resolver: Resolvers::NewsletterEmailSubs
    field :newsletter_subscriber_stats, resolver: Resolvers::NewsletterSubscriberStats
  end
end
