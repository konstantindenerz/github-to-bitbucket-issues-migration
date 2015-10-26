module GTBI
  module Formatters
    class Comment < Base
      def formatted
        {
          :content => @raw.body,
          :created_on => @raw.created_at,
          :id => @raw.id,
          :issue => get_issue(@raw),
          :updated_on => @raw.updated_at,
          :user => UserMapping.get()[@raw.user.login] if @raw.user.login && UserMapping.get()[@raw.user.login]
        }
      end

      private

      def get_issue(comment)
        comment.issue_url.split('/').last
      end

    end
  end
end
