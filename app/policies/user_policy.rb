# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  # Admins can't destroy themselves, regular users can only destroy themselves.
  def destroy?
    (user&.admin? && record != user) || (!user&.admin? && record == user)
  end
end
