require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Relations' do
    it { is_expected.to have_many :posts }
  end

  describe 'validations' do
    describe 'name' do
      context 'presence' do
        it { is_expected.to validate_presence_of :name }
      end

      context 'length' do
        it { is_expected.to validate_length_of(:name).is_at_most(255) }
      end
    end
  end
end
