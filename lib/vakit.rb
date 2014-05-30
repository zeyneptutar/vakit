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

  def self.vakit?
    time=Time.now
    
    Connect.shaber.each_cons(2) do |(k,v),(k2,v2)| 
      
      start_time=time
      
      end_time=Time.parse(v)
      
      remain_time=TimeDifference.between(start_time,end_time).in_hours
      
      if (time.hour - v.to_i) > 0 && (time.hour - v2.to_i) < 0
        
        puts "Su an #{k} vaktindeyiz. #{k2} namazina kalan sure: #{remain_time}"
    end
   end
  end
end
