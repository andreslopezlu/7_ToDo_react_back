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
        @successfully_created = @todo_list.save
      end

      def destroy
        @successfully_deleted = true
        @todo_list = current_user.todo_lists.find(params[:id])
        return if @todo_list.destroy

        @successfully_deleted = false

      rescue ActiveRecord::RecordNotFound => e
        @successfully_deleted = false
        @error = "Couldn't find the todo list"
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

      def todo_list_params
        params.require(:todo_list).permit(:title)
      end
    end
  end
end
