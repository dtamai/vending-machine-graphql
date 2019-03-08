# frozen_string_literal: true

module Types
  class SimpleError < Types::BaseObject
    implements Types::ErrorInterface

    description 'A generic error with just a message.'

    field :message, String, 'The error message', null: false
  end
end
