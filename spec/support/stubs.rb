YANDEX_NEWS_HASH = {
  title: 'Yandex stubbed news title', description: 'Yandex stubbed news description', created_at: Time.now
}

YANDEX_NEWS_RESPONSE = %(var m_index = [{"time":"10:24","date":"09.11.2017","ts":"#{Time.now.to_i}","url":"https://news.yandex.ru","title":"#{YANDEX_NEWS_HASH[:title]}","descr":"#{YANDEX_NEWS_HASH[:title]}"},{"time":"09:12","date":"09.11.2017","ts":"1510207920","url":"https://news.yandex.ru/","title":"Test","descr":"Test"}]; var update_time='13:21';)
