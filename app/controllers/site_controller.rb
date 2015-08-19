class SiteController < ApplicationController
  def index
    @thing = $redis.get(:thing) || 'no thing'
  end
end
