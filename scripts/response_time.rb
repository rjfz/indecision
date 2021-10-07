# frozen_string_literal: true

require 'rest-client'
require 'benchmark'

class Average
  attr_reader :url, :repetition

  def initialize(url, repetition = 50)
    @url = url
    @repetition = repetition
  end

  def call
    total / repetition
  end

  private

  def total
    Benchmark.measure do
      repetition.times { request }
    end
  end

  def request
    RestClient.get(url)
  end
end

puts Average.new(ARGV[0], ARGV[1].to_i).call
