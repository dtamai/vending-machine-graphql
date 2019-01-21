# frozen_string_literal: true

module Types
  class ItemAvailable < Types::BaseObject
    implements Types::ItemInterface

    description 'An item that can be purchased.'

    field :price_cents, Integer, 'The price in cents of this item.', null: false
  end
end
