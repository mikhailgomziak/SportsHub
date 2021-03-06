require 'rails_helper'

describe UserPolicy do
  subject(:user) { described_class }

  let(:admin) { build(:user, is_admin: true) }
  let(:regular_user) { build(:user, is_admin: false) }

  permissions :show?, :index? do
    it 'denies access if current user is not admin' do
      expect(user).not_to permit(regular_user, build(:user))
    end

    it 'allow access if current user is admin' do
      expect(user).to permit(admin, build(:user))
    end
  end
end
