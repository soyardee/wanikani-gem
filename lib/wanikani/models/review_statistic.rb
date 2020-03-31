# -*- encoding : utf-8 -*-
module Wanikani
  module ReviewStatistic
    class << self
      def find_by(parameters = {})
        # hidden
        # ids
        # percentages_greater_than
        # percentages_less_than
        # subject_ids
        # subject_types
        # updated_after
        # page_after_id
        # page_before_id

        respond(client.get('review_statistics', parameters))
      end

      def find(id)
        respond(client.get("review_statistics/#{id}"))
      end

      private

      def respond(json)
        Response.new(json)
      end

      def client
        @client ||= ::Wanikani::ApiV2::Client.new(::Wanikani.config.to_hash)
      end
    end
  end
end
