module Types
  module ItemInterface
    include Types::BaseInterface

    description 'Attributes that describe an item on display.'

    field :code, Integer, 'The code used to make the purchase.', null: false
    field :name, String, 'The name of the item.', null: false
  end
end
