class SiteController < ApplicationController
  include EmberAppFromRedis
  ember_app 'bateman-ember'
end
