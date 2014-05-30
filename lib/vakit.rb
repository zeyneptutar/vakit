require "vakit/version"
require 'vakit/connect'
require 'nokogiri'
require 'open-uri'
require 'chronic'
require 'time_diff'

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

    nowDate = Time.now
    sabahDate = Chronic.parse(self.sabah)
    aksamDate = Chronic.parse(self.aksam)
    norm_date = Date.today

    parsedSabah = Time.parse("#{norm_date} #{sabahDate.strftime "%H:%M:%S"}")
    parsedAksam = Time.parse("#{norm_date} #{aksamDate.strftime "%H:%M:%S"}")
    parsedNow= Time.parse("#{norm_date} #{nowDate.strftime "%H:%M:%S"}")

    kerahatSabah = parsedSabah + 45*60
    kerahatAksam = parsedAksam - 45*60

    if (parsedSabah < parsedNow && kerahatSabah > parsedNow)
      puts "Sabah kerahat vakti. Saat " + nowDate.strftime("%I:%M %p") 

    elsif (parsedAksam > parsedNow && kerahatAksam < parsedNow)
      puts "Aksam kerahat vakti. Saat " + nowDate.strftime("%I:%M %p") 

    else 
      puts "Kerahat vakti degil. Saat " + nowDate.strftime("%I:%M %p") 
    end


  end

end
