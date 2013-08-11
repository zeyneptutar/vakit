require "vakit/version"
require 'vakit/connect'
require 'Nokogiri'
require 'open-uri'

module Vakit

	def initialize
		@vakit ||= Vakit::Connect.shaber
	end	
  
  def self.today
  	@vakit
  end

  def self.imsak
  	@vakit[:imsak]
  end

  def self.sabah
  	@vakit[:sabah]
  end

  def self.oglen
  	@vakit[:oglen]
  end

  def self.ikindi
  	@vakit[:ikindi]
  end

  def self.aksam
  	@vakit[:aksam]
  end

  def self.yatsi
  	@vakit[:yatsi]
  end

end
