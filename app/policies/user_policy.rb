# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  # Can't destroy itself, for obvious reasons
  def destroy?
    user&.admin? || record != user
  end
end
