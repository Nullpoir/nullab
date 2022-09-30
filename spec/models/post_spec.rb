require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Relations' do
    it { is_expected.to have_many :tags }
  end

  describe 'validations' do
    describe 'title' do
      context 'presence' do
        it { is_expected.to validate_presence_of :title }
      end

      context 'length' do
        it { is_expected.to validate_length_of(:title).is_at_most(255) }
      end
    end
  end
end
