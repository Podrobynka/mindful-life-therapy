module HasTranslations
  extend ActiveSupport::Concern

  def translation_for key, attr
    I18n.t("#{key}.#{self.class.name.underscore}.#{attr}")
  end
end
