# frozen_string_literal: true

class GraphqlMutSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
