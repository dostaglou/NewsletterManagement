class NewsletterManagementSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  max_complexity 3000
end
