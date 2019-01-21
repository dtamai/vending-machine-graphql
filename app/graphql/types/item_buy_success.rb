# frozen_string_literal: true

module Types
  class ItemBuySuccess < Types::BaseObject
    description 'The purchase was successful, the item should be in the dispenser.'

    field :balance_cents, Integer, 'The remaining amount.', null: false
    field :items, [Types::Item], 'The updated list of items.', null: false
  end
end
