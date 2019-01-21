# frozen_string_literal: true

module Types
  class Item < Types::BaseUnion
    possible_types Types::ItemAvailable, Types::ItemSoldout

    def self.resolve_type(obj, _ctx)
      if obj[:quantity].positive?
        Types::ItemAvailable
      else
        Types::ItemSoldout
      end
    end
  end
end
