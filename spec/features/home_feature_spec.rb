require "rails_helper"

RSpec.describe 'HomeFeature' do
  describe "with nonexpired news item", type: :feature do
    let!(:news_item) { create :news_item }

    it do
      visit root_path
      
      expect(page).to have_content news_item.title
      expect(page).to have_content news_item.created_at.strftime('%d-%m-%Y %H:%M')
      expect(page).to have_content news_item.description
    end
  end

  describe "with NO news item", type: :feature do
    it do
      allow_any_instance_of(YandexNewsService).to receive(:perform).and_return(YANDEX_NEWS_HASH)
      ya_news = YandexNewsItem.current
      visit root_path

      expect(page).to have_content ya_news.title
      expect(page).to have_content ya_news.created_at.strftime('%d-%m-%Y %H:%M')
      expect(page).to have_content ya_news.description
    end
  end
end
