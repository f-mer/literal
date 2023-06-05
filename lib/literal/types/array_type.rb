# frozen_string_literal: true

class Literal::Types::ArrayType
	include Literal::Type

	def initialize(type)
		@type = type
	end

	def inspect = "_Array(#{@type.inspect})"

	if Literal::EXPENSIVE_TYPE_CHECKS
		def ===(value)
			Array === value && value.all? { |item| @type === item }
		end
	else
		def ===(value)
			Array === value && @type === value[0]
		end
	end
end
