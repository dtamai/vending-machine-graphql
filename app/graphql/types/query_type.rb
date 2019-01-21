# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :items, [Types::Item], null: false

    def items
      [
        { code: 1, name: 'Tea', quantity: 10, price_cents: 100 },
        { code: 2, name: 'Water', quantity: 0, price_cents: 80 }
      ]
    end
  end
end
