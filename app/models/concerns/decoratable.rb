module Decoratable
  def decorate(view_context)
    "#{model_name.name}Decorator".constantize.new(view_context, self)
  end
end