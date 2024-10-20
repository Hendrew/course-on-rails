# frozen_string_literal: true

module Utils
  module SizeInHumanFormat
    extend self

    def call(size)
      case size
      when 0..1023
        "#{size} bytes"
      when 1024..(1024**2 - 1)
        "#{kilobytes(size)} KB"
      when (1024**2)..(1024**3 - 1)
        "#{megabytes(size)} MB"
      else
        "#{gigabytes(size)} GB"
      end
    end

    private

    def kilobytes(size) = (size.to_f / 1024).round(2)
    def megabytes(size) = (size.to_f / 1024**2).round(2)
    def gigabytes(size) = (size.to_f / 1024**3).round(2)
  end
end
