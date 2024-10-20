# frozen_string_literal: true

module Courses
  class Report
    MAPPED_FORMAT = {
      "csv" => Generate::Report::AsCsv,
      "pdf" => Generate::Report::AsPdf
    }.freeze

    def initialize(format:)
      @format = format
    end

    def call
      return { message: "Invalid format" } if invalid_format?

      MAPPED_FORMAT[@format].call
    end

    private

    def invalid_format?
      MAPPED_FORMAT.keys.exclude?(@format)
    end
  end
end
