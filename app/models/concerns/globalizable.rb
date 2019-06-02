module Globalizable
  extend ActiveSupport::Concern

  included do
    #globalize_accessors
    #accepts_nested_attributes_for :translations, allow_destroy: true

    def locales_not_marked_for_destruction
      translations.reject(&:_destroy).map(&:locale).map(&:to_sym)
    end

    # def description
    #   self.read_attribute(:description).try :html_safe
    # end

    if self.paranoid? && translation_class.attribute_names.include?("hidden_at")
      translation_class.send :acts_as_paranoid, column: :hidden_at
    end

    scope :with_translation, -> { joins("LEFT OUTER JOIN #{translations_table_name} ON #{table_name}.id = #{translations_table_name}.#{reflections["translations"].foreign_key} AND #{translations_table_name}.locale='#{I18n.locale }'") }

    private

      def searchable_globalized_values
        values = {}
        translations.each do |translation|
          Mobility.with_locale(translation.locale) do
            values.merge! searchable_translations_definitions
          end
        end
        values
      end
  end

  class_methods do
    def validates_translation(method, options = {})
      validates(method, options.merge(if: lambda { |resource| resource.translations.blank? }))
      if options.include?(:length)
        lenght_validate = { length: options[:length] }
        translation_class.instance_eval do
          validates method, lenght_validate.merge(if: lambda { |translation| translation.locale == I18n.default_locale })
        end
        if options.count > 1
          translation_class.instance_eval do
            validates method, options.reject { |key| key == :length }
          end
        end
      else
        translation_class.instance_eval { validates method, options }
      end
    end

    def translation_class_delegate(method)
      translation_class.instance_eval { delegate method, to: :globalized_model }
    end
  end
end
