# frozen_string_literal: true

module Types
  class ItemSoldout < Types::BaseObject
    implements Types::ItemInterface

    description 'An item that cannot be purchased.'
  end
end
