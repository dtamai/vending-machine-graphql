# frozen_string_literal: true

class VendingMachineSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
