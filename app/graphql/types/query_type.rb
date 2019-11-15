module Types
  class QueryType < Types::BaseObject

    # Manager queries
    field :manager_me, resolver: Resolvers::ManagerMe
    field :manager_newsletter_list, resolver: Resolvers::ManagerNewsletterList
    field :manager_subscriber_list, resolver: Resolvers::ManagerSubscriberList


    # Newsletter queries
    field :newsletter_single, resolver: Resolvers::NewsletterSingle
    field :newsletter_template_list, resolver: Resolvers::NewsletterTemplateList
    # field :newsletter_email_subs, resolver: Resolvers::NewsletterEmailSubs
    field :newsletter_subscriber_add_stats, resolver: Resolvers::NewsletterSubscriberAddStats
    field :newsletter_subscriber_total_count, resolver: Resolvers::NewsletterSubscriberTotalCount

    # Template queries
    field :template_email_sent_total_count, resolver: Resolvers::TemplateEmailSentTotalCount

  end
end
