require 'logger'
module Vakit
	
	class VakitLog

		class << self

			def create_logger
				@logger = Logger.new("log/vakit.log","daily")
				@logger.datetime_format = "%Y-%m-%d %H:%M:%S"
				return @logger
			end

			def logger
				@vakit_logger ||=self.create_logger 
			end

			def info(msg)
				puts msg
				self.logger.info(msg)
			end

		end
	
	end


end