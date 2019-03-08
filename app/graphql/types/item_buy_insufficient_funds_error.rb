# frozen_string_literal: true

module Types
  class ItemBuyInsufficientFundsError < Types::BaseObject
    implements Types::ErrorInterface

    description 'An error that indicates the money deposited is less than the' \
                ' price of the item selected.'

    field :available_cents, Integer, 'The amount deposited.', null: false
    field :price_cents, Integer, 'The amount required.', null: false
  end
end
