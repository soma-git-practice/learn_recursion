# frozen_string_literal: true

require 'pry'

hash = {
  'ID' => 'id',
  'ステータス' => [
    'status',
    {
      '働いている': 'working',
      '寝ている': 'sleeping',
      '食べている' => [
        'eating',
        { 'ハンバーガー': 'hamburger' }
      ]
    }
  ],
  'name' => '名前'
}

def deephash(argumant, count = 1)
  values = []
  argumant.each do |key, value|
    key = key.to_s
    options = { count: count, key: key }
    if value.is_a?(Array)
      values << { **options, value: value[0].to_s }
      values = values + deephash(value[1], count + 1)
    else
      values << { **options, value: value.to_s }
    end
  end
  values
end

data = deephash hash

data.each do |item|
  indent = "\s\s" * item[:count]
  puts indent + item[:key]
  puts indent + item[:value]
end