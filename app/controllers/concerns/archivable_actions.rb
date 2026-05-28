# frozen_string_literal: true

module ArchivableActions
  extend ActiveSupport::Concern

  def archive
    resource = get_resource
    current_policy.authorize! :archive, resource
    resource.archive!
    redirect_back fallback_location: after_resource_updated_path(resource), notice: t("actions.archived")
  end

  def unarchive
    resource = get_resource
    current_policy.authorize! :unarchive, resource
    resource.unarchive!
    redirect_back fallback_location: after_resource_updated_path(resource), notice: t("actions.unarchived")
  end
end
