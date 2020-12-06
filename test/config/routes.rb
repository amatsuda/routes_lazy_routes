# frozen_string_literal: true

Rails.application.routes.draw do
  get 'foo', to: ->(_env) { [200, {}, ['hello']] }
end
