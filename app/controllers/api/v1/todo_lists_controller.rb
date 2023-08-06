module Api
  module V1
    class TodoListsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_current_user

      def index
        @todo_lists = current_user.todo_lists
      end

      def create
        @todo_list = current_user.todo_lists.build(todo_list_params)
        return failed_creation unless @todo_list.save
      end

      def destroy
        @todo_list = current_user.todo_lists.find(params[:id])
        @todo_list.destroy
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
    end
  end
end
