require "rails_helper"

RSpec.describe YandexNewsItem, type: :model do
  context 'attr accessors' do
    subject { described_class.current }

    before do
      allow_any_instance_of(YandexNewsService).to receive(:perform).and_return(YANDEX_NEWS_HASH)
    end

    it { expect(subject.title).to eq YANDEX_NEWS_HASH[:title] }
    it { expect(subject.description).to eq YANDEX_NEWS_HASH[:description] }
    it { expect(subject.created_at).to eq YANDEX_NEWS_HASH[:created_at] }
  end
end