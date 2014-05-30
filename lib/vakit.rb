require "vakit/version"
require 'vakit/connect'
require 'nokogiri'
require 'open-uri'

module Vakit
  
  def self.today
  	Vakit::Connect.shaber
  end

  def self.imsak
  	Vakit::Connect.shaber[:imsak]
  end

  def self.sabah
  	Vakit::Connect.shaber[:sabah]
  end

  def self.oglen
  	Vakit::Connect.shaber[:oglen]
  end

  def self.ikindi
  	Vakit::Connect.shaber[:ikindi]
  end

  def self.aksam
  	Vakit::Connect.shaber[:aksam]
  end

  def self.yatsi
  	Vakit::Connect.shaber[:yatsi]
  end

  def self.kerahat?
    time=Time.new
    
    imsak_time=Time.parse(Connect.shaber[:imsak])
    
    aksam_time=Time.parse(Connect.shaber[:aksam])

    if TimeDifference.between(time,imsak_time).in_hours > 0.45 &&  TimeDifference.between(time,aksam_time).in_hours > 0.45
      
      puts "Saat su an #{Time.now.strftime("%H:%M")}. Kerahat vakti degil. Sunneti kilmayi unutmayin."
    
    else
    
      puts "Saat su an #{Time.now.strftime("%H:%M")}. Su an kerahat vaktindeyiz"
    end
  end
end
