require 'vakit/version'
require 'vakit/connect'
require 'vakit/vakit_log'
require 'nokogiri'
require 'open-uri'

module Vakit

  LOGGER = Vakit::VakitLog
  
  def self.today
    LOGGER.info("Gunluk namaz vakitleri goruntulendi ")
    Vakit::Connect.shaber

  end

  def self.imsak
    LOGGER.info("Imsak vakti goruntulendi")
    Vakit::Connect.shaber[:imsak]
  end

  def self.sabah
     LOGGER.info("Sabah vakti goruntulendi")
     Vakit::Connect.shaber[:sabah]
  end

  def self.oglen
     LOGGER.info("Oglen vakti goruntulendi")
     Vakit::Connect.shaber[:oglen]
  end

  def self.ikindi
     LOGGER.info("Ikindi vakti goruntulendi")
     Vakit::Connect.shaber[:ikindi]
  end

  def self.aksam
     LOGGER.info("Aksam vakti goruntulendi")
     Vakit::Connect.shaber[:aksam]
  end

  def self.yatsi
     LOGGER.info("Yatsi vakti goruntulendi")
     Vakit::Connect.shaber[:yatsi]
  end

  def self.kerahat?
      time=Time.now
      sabah=Time.parse(Connect.shaber[:sabah])
      aksam=Time.parse(Connect.shaber[:aksam])
      kerahat_sabah=sabah + 45*60
      kerahat_aksam=aksam - 45*60

      if Time.now > sabah && Time.now < kerahat_sabah
          puts "Saat su an #{Time.now.strftime("%H:%M")}. Sabah kerahat vakti"
        elsif  Time.now < aksam && Time.now > kerahat_aksam
          puts "Saat su an #{Time.now.strftime("%H:%M")}. Aksam kerahat vakti"
        else 
          if self.prayer_time == Connect.shaber[:imsak]
            puts "Saat su an #{Time.now.strftime("%H:%M")}. Kerahat vakti degil. Sabah kerahat vaktine kalan sure #{Time.diff(time, kerahat_sabah, '%h:%m')[:diff]}"
          else
            puts "Saat su an #{Time.now.strftime("%H:%M")}. Kerahat vakti degil. Ikindi kerahat vaktine kalan sure #{Time.diff(time, kerahat_aksam, '%h:%m')[:diff]}"
        end
      end
      LOGGER.info("Kerahat vakti soruldu")
  end
   
   def self.prayer_time 
     Connect.shaber.each_cons(2) do |(k,v), (k2,v2)|
      if (Time.now - Time.parse(v)) > 0 && (Time.now - Time.parse(v2))<0
        return v
      end
    end    
   end

end

