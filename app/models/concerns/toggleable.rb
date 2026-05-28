module Toggleable
  extend ActiveSupport::Concern

  class_methods do
    def toggleable(column = :active, negative: :inactive, verb: :activate, negative_verb: :deactivate, negative_values: false)
      scope column, -> { where(column => true) }
      scope negative, -> { where(column => negative_values) }
      scope :"with_#{column}", -> { unscope(where: column) }

      define_method :"#{verb}!" do
        update!(column => true)
      end

      define_method :"#{negative_verb}!" do
        update!(column => false)
      end

      define_method verb.to_s do
        send("#{column}=", true)
      end

      define_method negative_verb.to_s do
        send("#{column}=", false)
      end

      define_singleton_method :"#{verb}_all!" do
        send(negative).each(&:"#{verb}!")
      end

      define_singleton_method :"#{negative_verb}_all!" do
        send(column).each(&:"#{negative_verb}!")
      end
    end
  end
end
