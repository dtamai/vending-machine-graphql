# frozen_string_literal: true

module Types
  class ItemBuyResult < Types::BaseUnion
    description 'The result of the purchase. It can be either success or one of the errors.'

    possible_types Types::ItemBuySuccess, Types::ItemBuyInsufficientFundsError, Types::SimpleError

    def self.resolve_type(obj, _ctx)
      case obj[:status]
      when :insufficient_funds then Types::ItemBuyInsufficientFundsError
      when :error then Types::SimpleError
      when :success then Types::ItemBuySuccess
      end
    end
  end
end
