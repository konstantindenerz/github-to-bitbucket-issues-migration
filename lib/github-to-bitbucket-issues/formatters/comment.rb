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
          :user => get_user(@raw)
        }
      end

      private

      def get_user(issue)
        UserMapping.get()[issue.user.login] if issue.user && issue.user.login && UserMapping.get()[issue.user.login]
      end

      def get_issue(comment)
        comment.issue_url.split('/').last
      end

    end
  end
end
