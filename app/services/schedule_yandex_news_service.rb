class ScheduleYandexNewsService
  def call
    NewsItemBroadcastJob.perform_later unless NewsItem.current
  end
end
