require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:index) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
