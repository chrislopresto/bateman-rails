class SiteController < ApplicationController
  def index
    @thing = $redis.get(:thing) || 'no thing'
    get_ember_asset_paths 'bateman-ember'
  end

  private

  def get_ember_asset_paths(app_name)
    manifest_id = params[:manifest_id]

    if manifest_id.blank?
      current_manifest_key = "#{app_name}:index:current"
      manifest_id = $redis.get(current_manifest_key)
    end

    raise "Invalid manifest_id #{manifest_id}" unless manifest_id =~ /\A(dev|test|[0-9a-f]{32})\Z/i

    index_key = "#{app_name}:index:#{manifest_id}"

    index_json = JSON.parse $redis.get(index_key)
    @meta = index_json['meta'].first
    @links = index_json['link']
    @scripts = index_json['script']
  end
end
