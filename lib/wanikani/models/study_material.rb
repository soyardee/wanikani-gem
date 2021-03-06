# -*- encoding : utf-8 -*-
module Wanikani
  module StudyMaterial
    extend Wanikani::Shared

    PERMITTED_PARAMS = %w[ids hidden subject_ids subject_types updated_after page_after_id page_before_id].freeze

    def self.find_all
      find_by
    end

    def self.find_by(parameters = {})
      respond(client.get('study_materials', parameters))
    end

    def self.find(id)
      respond(client.get("study_materials/#{id}"))
    end

    def self.permitted_params
      PERMITTED_PARAMS
    end
  end
end
