# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :item_buy, mutation: Mutations::ItemBuy
  end
end
