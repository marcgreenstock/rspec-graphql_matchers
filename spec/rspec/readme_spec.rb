require 'spec_helper'
require 'pry'

describe 'The readme Examples' do
  ruby_code_regex = /```ruby(.*?)```/m
  readme_content = File.read(
    File.expand_path(
      '../../../README.md',
      __FILE__
    )
  )

  before do
    GraphQL::Field.accepts_definitions(
      admin_only: GraphQL::Define.assign_metadata_key(:admin_only)
    )
  end

  readme_content.scan(ruby_code_regex) do |ruby_code|
    eval(ruby_code[0])
  end
end
