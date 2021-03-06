# frozen_string_literal: true

module Ougai::Formatters::ForJson
  def dump(data)
    return data unless @jsonize
    convert_time(data)
    str = begin
            @serializer.serialize(data)
          rescue Encoding::UndefinedConversionError => ex
            data[:msg] = ex.to_s
            @serializer.serialize(data)
          end
    str << "\n" if @with_newline
    str
  end
end
