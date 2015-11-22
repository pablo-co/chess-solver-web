module ApplicationHelper
  def enum_for_select(klass, enum)
    klass.send(enum.pluralize).map do |key, _|
      [I18n.t("model.#{klass.to_s.downcase}.#{enum}.#{key}"), key]
    end
  end
end
