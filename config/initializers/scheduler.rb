require 'rufus-scheduler'

::CurrentScheduler = Rufus::Scheduler.new

::CurrentScheduler.every '15m' do
  NewsItemBroadcastJob.perform_later unless NewsItem.current_item
end