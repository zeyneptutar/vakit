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

    if Time.now > Connect.shaber[:imsak] && Time.now < Connect.shaber[:sabah]
    
    puts "Su an Imsak vaktindeyiz.Sabah namazina kalan sure #{Time.diff(Time.now, Connect.shaber[:sabah], '%h:%m')[:diff]}"
    
    elsif Time.now > Connect.shaber[:sabah] && Time.now < Connect.shaber[:oglen]

    puts "Su an Sabah vaktindeyiz.Oglen namazina kalan sure #{Time.diff(Time.now, Connect.shaber[:oglen], '%h:%m')[:diff]}"
    
    elsif Time.now > Connect.shaber[:oglen] && Time.now < Connect.shaber[:ikindi]

    puts "Su an Oglen vaktindeyiz.Ikindi namazina kalan sure #{Time.diff(Time.now, Connect.shaber[:ikindi], '%h:%m')[:diff]}."

    elsif Time.now > Connect.shaber[:ikindi] && Time.now < Connect.shaber[:aksam]
      
    puts "Su an Ikindi vaktindeyiz.Aksam namazina kalan sure #{Time.diff(Time.now, Connect.shaber[:aksam], '%h:%m')[:diff]}"
   
    elsif Time.now > Connect.shaber[:aksam] && Time.now < Connect.shaber[:yatsi]
      
    puts "Su an Aksam vaktindeyiz.Yatsi namazina kalan sure #{Time.diff(Time.now, Connect.shaber[:yatsi], '%h:%m')[:diff]}"
    
    else Time.now > Connect.shaber[:yatsi] && Time.now < Connect.shaber[:imsak]
       
    puts "Su an Yatsi vaktindeyiz.Imsak vaktine kalan sure #{Time.diff(Time.now, Connect.shaber[:imsak], '%h:%m')[:diff]}"

   end
  
     
    
    end
end
