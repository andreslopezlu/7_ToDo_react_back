module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate_user!
      before_action :set_current_user

      private

      attr_reader :current_user

      def set_current_user
        jwt_payload = JWT.decode(
          request.headers['Authorization'].split(' ').last,
          ENV['DEVISE_JWT_SECRET_KEY']
        ).first

        @current_user = User.find(jwt_payload['sub'])
      end
    end
  end
end
