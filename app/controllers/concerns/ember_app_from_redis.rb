module EmberAppFromRedis
  extend ActiveSupport::Concern

  MANIFEST_ID_PATTERN = /\A(development|test|[0-9a-f]{32})\Z/i

  module ClassMethods
    attr_reader :ember_app_name

    private

    def ember_app(ember_app_name)
      @ember_app_name = ember_app_name
    end
  end

  included do
    before_filter :setup_app
  end

  def ember_app_name
    self.class.ember_app_name
  end

  def setup_app
    raise "No ember app name specified." unless ember_app_name.present?
    raise "Invalid ember app manifest_id #{manifest_id}" unless manifest_id =~ MANIFEST_ID_PATTERN

    @meta = index_json['meta'].first
    @links = index_json['link']
    @scripts = index_json['script']
  end

  def manifest_id
    @manifest_id ||= params[:manifest_id] || $redis.get("#{ember_app_name}:index:current")
  end

  def index_key
    @index_key ||= "#{ember_app_name}:index:#{manifest_id}"
  end

  def index_json
    @index_json ||= JSON.parse $redis.get(index_key)
  end
end
