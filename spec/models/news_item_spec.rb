require "rails_helper"

RSpec.describe NewsItem, type: :model do
  context 'validatons' do
    subject { build(:news_item, attrs) }

    context 'title blank' do
      before { subject.save }
      let(:attrs) { { title: nil } }
      it { expect(subject.valid?).to be_falsey }
      it { expect(subject.errors.messages).to have_key(:title) }
    end

    context 'description blank' do
      before { subject.save }
      let(:attrs) { { description: nil } }
      it { expect(subject.valid?).to be_falsey }
      it { expect(subject.errors.messages).to have_key(:description) }
    end

    context 'expire_at blank' do
      before { subject.save }
      let(:attrs) { { expire_at: nil } }
      it { expect(subject.valid?).to be_falsey }
      it { expect(subject.errors.messages).to have_key(:expire_at) }
    end

    context 'expire_at less than current time' do
      before { subject.save }
      let(:attrs) { { expire_at: Time.now - 1.day } }
      it { expect(subject.valid?).to be_falsey }
      it { expect(subject.errors.messages).to have_key(:expire_at) }
    end
  end
end