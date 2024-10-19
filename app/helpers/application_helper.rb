# frozen_string_literal: true

module ApplicationHelper
  def flash_message_class(level)
    alerts = {
      notice: "success",
      alert: "danger",
      error: "danger"
    }

    alerts[level.to_sym]
  end
end
