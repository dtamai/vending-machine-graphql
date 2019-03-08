# frozen_string_literal: true

module Mutations
  class ItemBuy < Mutations::BaseMutation
    description 'Buy an item given its code.'

    argument :code, Integer, 'The code for the item.', required: true

    payload_type Types::ItemBuyResult

    def resolve(code:)
      case code
      when 1 then { status: :insufficient_funds, available_cents: 20, price_cents: 100, message: 'Not enough funds' }
      when 2 then { status: :error, message: 'There is something wrong :(' }
      else { status: :success, balance_cents: 20, items: [] }
      end
    end
  end
end
