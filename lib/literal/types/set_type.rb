# frozen_string_literal: true

class Literal::Types::SetType
	include Literal::Type

	def initialize(type)
		@type = type
	end

	def inspect = "_Set(#{@type.inspect})"

	if Literal::EXPENSIVE_TYPE_CHECKS
		def ===(value)
			Set === value && value.all? { |item| @type === item }
		end
	else
		def ===(value)
			Set === value && @type === value.first
		end
	end
end
