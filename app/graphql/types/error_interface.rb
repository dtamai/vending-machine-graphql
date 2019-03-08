module Types
  module ErrorInterface
    include Types::BaseInterface

    field :message, String, 'Xii', null: false
  end
end
