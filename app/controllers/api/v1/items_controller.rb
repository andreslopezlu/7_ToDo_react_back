module Api
  module V1
    class ItemsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_current_user

      def index
        @items = todo_list.items
      end

      def create
        @item = todo_list.items.build(item_params)
        @item.save
      end

      private

      attr_reader :current_user

      def set_current_user
        jwt_payload = JWT.decode(
          request.headers['Authorization'].split(' ').last,
          ENV['DEVISE_JWT_SECRET_KEY']
        ).first

        @current_user = User.find(jwt_payload['sub'])
      end

      def failed_creation
        render json: {
          status: 422,
          message: 'Todo list could not be created.',
          errors: @todo_list.errors.full_messages.join(', ')
        }, status: :unprocessable_entity
      end

      def todo_list_params
        params.require(:todo_list).permit(:title)
      end

      def item_params
        params.require(:item).permit(:description)
      end

      def todo_list
        @todo_list ||= current_user.todo_lists.find(params[:todo_list_id])
      end
    end
  end
end
