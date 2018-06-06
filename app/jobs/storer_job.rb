class StorerJob < ActiveJob::Base
  queue_as :default

  def perform(key, value)
    Store.create(key: key, value: value)
  end
end
