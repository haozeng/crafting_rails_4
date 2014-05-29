require "mongoid"
require "mongo_metrics/engine"
require "active_support/notifications"

module MongoMetrics
  EVENT = "process_action.action_controller"
  ActiveSupport::Notifications.subscribe EVENT do |*args|
    MongoMetrics::Metric.store!(args)
  end

  def self.mute!
    Thread.current['sql_metrics.mute'] = true
    yield
  ensure
    Thread.current['sql_metrics.mute'] = false
  end

  def self.mute?
    Thread.current['sql_metrics.mute'] || false
  end

end
