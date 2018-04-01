# frozen_string_literal: true

class BaseDecorator
  attr_reader :view, :object

  delegate :link_to, :content_tag, :content_for, :concat, :icon, :policy, :t,
           :l, :form_with, to: :view
  delegate_missing_to :object

  def initialize(view, object = nil)
    @view = view
    @object = object
  end
end
