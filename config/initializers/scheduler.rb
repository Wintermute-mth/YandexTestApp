require 'rufus-scheduler'

::CurrentScheduler = Rufus::Scheduler.new

::CurrentScheduler.every '15m' do
  ScheduleYandexNewsService.new.call
end