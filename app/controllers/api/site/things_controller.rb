module Api
  module Site
    class ThingsController < ApplicationController
      def create
        thing_value = params[:data][:value]
        $redis.set :thing, thing_value
        response_payload = {
          data: {
            type: 'things',
            value: thing_value
          }
        }
        render :ok, json: response_payload
      end
    end
  end
end
